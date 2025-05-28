#!/bin/sh

exec dune exec tests/bin/firehose-client/firehose_client.exe -- $@
