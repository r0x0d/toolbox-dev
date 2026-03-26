# Roles

Roles are optional Ansible configurations that install language-specific development tools. Enable them in your `config.yml`.

## Languages

| Role | Config key | What it installs |
|------|-----------|-----------------|
| [Python](python.md) | `languages.python_development` | Python 3, pip, ruff, pre-commit, pyright, pyenv build deps |
| [Node.js](node.md) | `languages.nodejs_development` | Node.js, pnpm, yarn |
| [Go](go.md) | `languages.go_development` | Go compiler |
| [Rust](rust.md) | `languages.rust_development` | Rust toolchain via rustup, cmake, clang |
| [C++](cpp.md) | `languages.cpp_development` | GCC, G++, clangd, cmake, ctags |
| [Ruby](ruby.md) | `languages.ruby_development` | Ruby, RVM, ruby-lsp plugins |
| [.NET](dotnet.md) | `languages.dotnet_development` | .NET 10.0 SDK and runtime |
| [Zig](zig.md) | `languages.zig_development` | Zig compiler |

## Environments

| Role | Config key | What it installs |
|------|-----------|-----------------|
| [Fedora Packaging](fedora-packaging.md) | `environments.fedora_packaging` | fedpkg, packit, COPR, conversion tools |
