use std::{
    collections::{HashMap, VecDeque},
    process,
    sync::{
        self,
        atomic::{self, AtomicBool},
        Arc,
    },
    thread::{self, ThreadId},
    time,
};

use anyhow::{anyhow, Result};
use bytes::Bytes;
use cephalopod_cli::ast::{self, StringTy};
use chrono::{DateTime, Local};
use egui::{Color32, RichText, Ui, Widget};
use futures::TryStreamExt;
use tokio::{
    select,
    sync::{
        mpsc::{self, Sender},
        oneshot,
    },
};

const DEFAULT_FIREHOSE_URL: &'static str =
    "wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos";

#[derive(Default, Clone, Debug, PartialEq, Eq)]
enum Screen {
    #[default]
    Main,
    Lexicons,
}

#[derive(Debug, Clone)]
pub struct FirehoseMessage {
    time: DateTime<Local>,
    data: Bytes,
}

/// Send URL to connect to
struct FirehoseSendConnect {
    tx: Sender<String>,
}

#[derive(Default, Debug, Eq, PartialEq, Clone)]
enum FirehoseStatus {
    #[default]
    Disconnected,
    Connecting(time::Instant),
    Connected(time::Instant),
    Failed(Arc<String>),
}

#[derive(Default)]
struct FirehoseShared {
    url: String,
    messages: VecDeque<FirehoseMessage>,
    /// Max number of messages
    size_limit: usize,
    status: FirehoseStatus,
}

struct FirehoseState {
    _tokio_thread: ThreadId,
    tx_stop: oneshot::Sender<()>,
}

#[derive(Default)]
struct App {
    screen: Screen,
    lexicons: Vec<ast::Lexicon>,
    search: String,
    firehose: Arc<sync::Mutex<FirehoseShared>>,
    firehose_st: Option<Box<FirehoseState>>,
    /// Send URL to connect to
    firehose_connect: Option<FirehoseSendConnect>,
    show_settings: bool,
    show_log: bool,
}

fn render_optional(lbl: &str, str: &Option<String>, ui: &mut Ui) {
    if let Some(d) = str {
        ui.horizontal(|ui| {
            ui.label(lbl);
            ui.label(": ");
            ui.add(egui::Label::new(d).wrap());
        });
    }
}

fn render_descr(d: &Option<String>, ui: &mut Ui) {
    render_optional("descr", d, ui)
}

fn bold_green(s: &str) -> egui::RichText {
    egui::RichText::new(s).strong().color(Color32::DARK_GREEN)
}

fn render_type(ty: &ast::Type, ui: &mut egui::Ui) {
    ui.vertical(|ui| match ty {
        ast::Type::Null { description } => {
            ui.label(bold_green("null"));
            render_descr(description, ui);
        }
        ast::Type::Boolean {
            default: _,
            description,
        } => {
            ui.label(bold_green("bool"));
            render_descr(description, ui);
        }
        ast::Type::Integer {
            description,
            minimum: _,
            maximum: _,
            enum_: _,
            default: _,
            const_: _,
        } => {
            ui.label(bold_green("int"));
            render_descr(description, ui);
        }
        ast::Type::String(StringTy {
            description,
            format,
            minLength: _,
            maxLength: _,
            enum_: _,
            default: _,
            const_,
            knownValues,
        }) => {
            ui.label(bold_green("string"));
            render_descr(description, ui);
            if let Some(f) = format {
                ui.label(format!("format: {:?}", f));
            }
            render_optional("default", const_, ui);
            if let Some(v) = knownValues {
                ui.label(format!("knownValues: {:?}", v));
            }
        }

        ast::Type::Bytes {
            description,
            minLength: _,
            maxLength: _,
        } => {
            ui.label(bold_green("bytes"));
            render_descr(description, ui);
        }
        ast::Type::Blob {
            description,
            accept,
            maxSize: _,
        } => {
            ui.label(bold_green("blob"));
            render_descr(description, ui);
            if let Some(a) = accept {
                ui.horizontal(|ui| {
                    ui.label("accept");
                    ui.label(": ");
                    ui.add(egui::Label::new(format!("{a:?}")).wrap());
                });
            }
        }
        ast::Type::Token(tok) => {
            ui.label(bold_green("token"));
            render_descr(&tok.description, ui);
        }
        ast::Type::CidLink { description } => {
            ui.label(bold_green("cid-link"));
            render_descr(description, ui);
        }
        ast::Type::Array {
            items,
            minLength: _,
            maxLength: _,
        } => {
            ui.label(bold_green("array"));
            egui::CollapsingHeader::new("items").show(ui, |ui| {
                ui.push_id("array", |ui| render_type(items, ui));
            });
        }
        ast::Type::Object(o) => {
            render_object(o, ui);
        }
        ast::Type::Ref { ref_ } => {
            ui.horizontal(|ui| {
                ui.label(bold_green("ref"));
                ui.label(": ");
                ui.label(ref_);
            });
        }
        ast::Type::Union(u) => {
            ui.label(bold_green("union"));
            for r in &u.refs {
                ui.label(r);
                ui.label(" ");
            }
        }
        ast::Type::Unknown => {
            ui.colored_label(egui::Color32::RED, "unknown");
        }
    });
}

