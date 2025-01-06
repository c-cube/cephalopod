//! Codegen from the AST

use std::fmt::Write;
use std::{io, path::Path};

use crate::ast::*;
use anyhow::Result;
use egui::ahash::HashMap;

const PRELUDE: &'static str = r#"
//! auto-generated from lexicons, do not edit

#![allow(non_snake_case)]

"#;

#[derive(Debug, Default)]
struct Mod {
    id: String,
    content: String,
    after_content: String,
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

/// Path from `cur` (as an `id`) to another id's module.
/// ```
/// let path = cephalopod_cli::codegen::path_to("foo.bar.x.y", "foo.bar.yolo.swag");
/// assert_eq!("super::super::yolo::swag::", path);
/// ```
pub fn path_to(cur: &str, dest: &str) -> String {
    let mut res = String::new();

    let mut cur = cur.split('.').peekable();
    let mut dest = dest.split('.').peekable();

    // remove common prefix
    loop {
        match (cur.peek(), dest.peek()) {
            (Some(c1), Some(c2)) if c1 == c2 => {
                cur.next();
                dest.next();
            }
            _ => break,
        }
    }

    for _ in cur {
        res += "super::";
    }
    for p in dest {
        res += p;
        res += "::";
    }
    return res;
}

impl Mod {
    fn get_child(&mut self, s: &str) -> &mut Mod {
        assert!(!s.contains("."));

        let e = self.children.entry(s.to_string());
        e.or_insert_with(|| {
            let mut m: Mod = Default::default();
            m.id = self.id.clone();
            if !m.id.is_empty() {
                m.id += ".";
            }
            m.id += s;
            m
        })
    }

    // TODO: actually output into a directory?? mod.rs for each non-empty `content`,
    // but also for intermediate modules…

