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

## Usage examples

### Single language setup

Enable just Python for scripting or data work:

```yaml
languages:
  python_development: true
```

```bash
tdx-apply
python3 --version
pip3 install requests
```

### Full-stack web development

Enable multiple languages for a typical web project:

```yaml
languages:
  python_development: true
  nodejs_development: true
  rust_development: true
```

After running `tdx-apply`, tools like `python3`, `node`, `pnpm`, `cargo`, and `rustc` are all available in the same container.

### Fedora package maintainer

Combine language tooling with the packaging environment:

```yaml
languages:
  python_development: true
  go_development: true

environments:
  fedora_packaging: true
```

This gives you `fedpkg`, `mock`, `rpmlint`, and `packit` alongside your
development tools.

## Configuration

### Config file

The config file lives at `~/.config/toolbox-dev/config.yml`. Use `tdx-edit` to
open it in your `$EDITOR`, or edit it directly.

To use a custom path:

```bash
export TDX_CONFIG=~/my-custom-config.yml
```

### CLI tools

| Command | Description |
|---------|-------------|
| `tdx-edit` | Open the config file in your editor |
| `tdx-apply` | Apply the current configuration |
| `tdx-apply -v` | Apply with verbose Ansible output |
| `tdx-apply --check` | Dry run -- show what would change without applying |
| `tdx-upgrade` | Upgrade the container to the latest image |

### Auto-apply on entry

When you enter the container, toolbox-dev automatically detects config changes
and runs `tdx-apply` for you. No need to remember to apply after editing.

### Host wrapper scripts

Enabled roles install wrapper scripts in `~/.local/bin/` so you can call tools
directly from the host without entering the container first:

```bash
# These work from the host -- they transparently run inside the container
python3 myscript.py
ruff check .
cargo build
```

Override the target container name with:

```bash
export TDX_CONTAINER_NAME=my-dev
```

See [Getting Started](getting-started.md) for detailed setup instructions and
[Configuration](configuration.md) for the full reference.
