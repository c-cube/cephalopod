
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
codegen:
	$(CLI) codegen vendor/atproto/lexicons -o cephalopod_types/src/lib.rs

update-submodules:
	@git submodule init --recursive

.PHONY: build release clean test doc
