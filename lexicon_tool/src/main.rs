use anyhow::{anyhow, Context, Result};
use clap::Parser;
use std::{fmt::format, fs, path::PathBuf};
use walkdir::WalkDir;

mod ast;

#[derive(Debug, clap::Parser)]
#[command(name = "parse")]
struct Parse {
    dirs: Vec<PathBuf>,
}

#[derive(Debug, clap::Parser)]
enum Cli {
    Parse(Parse),
}

impl Parse {
    fn run(self) -> Result<()> {
        let mut files = vec![];
        for dir in self.dirs {
            for entry in WalkDir::new(dir) {
                let entry = entry?;
                if entry.file_type().is_file()
                    && entry.path().extension().is_some_and(|s| s == "json")
                {
                    files.push(entry.path().to_owned());
                }
            }
        }
        dbg!(&files);

        // now parse the files
        let mut lexicons = vec![];
        for file in &files {
            eprintln!("Parsing {file:?}");
            let data =
                fs::read_to_string(file).with_context(|| format!("Reading file {file:?}"))?;
            let lexicon: ast::Lexicon =
                serde_json::from_str(&data).with_context(|| format!("Deserializing {file:?}"))?;

            lexicons.push(lexicon);
        }
        dbg!(&lexicons);

        let n_other = lexicons
            .iter()
            .flat_map(|l: &ast::Lexicon| l.defs.iter().map(|kv| kv.1))
            .filter(|v| v.is_other())
            .count();
        if n_other > 0 {
            eprintln!("{n_other} definitions were not parsed")
        }

        Ok(())
    }
}

impl Cli {
    fn run(self) -> Result<()> {
        match self {
            Cli::Parse(parse) => {
                parse.run()?;
            }
        }
        Ok(())
    }
}

fn main() -> Result<()> {
    let cli = Cli::try_parse()?;
    cli.run()?;

    Ok(())
}