fn render_properties(props: &HashMap<String, ast::Type>, ui: &mut egui::Ui) {
    ui.push_id(&props as *const _, |ui| {
        ui.vertical(|ui| {
            for (name, v) in props.iter() {
                ui.push_id(name, |ui| {
                    ui.horizontal(|ui| {
                        ui.label(RichText::new(name).underline());
                        ui.label(": ");
                        render_type(v, ui);
                    });
                });
            }
        });
    });
}

fn render_params(d: &Option<ast::Params>, ui: &mut Ui) {
    if let Some(d) = d {
        ui.horizontal(|ui| {
            egui::CollapsingHeader::new(RichText::new("params").color(Color32::DARK_BLUE)).show(
                ui,
                |ui| {
                    ui.push_id("params", |ui| {
                        ui.vertical(|ui| {
                            render_properties(&d.properties, ui);
                            render_required(&d.required, ui);
                        })
                    })
                },
            );
        });
    }
}

fn render_io(d: &Option<ast::InputOrOutput>, name: &str, ui: &mut Ui) {
    if let Some(d) = d {
        ui.horizontal(|ui| {
            egui::CollapsingHeader::new(egui::RichText::new(name).color(Color32::DARK_BLUE)).show(
                ui,
                |ui| {
                    ui.push_id(name, |ui| {
                        ui.vertical(|ui| {
                            render_descr(&d.description, ui);
                            ui.label(format!("encoding: {:?}", d.encoding));
                            if let Some(ty) = &d.schema {
                                ui.horizontal(|ui| {
                                    ui.label("schema: ");
                                    render_type(&ty, ui);
                                });
                            }
                        })
                    })
                },
            );
        });
    }
}

fn render_errors(errs: &Option<Vec<ast::Error>>, ui: &mut Ui) {
    if let Some(errs) = errs {
        ui.horizontal(|ui| {
            egui::CollapsingHeader::new(egui::RichText::new("errors").color(Color32::DARK_BLUE))
                .show(ui, |ui| {
                    ui.push_id("errors", |ui| {
                        ui.vertical(|ui| {
                            ui.indent("", |ui| {
                                for e in errs {
                                    ui.horizontal(|ui| {
                                        ui.push_id(&e.name, |ui| {
                                            ui.label(&e.name);
                                            render_descr(&e.description, ui);
                                        });
                                    });
                                }
                            });
                        });
                    });
                });
        });
    }
}

fn render_message(m: &Option<ast::Message>, ui: &mut Ui) {
    if let Some(m) = m {
        ui.horizontal(|ui| {
            egui::CollapsingHeader::new(RichText::new("message").color(Color32::DARK_BLUE)).show(
                ui,
                |ui| {
                    ui.push_id("message", |ui| {
                        render_descr(&m.description, ui);
                        render_type(&m.schema, ui);
                    });
                },
            );
        });
    }
}

fn render_object(o: &ast::Object, ui: &mut egui::Ui) {
    egui::CollapsingHeader::new(bold_green("object")).show(ui, |ui| {
        ui.push_id("object", |ui| {
            render_properties(&o.properties, ui);
            render_required(&o.required, ui);
        });
    });
}