    fn output(&self, out: &mut dyn io::Write, indent: u16) -> io::Result<()> {
        for line in self.content.lines() {
            if !line.trim().is_empty() {
                add_indent(out, indent)?;
            }
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

    if res == "Option" || res == "Result" {
        res += "_";
    }

    res
}

fn sanitize_field_name(name: &str) -> &str {
    if name == "ref" {
        "ref_"
    } else if name == "type" {
        "type_"
    } else {
        name
    }
}

/// Resolve reference into a rust path (from module with id `m_id`)
///
/// ```
/// use cephalopod_cli::codegen::gen_ref;
/// assert_eq!("Yolo", gen_ref(&"foo.bar.Comp1", "#Yolo"));
/// assert_eq!("super::super::truc::Yolo", gen_ref(&"foo.bar.Comp1", "foo.truc#Yolo"));
/// ```
pub fn gen_ref(m_id: &str, r: &str) -> String {
    let (ref_id, ref_name) = r.split_once("#").unwrap_or_else(|| (r, "main"));

    // fragment in current path
    let path = if ref_id == "" {
        "".to_string()
    } else {
        path_to(m_id, ref_id)
    };

    let basename = name_type_of_name(ref_id, ref_name);
    let mut res = path;
    res += &basename;
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
        Type::String(s) => {
            writef!(m, "&'a str");

            let mut annotation = String::new();

            if let Some(format) = &s.format {
                write!(&mut annotation, "format: {format:?}").unwrap();
            }

            if !annotation.is_empty() {
                writef!(m, "/* {annotation} */");
            }
        }
        Type::Bytes {
            description: _,
            minLength: _,
            maxLength: _,
        } => {
            writef!(m, "&'a [u8]");
        }
        Type::CidLink { description: _ } => {
            writef!(m, "cephalopod_core::cid::CID");
        }
        Type::Array { items, .. } => {
            writef!(m, "&'a [");
            gen_ty(m, items);
            writef!(m, "]");
        }
        Type::Object(o) => {
            writef!(m, "() /* TODO: object {o:?} */");
        }
        Type::Blob {
            description: _,
            accept: _,
            ..
        } => {
            writef!(m, "cephalopod_core::data::Blob<'a>");
        }
        Type::Token(_) => {
            writef!(m, "&'a str /* token */");
        }
        Type::Ref { ref_ } => {
            let r = gen_ref(&m.id, ref_);
            writef!(m, "&'a {r}<'a> /* ref {ref_:?} */");
        }
        Type::Union(u) => {
            writef!(m, "() /* TODO: union {u:?} */");
        }
        Type::Unknown => {
            writef!(m, "cephalopod_core::Value<'a> /* unknown. */");
        }
    }
}

fn gen_object(m: &mut Mod, name: &str, o: &Object) {
    if let Some(d) = &o.description {
        writef!(m, "/// {d}\n");
    }

    // required fields
    let required: &[String] = o.required.as_deref().unwrap_or(&[]);

    // TODO: Encodable
    writef!(m, "#[derive(Debug)]\n");
    writef!(m, "pub struct {name}<'a> {{\n");
    for (prop_name, ty) in o.properties.iter() {
        let prop_required = required.iter().any(|r| r == prop_name);
        if let Some(d) = ty.description() {
            writef!(m, "  /// {d}\n");
        }

        if let Some(known_values) = ty.known_values() {
            for v in known_values.iter() {
                let mut name: &str = &v;
                if let Some((_, v)) = name.split_once("#") {
                    name = v;
                }

                writef!(m, "  /// known value: {name:?}\n")
            }
        }

        if prop_required {
            writef!(m, "  /// (Required)\n");
        }

        let field_name = sanitize_field_name(prop_name);

        writef!(m, "  pub {field_name}: ");
        if prop_required {
            gen_ty(m, ty);
        } else {
            writef!(m, "Option<");
            gen_ty(m, ty);
            writef!(m, ">");
        }
        writef!(m, ",\n");
    }

    writef!(
        m,
        "  /// (generated): make sure we use the lifetime parameters.\n"
    );
    writef!(m, "  pub _phantom: std::marker::PhantomData<&'a ()>\n");
    writef!(m, "}}\n");
}

fn gen_ty_def(m: &mut Mod, name: &str, ty: &Type) {
    if let Some(d) = ty.description() {
        writef!(m, "/// {d}\n");
    }

    // TODO: Encodable

    if let Some(known_values) = ty.known_values() {
        for v in known_values.iter() {
            let mut name: &str = &v;
            if let Some((_, v)) = name.split_once("#") {
                name = v;
            }

            writef!(m, "/// known value: {name:?}\n")
        }
    }

    writef!(m, "pub type {name}<'a> = ");
    gen_ty(m, ty);
    writef!(m, ";\n");
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

    // sort, for determinism
    let mut defs: Vec<_> = lexicon
        .defs
        .iter()
        .map(|(name, def)| (name, name_type_of_name(&lexicon.id, name), def))
        .collect();
    defs.sort_by_key(|kv| kv.0);

    // Is there a definition "main" that will be renamed to "Foo", and
    // a definition for "foo" that will also be renamed to "Foo"?
    // Example: see `app.bsky.embed.defs`
    let has_collision_on_main: bool = defs.iter().any(|entry1| {
        entry1.0 == "main"
            && defs
                .iter()
                .any(|entry2| entry2.0 != "main" && entry2.1 == entry1.1)
    });

    for (i, (name, mut def_name, def)) in defs.into_iter().enumerate() {
        if i > 0 {
            writef!(m, "\n");
        }

        if name == "main" && has_collision_on_main {
            log::debug!("Collision in {}, not renaming Main.", &m.id);
            def_name = "Main".to_string();
        }

        match def {
            Def::Query(_) => {
                writef!(m, "// TODO: generate query {def_name}\n");
            }
            Def::Procedure(_) => {
                writef!(m, "// TODO: generate proc {def_name}\n");
            }
            Def::Record(_) => {
                writef!(m, "// TODO: generate record {def_name}\n");
            }
            Def::Subscription(_) => {
                writef!(m, "// TODO: generate sub {def_name}\n");
            }
            Def::Object(o) => {
                gen_object(m, &def_name, o);
            }
            Def::Type(ty) => {
                gen_ty_def(m, &def_name, ty);
            }
        }

        if !m.after_content.is_empty() {
            m.content += &m.after_content;
            m.after_content.clear();
        }
    }
}

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
