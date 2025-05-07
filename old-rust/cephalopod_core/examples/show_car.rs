use std::path::PathBuf;

use anyhow::{Context, Result};
use bumpalo::Bump;
use cephalopod_core::{car, CAR};
use clap::Parser;

// TODO: parse CLI, parse CAR file, show CAR

#[derive(Debug, clap::Parser)]
struct Cli {
    file: PathBuf,
    /// If true, print each LEB128-prefixed segment's length
    #[arg(long)]
    dump_segment_lengths: bool,
    #[arg(short = 'q', long)]
    quiet: bool,
}

pub fn main() -> Result<()> {
    let cli = Cli::try_parse()?;

    let mut alloc = Bump::new();
    let data = std::fs::read(&cli.file).with_context(|| "while reading file")?;

    if cli.dump_segment_lengths {
        for part in car::iter_leb128_delimited_parts(&data) {
            let Ok(part) = part else {
                eprintln!("part failed");
                continue;
            };
            dbg!(part.len());
        }
    }

    let car = CAR::decode_slice(&alloc, &data)?;

    if !cli.quiet {
        println!(
            "# CAR file, version={} roots={:?}",
            car.header.version, car.header.roots
        );
        println!("# {} blocks follow:", car.blocks.len());
        for block in car.blocks.iter() {
            println!("# block, cid={:?}", block.cid);
            match block.data {
                car::BlockData::Raw(data) => println!("## raw data: {}", hex::encode(data)),
                car::BlockData::DCBOR42(v) => println!("## dCBOR42 data: {:#?}", v),
            }
        }
    }
    alloc.reset();

    Ok(())
}