fn render_required(req: &Option<Vec<String>>, ui: &mut egui::Ui) {
    if let Some(req) = req {
        ui.horizontal(|ui| {
            let mut res = "required: [".to_string();
            for (i, s) in req.iter().enumerate() {
                if i > 0 {
                    res += ", "
                }
                res += s
            }
            res += "]";
            ui.label(res)
        });
    }
}

fn render_def(def: &ast::Def, ui: &mut egui::Ui) {
    match def {
        ast::Def::Query(q) => {
            ui.label("query: ");
            render_descr(&q.description, ui);
            render_params(&q.parameters, ui);
            render_io(&q.output, "output", ui);
            render_errors(&q.errors, ui);
        }
        ast::Def::Procedure(p) => {
            ui.label("procedure: ");
            render_descr(&p.description, ui);
            render_params(&p.parameters, ui);
            render_io(&p.input, "input", ui);
            render_io(&p.output, "output", ui);
            render_errors(&p.errors, ui);
        }
        ast::Def::Record(r) => {
            ui.label("record: ");
            render_descr(&r.description, ui);
            ui.horizontal(|ui| {
                ui.label("key: ");
                ui.label(&r.key);
            });
            render_object(&r.record, ui);
        }
        ast::Def::Subscription(sub) => {
            ui.label("subscription: ");
            render_descr(&sub.description, ui);
            render_params(&sub.parameters, ui);
            render_message(&sub.message, ui);
            render_errors(&sub.errors, ui);
        }
        ast::Def::Object(o) => {
            egui::Frame::default()
                .stroke(egui::Stroke::new(2., egui::Color32::BLUE))
                .outer_margin(3.)
                .inner_margin(2.)
                .show(ui, |ui| {
                    render_object(o, ui);
                });
        }
        ast::Def::Type(ty) => {
            render_type(ty, ui);
        }
    };
}

fn render_lexicon(l: &ast::Lexicon, ui: &mut Ui) {
    egui::Frame::default()
        .stroke(egui::Stroke::new(2., egui::Color32::DARK_GREEN))
        .outer_margin(3.)
        .inner_margin(2.)
        .show(ui, |ui| {
            ui.push_id(&l.id, |ui| {
                ui.vertical(|ui| {
                    ui.add(egui::Label::new(
                        egui::RichText::new(&l.id).strong().underline(),
                    ));
                    render_descr(&l.description, ui);

                    for (name, def) in &l.defs {
                        ui.push_id(name, |ui| {
                            egui::Frame::default()
                                .stroke(egui::Stroke::new(2., Color32::GRAY))
                                .inner_margin(2.)
                                .outer_margin(3.)
                                .show(ui, |ui| {
                                    ui.vertical(|ui| {
                                        ui.indent(2, |ui| {
                                            ui.horizontal(|ui| {
                                                ui.label(RichText::new(name).underline());
                                                ui.label(": ");
                                            });
                                            render_def(def, ui);
                                        });
                                    });
                                });
                        });
                    }
                })
            })
        });
}

async fn connect_ws(
    firehose: &Arc<sync::Mutex<FirehoseShared>>,
    ctx: &mut egui::Context,
    url: String,
    mut rx_stop: &mut oneshot::Receiver<()>,
) -> Result<()> {
    log::info!("connecting to {url:?}");
    let _span = tracing::info_span!("connecting to {url}");

    firehose.lock().unwrap().status = FirehoseStatus::Connecting(time::Instant::now());

    use tokio_tungstenite::connect_async;
    use tokio_tungstenite::tungstenite::client::IntoClientRequest;
    use tokio_tungstenite::tungstenite::Message;

    let request = url.into_client_request()?;
    let (mut stream, response) = connect_async(request).await?;
    log::info!("websocket handhake response is {response:?}");

    firehose.lock().unwrap().status = FirehoseStatus::Connected(time::Instant::now());
    ctx.request_repaint();

    // TODO: a way to interrupt this. A channel??

    while let Some(msg) = select! {
        res = stream.try_next() => res,
        res = &mut rx_stop => { res?; Ok(None) }
    }? {
        match msg {
            Message::Binary(data) => {
                log::debug!("got {}B of data from firehose", data.len());
                let msg = FirehoseMessage {
                    data,
                    time: Local::now(),
                };

                {
                    // push message
                    let mut firehose = firehose.lock().unwrap();
                    firehose.messages.push_back(msg);

                    while firehose.messages.len() > firehose.size_limit {
                        firehose.messages.pop_front();
                    }
                    ctx.request_repaint();
                }
            }
            Message::Ping(_) | Message::Pong(_) => (),
            Message::Text(s) => log::debug!("unexpected text frame with {s:?}"),
            Message::Frame(_) => unreachable!(),
            Message::Close(_) => break,
        }
    }
    let _ = stream.close(None);

    Ok(())
}

