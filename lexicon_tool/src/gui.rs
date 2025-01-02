use std::collections::HashMap;

use crate::ast;
use anyhow::{anyhow, Result};
use egui::{Color32, RichText, Ui};

#[derive(Default)]
struct App {
    lexicons: Vec<ast::Lexicon>,
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
            default,
            description,
        } => {
            ui.label(bold_green("bool"));
            render_descr(description, ui);
        }
        ast::Type::Integer {
            description,
            minimum,
            maximum,
            enum_,
            default,
            const_,
        } => {
            ui.label(bold_green("int"));
            render_descr(description, ui);
        }
        ast::Type::String {
            description,
            format,
            minLength,
            maxLength,
            enum_,
            default,
            const_,
        } => {
            ui.label(bold_green("string"));
            render_descr(description, ui);
            if let Some(f) = format {
                ui.label(format!("format: {:?}", f));
            }
            render_optional("default", const_, ui);
        }

        ast::Type::Bytes {
            description,
            minLength,
            maxLength,
        } => {
            ui.label(bold_green("bytes"));
            render_descr(description, ui);
        }
        ast::Type::Blob {
            description,
            accept,
            maxSize,
        } => {
            ui.label(bold_green("blob"));
            render_descr(description, ui);
            render_optional("accept", accept, ui);
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
            minLength,
            maxLength,
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
        }
        ast::Def::Procedure(p) => {
            ui.label("procedure: ");
            render_descr(&p.description, ui);
            render_params(&p.parameters, ui);
            render_io(&p.input, "input", ui);
            render_io(&p.output, "output", ui);
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
        ast::Def::Token(tok) => {
            render_descr(&tok.description, ui);
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

impl eframe::App for App {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("Lexicon tool");

            egui::Frame::default()
                .stroke(egui::Stroke::new(2., Color32::GRAY))
                .show(ui, |ui| {
                    ui.horizontal(|ui| {
                        if ui.button("logs").clicked() {
                            self.show_log = true
                        }
                        if ui.button("settings").clicked() {
                            self.show_settings = true
                        }
                    });
                });

            egui::ScrollArea::new([false, true]).show(ui, |ui| {
                ui.allocate_space([ui.available_width(), 0.].into());
                for l in &self.lexicons {
                    render_lexicon(l, ui);
                }
            });

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
            let app = Box::new(App {
                lexicons,
                ..Default::default()
            });
            Ok(app)
        }),
    )
    .map_err(|e| anyhow!("Error while running GUI: {e:?}"))?;

    Ok(())
}
