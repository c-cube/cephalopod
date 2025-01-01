use std::collections::HashMap;

use crate::ast;
use anyhow::{anyhow, Result};
use egui::Ui;
use egui_json_tree::value::{self as jt_value, JsonTreeValue as JV};
use egui_json_tree::{pointer as jt_ptr, JsonTree};

struct App {
    lexicons: Vec<ast::Lexicon>,
    show_log: bool,
}

impl egui_json_tree::value::ToJsonTreeValue for ast::Type {
    fn to_json_tree_value(&self) -> JV<Self> {
        match self {
            ast::Type::Null { description } => {
                JV::Base(self, &"null", jt_value::BaseValueType::Null)
            }
            ast::Type::Boolean {
                default,
                description,
            } => JV::Base(self, &"bool", jt_value::BaseValueType::String),
            ast::Type::Integer {
                description,
                minimum,
                maximum,
                enum_,
                default,
                const_,
            } => JV::Base(self, &"int", jt_value::BaseValueType::String),
            ast::Type::String {
                description,
                format,
                minLength,
                maxLength,
                enum_,
                default,
                const_,
            } => JV::Base(self, &"string", jt_value::BaseValueType::String),
            ast::Type::Bytes {
                description,
                minLength,
                maxLength,
            } => JV::Base(self, &"bytes", jt_value::BaseValueType::String),
            ast::Type::Blob {
                description,
                accept,
                maxSize,
            } => JV::Base(self, &"blob", jt_value::BaseValueType::String),
            ast::Type::Token(_) => JV::Base(self, &"token", jt_value::BaseValueType::String),
            ast::Type::CidLink { description } => {
                JV::Base(self, &"CID-link", jt_value::BaseValueType::String)
            }
            ast::Type::Array {
                items,
                minLength,
                maxLength,
            } => JV::Expandable(
                vec![(jt_ptr::JsonPointerSegment::Key("items"), &items)],
                jt_value::ExpandableType::Object,
            ),
            ast::Type::Object(o) => {
                let mut children = vec![];
                //children.push((jt_ptr::JsonPointerSegment::Key("type"), Label("object")));
                for (k, v) in &o.properties {
                    children.push((jt_ptr::JsonPointerSegment::Key(k), v));
                }

                JV::Expandable(children, jt_value::ExpandableType::Object)
            }
            ast::Type::Ref { ref_ } => JV::Base(self, ref_, jt_value::BaseValueType::String),
            ast::Type::Union(_u) => JV::Base(self, &"union", jt_value::BaseValueType::Null),
            ast::Type::Unknown => JV::Base(self, &"unknown", jt_value::BaseValueType::String),
        }
    }

    fn is_expandable(&self) -> bool {
        match self.to_json_tree_value() {
            JV::Base(_, _, _) => true,
            _ => false,
        }
    }
}

fn render_descr(d: &Option<String>, ui: &mut Ui) {
    if let Some(d) = d {
        ui.horizontal(|ui| {
            ui.label("descr: ");
            ui.label(d);
        });
    }
}

fn render_properties(props: &HashMap<String, ast::Type>, ui: &mut egui::Ui) {
    ui.horizontal(|ui| {
        ui.label("object");
        for (name, v) in props.iter() {
            JsonTree::new(name, v).show(ui);
        }
    });
}

fn render_params(d: &Option<ast::Params>, ui: &mut Ui) {
    if let Some(d) = d {
        ui.horizontal(|ui| {
            ui.label("params: ");
            ui.vertical(|ui| {
                render_properties(&d.properties, ui);
            });
        });
    }
}

fn render_lexicon(l: &ast::Lexicon, ui: &mut Ui) {
    egui::Frame::default()
        .stroke(egui::Stroke::new(2., egui::Color32::DARK_GREEN))
        .outer_margin(3.)
        .inner_margin(2.)
        .show(ui, |ui| {
            ui.vertical(|ui| {
                ui.label(&l.id);
                render_descr(&l.description, ui);

                for (name, def) in &l.defs {
                    ui.horizontal(|ui| {
                        ui.horizontal(|ui| {
                            ui.label(name);
                            ui.label(": ");
                            match def {
                                ast::Def::Query(q) => {
                                    ui.label("query: ");
                                    render_params(&q.parameters, ui);
                                }
                                ast::Def::Procedure(_) => {
                                    ui.label("query: ");
                                }
                                ast::Def::Record(_) => {
                                    ui.label("record: ");
                                }
                                ast::Def::Subscription(_) => {
                                    ui.label("subscription: ");
                                }
                                ast::Def::Object(o) => {
                                    egui::Frame::default()
                                        .stroke(egui::Stroke::new(2., egui::Color32::BLUE))
                                        .outer_margin(3.)
                                        .inner_margin(2.)
                                        .show(ui, |ui| {
                                            ui.horizontal(|ui| {
                                                ui.label("object");
                                                render_properties(&o.properties, ui);
                                            });
                                        });
                                }
                                ast::Def::Token(tok) => {
                                    render_descr(&tok.description, ui);
                                }
                            };
                        });
                    });
                }
            })
        });

    /*
            let mut add_descr = |d: &Option<String>| {
                if let Some(d) = d {
                    children.push(TreeItem::new_leaf(children.len(), format!("descr: {d}")))
                }
            };

    let t = match d {
        ast::Def::Query(q) => {
            add_descr(&q.description);
            TreeItem::new(0, "query", children)?
        }
        ast::Def::Procedure(_) => todo!(),
        ast::Def::Record(_) => todo!(),
        ast::Def::Subscription(_) => todo!(),
        ast::Def::Object(_) => todo!(),
        ast::Def::Token(tok) => TreeItem::new_leaf(0, format!("{:?}", tok)),
    };
    */
}

impl eframe::App for App {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("Lexicon tool");
            if ui.button("logs").clicked() {
                self.show_log = true
            }

            egui::ScrollArea::new([false, true]).show(ui, |ui| {
                ui.allocate_space([ui.available_width(), 0.].into());
                for l in &self.lexicons {
                    render_lexicon(l, ui);
                }
            });

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
    egui_logger::builder().build();
    eframe::run_native(
        "lexicon_tool",
        options,
        Box::new(move |_cc| {
            let app = Box::new(App {
                lexicons,
                show_log: false,
            });
            Ok(app)
        }),
    )
    .map_err(|e| anyhow!("Error while running GUI: {e:?}"))?;

    Ok(())
}