static CRYPTO_SETUP: AtomicBool = AtomicBool::new(false);

fn start_tokio_idempotent(app: &mut App, mut ctx: egui::Context) -> &FirehoseSendConnect {
    assert!(app.firehose_connect.is_none());

    let (tx_connect, mut rx_connect) = mpsc::channel(100);
    let (tx_stop, mut rx_stop) = oneshot::channel();

    let shared = app.firehose.clone();
    ctx.request_repaint();

    let th = thread::spawn(move || {
        let _span = tracing::info_span!("Tokio thread");
        let rt = tokio::runtime::Runtime::new().unwrap();

        rt.block_on(async move {
            // setup crypto but only once
            if !CRYPTO_SETUP.swap(true, atomic::Ordering::SeqCst) {
                rustls::crypto::ring::default_provider()
                    .install_default()
                    .expect("Failed to install default rustls crypto provider");
            }

            while let Some(url) = rx_connect.recv().await {
                if let Err(err) = connect_ws(&shared, &mut ctx, url, &mut rx_stop).await {
                    log::error!("Connection errored: {err}");
                    let msg = Arc::new(format!("Connection errored: {err}"));
                    shared.lock().unwrap().status = FirehoseStatus::Failed(msg);
                } else {
                    shared.lock().unwrap().status = FirehoseStatus::Disconnected;
                }
                ctx.request_repaint();
            }
        });
    });

    // store this in the app
    let connect = FirehoseSendConnect { tx: tx_connect };
    app.firehose_connect = Some(connect);

    app.firehose_st = Some(Box::new(FirehoseState {
        _tokio_thread: th.thread().id(),
        tx_stop,
    }));

    app.firehose_connect.as_ref().unwrap()
}

fn render_main(app: &mut App, ctx: &egui::Context, ui: &mut egui::Ui) {
    // let "wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos"
    ui.vertical(|ui| {
        ui.allocate_space([ui.available_width(), 0.].into());
        let mut status: FirehoseStatus = FirehoseStatus::Disconnected;

        // top bar for firehose
        egui::Frame::default()
            .stroke(egui::Stroke::new(2., Color32::GRAY))
            .inner_margin(2.)
            .outer_margin(3.)
            .show(ui, |ui| {
                ui.horizontal(|ui| {
                    ui.label("firehose: ");

                    {
                        // hold lock only while editing
                        let mut firehose = app.firehose.lock().unwrap();
                        status = firehose.status.clone();

                        egui::TextEdit::singleline(&mut firehose.url)
                            .hint_text("URL for firehose")
                            .min_size([100., 15.].into())
                            .clip_text(false)
                            .show(ui);

                        if firehose.url != DEFAULT_FIREHOSE_URL && ui.button("reset URL").clicked()
                        {
                            firehose.url = DEFAULT_FIREHOSE_URL.to_string();
                        }
                        if !firehose.messages.is_empty() && ui.button("clear").clicked() {
                            firehose.messages.clear();
                        }
                    }

                    // connect/cancel
                    if app.firehose_connect.is_none() {
                        if ui.button("connect").clicked() {
                            log::info!("Connecting...");

                            let url = app.firehose.lock().unwrap().url.clone();
                            let connector = start_tokio_idempotent(app, ctx.clone());
                            connector
                                .tx
                                .blocking_send(url)
                                .expect("Sending URL to connect to");
                        }
                    } else if app.firehose_st.is_some() {
                        if ui.button("cancel").clicked() {
                            // cancel and remove
                            app.firehose_connect = None;
                            let conn = app.firehose_st.take().unwrap();
                            let _ = conn.tx_stop.send(());
                        }
                    }
                });

                ui.horizontal(|ui| {
                    ui.label("Buffer size: ");

                    let mut firehose = app.firehose.lock().unwrap();
                    egui::Slider::new(&mut firehose.size_limit, 0..=1024).ui(ui);
                });
            });

        // display current status
        match status {
            FirehoseStatus::Disconnected => ui.label("disconnected"),
            FirehoseStatus::Connecting(t) => {
                ui.label(format!("connecting ({:.2}s)", t.elapsed().as_secs_f64()));
                ui.spinner()
            }
            FirehoseStatus::Connected(_t) => ui.label("connected"),
            FirehoseStatus::Failed(msg) => {
                app.firehose_connect = None; // cleanup
                ui.label(RichText::new(&*msg).color(Color32::RED))
            }
        };

        // render frames
        egui::ScrollArea::new([false, true]).show(ui, |ui| {
            ui.allocate_space([ui.available_width(), 0.].into());

            let firehose = app.firehose.lock().unwrap();

            ui.label(format!("{} messages in buffer", firehose.messages.len()));
            for msg in &firehose.messages {
                ui.horizontal(|ui| {
                    ui.label(format!("msg at {:?}: {} bytes", msg.time, msg.data.len()));
                    // TODO: decode as dCBOR42
                });
            }
        });
    });
}

