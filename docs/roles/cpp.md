# C++

Config key: `languages.cpp_development`

## What it installs

**DNF packages:**

- `g++`, `gcc`, `gcc-c++`
- `ctags`
- `clangd`
- `cmake`

## Usage

```yaml
languages:
  cpp_development: true
```

## Notes

Basic `gcc` and `g++` are already included in the base image. This role
adds `gcc-c++`, the clangd language server, cmake, and ctags.
