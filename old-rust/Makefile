
build:
	@cargo build

release:
	@cargo build --release

clean:
	@cargo clean

test:
	@cargo test --all

doc:
	@cargo doc

CLI=cargo run --quiet --bin cephalopod_cli -p cephalopod_cli --
LEXICONS=vendor/atproto/lexicons/app/ vendor/atproto/lexicons/com/
#LEXICONS=vendor/atproto/lexicons/
codegen:
	$(CLI) codegen $(LEXICONS) -o cephalopod_types/src/lib.rs

update-submodules:
	@git submodule init --recursive

.PHONY: build release clean test doc
