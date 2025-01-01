use anyhow::Result;
use clap::Parser;
use std::path::PathBuf;

mod ast;
mod parse;
mod tui;

#[derive(Debug, clap::Parser)]
struct Dirs {
    dirs: Vec<PathBuf>,
}

#[derive(Debug, clap::Parser)]
enum Cli {
    Parse(Dirs),
    Explore(Dirs),
}

impl Cli {
    fn run(self) -> Result<()> {
        match self {
            Cli::Parse(p) => {
                env_logger::try_init()?;
                let lexicons = parse::parse(&p.dirs)?;
                println!("lexicons:\n{lexicons:#?}");
            }
            Cli::Explore(p) => {
                // TODO: https://docs.rs/tui-logger/latest/tui_logger/ in a tab

                let lexicons = parse::parse(&p.dirs)?;
                tui::explore(lexicons)?;
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
