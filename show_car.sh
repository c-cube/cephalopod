#!/bin/sh
exec cargo run --release --quiet --example show_car -- $@
