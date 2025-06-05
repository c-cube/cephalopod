#!/bin/sh

exec dune exec --display=quiet -- tests/dasl/car_dump.exe $@
