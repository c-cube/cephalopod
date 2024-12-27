
build:
	cargo build

release:
	cargo build --release

clean:
	cargo clean

test:
	cargo test

doc:
	cargo doc

.PHONY: build release clean test doc
