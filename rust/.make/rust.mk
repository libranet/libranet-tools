

build:
	@cargo build --all

test:
	@cargo test --all

check:
	@cargo check --all

format:
	@cargo fmt --all

format-check:
	@cargo fmt --all -- --check

lint:
	@cargo clippy --all -- -D clippy::dbg-macro -D warnings
