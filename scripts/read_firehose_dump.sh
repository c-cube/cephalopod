#!/bin/sh

exec dune exec src/bin/read-firehose-dump/read_firehose_dump.exe -- $@
