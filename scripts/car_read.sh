#!/bin/sh

exec dune exec --display=quiet -- src/bin/car-read/car_read.exe $@
