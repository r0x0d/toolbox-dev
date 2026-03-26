# toolbox-dev

A configurable development toolbox container built on [Fedora Toolbox](https://containertoolbx.org/).

One container image, multiple language environments -- enabled via Ansible roles and a simple YAML config.

## Quick start

```bash
# Create and enter the toolbox
toolbox create --image quay.io/toolbox-dev/toolbox-dev:latest dev
toolbox enter dev

# Configure your languages
tdx-edit

# Apply the configuration
tdx-apply
```

## Available roles

| Role | Config key | Description |
|------|-----------|-------------|
| Python | `languages.python_development` | Python 3, pip, ruff, pre-commit, pyright |
| Node.js | `languages.nodejs_development` | Node.js, pnpm, yarn |
| Go | `languages.go_development` | Go compiler |
| Rust | `languages.rust_development` | Rust via rustup, cmake, clang |
| C++ | `languages.cpp_development` | GCC, G++, clangd, cmake, ctags |
| Ruby | `languages.ruby_development` | Ruby, RVM, ruby-lsp |
| .NET | `languages.dotnet_development` | .NET 10.0 SDK and runtime |
| Zig | `languages.zig_development` | Zig compiler |
| Fedora Packaging | `environments.fedora_packaging` | fedpkg, packit, COPR tools |

## CLI tools

- `tdx-apply` -- apply your configuration (runs Ansible)
- `tdx-edit` -- open config in your `$EDITOR`
- `tdx-upgrade` -- upgrade to the latest container image

## Building locally

```bash
make build
```

## Documentation

Full documentation is available at the [project docs site](https://r0x0d.github.io/toolbox-dev/).
