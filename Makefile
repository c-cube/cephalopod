
build:
	@cargo build

release:
	@cargo build --release

clean:
	@cargo clean

test:
	@cargo test

doc:
	@cargo doc

update-submodules:
	@git submodule init --recursive

.PHONY: build release clean test doc
