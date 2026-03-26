# toolbox-dev

A single, configurable development toolbox container built on [Fedora Toolbox](https://containertoolbx.org/).

Instead of maintaining separate container images for each language,
toolbox-dev ships **one image** with [Ansible](https://docs.ansible.com/)
roles that you enable or disable via a simple YAML config file.

## How it works

1. **One container image** includes all the base development tools plus Ansible
2. **Ansible roles** install language-specific tooling on demand
3. **Configuration** is a simple YAML file toggling roles on/off
4. **Auto-apply** detects config changes and applies them on container entry

## Available roles

### Languages

| Role | Config key | Description |
|------|-----------|-------------|
| [Python](roles/python.md) | `languages.python_development` | Python 3, pip, ruff, pre-commit, pyright, pyenv dependencies |
| [Node.js](roles/node.md) | `languages.nodejs_development` | Node.js, pnpm, yarn |
| [Go](roles/go.md) | `languages.go_development` | Go compiler |
| [Rust](roles/rust.md) | `languages.rust_development` | Rust via rustup, cmake, clang |
| [C++](roles/cpp.md) | `languages.cpp_development` | GCC, G++, clangd, cmake, ctags |
| [Ruby](roles/ruby.md) | `languages.ruby_development` | Ruby, RVM, ruby-lsp and plugins |
| [.NET](roles/dotnet.md) | `languages.dotnet_development` | .NET 10.0 SDK and runtime |
| [Zig](roles/zig.md) | `languages.zig_development` | Zig compiler |

### Environments

| Role | Config key | Description |
|------|-----------|-------------|
| [Fedora Packaging](roles/fedora-packaging.md) | `environments.fedora_packaging` | fedpkg, packit, COPR, conversion tools |

## Quick start

```bash
toolbox create --image quay.io/toolbox-dev/toolbox-dev:latest dev
toolbox enter dev
tdx-edit    # enable desired languages
tdx-apply   # install them
```

See [Getting Started](getting-started.md) for detailed instructions.
