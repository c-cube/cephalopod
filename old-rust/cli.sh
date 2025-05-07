#!/bin/sh

exec cargo run --quiet --bin cephalopod_cli -p cephalopod_cli -- $@
