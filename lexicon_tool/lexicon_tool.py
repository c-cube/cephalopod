# /// script
# dependencies = ["click"]
# ///

from dataclasses import dataclass
from typing import Optional
import click
import json, os

class LexiconType(object):
    type_: str
    format: Optional[str]

@dataclass
class LexiconBase(object):
    id: str
    fragment: str
    description: str

@dataclass
class LexiconObject(LexiconBase):
    required: Optional[list[str]]
    properties: dict[str, LexiconType]

@dataclass
class LexiconQuery(LexiconBase):
    required: Optional[list[str]]
    properties: dict[str, LexiconType]


def parse_dir(path: str, out_dir: str) -> None:
    for (dirpath, _, files) in os.walk(path):
        for file in files:
            if file.endswith('.json'):
                file_path = os.path.join(dirpath, file)
                with open(file_path, 'r') as f:
                    data = f.read()
                    j = json.loads(data)
                print(f'content of {file}: {j}')

@click.group()
def cli() -> None:
    pass


@cli.command()
@click.argument('paths', nargs=-1)
@click.option('--out_dir')
def parse(paths: list[str], out_dir: Optional[str]):
    out_dir = out_dir or './'
    for p in paths:
        parse_dir(p, out_dir=out_dir)

if __name__ == "__main__":
    cli()