impl eframe::App for App {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("Cephalopod");

            // top bar
            egui::Frame::default()
                .stroke(egui::Stroke::new(2., Color32::GRAY))
                .inner_margin(2.)
                .show(ui, |ui| {
                    ui.horizontal(|ui| {
                        if ui
                            .button(RichText::new("quit").color(Color32::DARK_RED))
                            .clicked()
                        {
                            process::exit(0)
                        }

                        // tabs
                        ui.selectable_value(&mut self.screen, Screen::Main, "Main");
                        ui.selectable_value(&mut self.screen, Screen::Lexicons, "Lexicons");

                        if ui.button("logs").clicked() {
                            self.show_log = true
                        }
                        if ui.button("settings").clicked() {
                            self.show_settings = true
                        }

                        ui.label("filter: ");
                        ui.text_edit_singleline(&mut self.search);
                    });
                });

            match self.screen {
                Screen::Main => {
                    render_main(self, ctx, ui);
                }
                Screen::Lexicons => {
                    egui::ScrollArea::new([false, true]).show(ui, |ui| {
                        ui.allocate_space([ui.available_width(), 0.].into());
                        for l in &self.lexicons {
                            if l.id.contains(&self.search) {
                                render_lexicon(l, ui);
                            }
                        }
                    });
                }
            }

            egui::Window::new("Settings")
                .open(&mut self.show_settings)
                .collapsible(true)
                .show(ctx, |ui| ctx.settings_ui(ui));

            // log window
            egui::Window::new("Log")
                .open(&mut self.show_log)
                .collapsible(true)
                .show(ctx, |ui| {
                    // draws the logger ui.
                    egui_logger::logger_ui().show(ui);
                });
        });
    }
}

pub fn run(lexicons: Vec<ast::Lexicon>) -> Result<()> {
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default().with_inner_size([840., 600.]),
        ..Default::default()
    };
    eframe::run_native(
        "lexicon_tool",
        options,
        Box::new(move |cc| {
            cc.egui_ctx.set_theme(egui::Theme::Light);

            let screen = if lexicons.is_empty() {
                Screen::Main
            } else {
                Screen::Lexicons
            };
            let app = Box::new(App {
                lexicons,
                screen,

                firehose: Arc::new(sync::Mutex::new(FirehoseShared {
                    url: DEFAULT_FIREHOSE_URL.to_string(),
                    size_limit: 256,
                    ..Default::default()
                })),

                ..Default::default()
            });
            Ok(app)
        }),
    )
    .map_err(|e| anyhow!("Error while running GUI: {e:?}"))?;

    Ok(())
}
