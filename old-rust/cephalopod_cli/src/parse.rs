use anyhow::{Context, Result};
use std::{fs, path::Path};
use walkdir::WalkDir;

use crate::ast;

pub fn parse(dirs: &[impl AsRef<Path>]) -> Result<Vec<ast::Lexicon>> {
    let mut files = vec![];
    for dir in dirs {
        for entry in WalkDir::new(dir) {
            let entry = entry?;
            if entry.file_type().is_file() && entry.path().extension().is_some_and(|s| s == "json")
            {
                files.push(entry.path().to_owned());
            }
        }
    }

    // now parse the files
    let mut lexicons = vec![];
    for file in &files {
        log::info!("Parsing {file:?}");
        let data = fs::read_to_string(file).with_context(|| format!("Reading file {file:?}"))?;
        let lexicon: ast::Lexicon =
            serde_json::from_str(&data).with_context(|| format!("Deserializing {file:?}"))?;

        lexicons.push(lexicon);
    }

    lexicons.sort_by(|l1, l2| l1.id.cmp(&l2.id));
    Ok(lexicons)
}
