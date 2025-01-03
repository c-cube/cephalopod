//! Codegen from the AST

use std::fmt::Write;
use std::{io, path::Path};

use crate::ast::*;
use anyhow::Result;
use egui::ahash::HashMap;

#[derive(Debug, Default)]
struct Mod {
    content: String,
    side_content: String,
    children: HashMap<String, Mod>,
}

fn add_indent(out: &mut dyn io::Write, n: u16) -> io::Result<()> {
    for _ in 0..n {
        write!(out, "  ")?;
    }
    Ok(())
}

/// Write to a module's content.
macro_rules! writef {
    ($m:expr, $fmt:expr) => {
        write!(&mut $m.content, $fmt).unwrap()
    };
    ($m:expr, $fmt:expr, $($args:expr),+) => {
        write!(&mut $m.content, $fmt, $($args),*).unwrap()
    };
}

impl Mod {
    fn get_child(&mut self, s: &str) -> &mut Mod {
        assert!(!s.contains("."));

        let e = self.children.entry(s.to_string());
        e.or_insert_with(|| Default::default())
    }

    fn output(&self, out: &mut dyn io::Write, indent: u16) -> io::Result<()> {
        for line in self.content.lines() {
            add_indent(out, indent)?;
            write!(out, "{}\n", line)?;
        }

        // sort
        let mut children: Vec<_> = self.children.iter().collect();
        children.sort_by_key(|x| x.0);

        for (name, child) in children {
            write!(out, "\n")?;
            add_indent(out, indent)?;
            write!(out, "pub mod {name} {{\n")?;

            child.output(out, indent + 1)?;

            add_indent(out, indent)?;
            write!(out, "}}\n\n")?;
        }

        Ok(())
    }
}

/// Compute the name for this type
fn name_type_of_name<'a>(lex_id: &'a str, mut name: &'a str) -> String {
    if name == "main" {
        name = lex_id
            .split(".")
            .last()
            .expect("Lexicon ID cannot be empty");
    }

    let mut name_chars = name.chars();

    // capitalize
    let mut res = String::new();
    res.extend(name_chars.next().unwrap().to_uppercase());
    res.extend(name_chars);

    res
}

fn gen_ty(m: &mut Mod, ty: &Type) {
    match ty {
        Type::Null { description: _ } => {
            writef!(m, "()");
        }
        Type::Boolean {
            default: _,
            description: _,
        } => writef!(m, "bool"),
        Type::Integer { .. } => {
            writef!(m, "i64")
        }
        Type::String {
            description: _,
            format: _,
            enum_: _,
            default: _,
            const_: _,
            knownValues,
            ..
        } => {
            writef!(m, "String");

            // define the known values
            if let Some(kv) = knownValues {
                for v in kv.iter() {
                    m.side_content += &format!(
                        "\n/// known value:\nconst {}: &'static str = {:?}\n",
                        v.to_uppercase(),
                        v
                    );
                }
            }
        }
        Type::Bytes {
            description: _,
            minLength: _,
            maxLength: _,
        } => {
            writef!(m, "Vec<u8>");
        }
        Type::CidLink { description: _ } => {
            writef!(m, "cephalopod_core::Cid");
        }
        Type::Array { items, .. } => {
            writef!(m, "Vec<");
            gen_ty(m, items);
            writef!(m, ">");
        }
        Type::Object(o) => {
            writef!(m, "() /* TODO: object {o:?} */");
        }
        Type::Blob {
            description: _,
            accept: _,
            ..
        } => {
            writef!(m, "() /* TODO: blob */");
        }
        Type::Token(_) => {
            writef!(m, "() /* TODO: token */");
        }
        Type::Ref { ref_ } => {
            writef!(m, "() /* TODO: ref {ref_} */");
        }
        Type::Union(u) => {
            writef!(m, "() /* TODO: union {u:?} */");
        }
        Type::Unknown => {
            writef!(m, "() /* TODO: unknown. Replace with data::Value? */");
        }
    }
}

fn gen_object(m: &mut Mod, name: &str, o: &Object) {
    if let Some(d) = &o.description {
        writef!(m, "/// {d}\n");
    }
    writef!(m, "#[derive(Debug, Serialize, Deserialize)]\n");
    writef!(m, "struct {name} {{\n");
    for (prop_name, ty) in o.properties.iter() {
        if let Some(d) = ty.description() {
            writef!(m, "/// {d}\n");
        }
        writef!(m, "  {prop_name}: ");
        gen_ty(m, ty);
        writef!(m, ",\n");
    }

    writef!(m, "}}\n");
}

/// Generate code for a lexicon entry
fn gen_lexicon(mut m: &mut Mod, lexicon: &Lexicon) {
    let path = lexicon.id.split(".");

    // get to the correct submodule
    for p in path {
        m = m.get_child(p)
    }

    if let Some(d) = &lexicon.description {
        writef!(m, "//! {}\n", d);
    }

    for (name, def) in &lexicon.defs {
        let def_name = name_type_of_name(&lexicon.id, name);

        match def {
            Def::Query(_) => {
                writef!(m, "// TODO: generate {def_name}\n");
            }
            Def::Procedure(_) => {
                writef!(m, "// TODO: generate {def_name}\n");
            }
            Def::Record(_) => {
                writef!(m, "// TODO: generate {def_name}\n");
            }
            Def::Subscription(_) => {
                writef!(m, "// TODO: generate {def_name}\n");
            }
            Def::Object(o) => {
                gen_object(m, &def_name, o);
            }
            Def::Token(_) => writef!(m, "// TODO: generate {def_name}\n"),
        }

        m.content += &m.side_content;
        m.side_content.clear();

        writef!(m, "\n");
    }
}

const PRELUDE: &'static str = r#"
//! auto-generated from lexicons, do not edit

use serde::{Serialize, Deserialize};

"#;

pub fn run(lexicons: Vec<Lexicon>, out_file: &Path) -> Result<()> {
    log::info!(
        "generate code for {} lexicons into {:?}",
        lexicons.len(),
        out_file
    );

    let mut m: Mod = Default::default();
    writef!(m, "{}", PRELUDE);

    for l in &lexicons {
        gen_lexicon(&mut m, l);
    }

    let mut out = std::fs::File::create(out_file)?;
    let mut out = std::io::BufWriter::new(&mut out);
    m.output(&mut out, 0)?;

    Ok(())
}
