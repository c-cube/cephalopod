use anyhow::Result;
use cephalopod_cli::{codegen, parse};
use clap::Parser;
use std::path::PathBuf;

mod gui;

#[derive(Debug, clap::Parser)]
enum Cli {
    ParseLexicons {
        dirs: Vec<PathBuf>,
    },
    Gui {
        lexicon_dir: Option<PathBuf>,
    },
    /// Generate code
    Codegen {
        /// Input lexicon directories
        dirs: Vec<PathBuf>,
        /// Output file with a .rs extension
        #[arg(short = 'o')]
        out_file: PathBuf,
    },
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
            Cli::Codegen { dirs, out_file } => {
                env_logger::try_init()?;
                let lexicons = parse::parse(&dirs)?;
                codegen::run(lexicons, &out_file)?;
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
