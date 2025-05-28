#!/bin/sh

exec dune exec tests/bin/read-firehose-dump/read_firehose_dump.exe -- $@
