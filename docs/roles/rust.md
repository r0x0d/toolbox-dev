# Rust

Config key: `languages.rust_development`

## What it installs

**DNF packages:**

- `rustup`
- `cmake`
- `clang-devel`

**Post-install:**

- Runs `rustup-init -y` to install the default Rust toolchain

## Usage

```yaml
languages:
  rust_development: true
```

## Notes

The default toolchain is installed to `~/.cargo/`. Use `rustup` to manage additional toolchains and components.
