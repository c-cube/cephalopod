use anyhow::Result;
use clap::Parser;
use std::path::PathBuf;

mod ast;
mod gui;
mod parse;

#[derive(Debug, clap::Parser)]
struct Dirs {
    dirs: Vec<PathBuf>,
}

#[derive(Debug, clap::Parser)]
enum Cli {
    Parse(Dirs),
    Gui(Dirs),
}

impl Cli {
    fn run(self) -> Result<()> {
        match self {
            Cli::Parse(p) => {
                env_logger::try_init()?;
                let lexicons = parse::parse(&p.dirs)?;
                println!("lexicons:\n{lexicons:#?}");
            }
            Cli::Gui(p) => {
                egui_logger::builder().init()?;
                let lexicons = parse::parse(&p.dirs)?;
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
