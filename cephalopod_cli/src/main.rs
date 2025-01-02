use anyhow::Result;
use clap::Parser;
use std::path::PathBuf;

mod ast;
mod gui;
mod parse;

#[derive(Debug, clap::Parser)]
enum Cli {
    ParseLexicons { dirs: Vec<PathBuf> },
    Gui { lexicon_dir: Option<PathBuf> },
}

impl Cli {
    fn run(self) -> Result<()> {
        match self {
            Cli::ParseLexicons { dirs } => {
                env_logger::try_init()?;
                let lexicons = parse::parse(&dirs)?;
                println!("lexicons:\n{lexicons:#?}");
            }
            Cli::Gui { lexicon_dir } => {
                egui_logger::builder().init()?;
                let dirs: Vec<PathBuf> = lexicon_dir.iter().cloned().collect();
                let lexicons = parse::parse(&dirs)?;
                gui::run(lexicons)?;
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
