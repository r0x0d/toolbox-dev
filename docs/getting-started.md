# Getting Started

## Prerequisites

- [Podman](https://podman.io/) installed on your host
- [Toolbox](https://containertoolbx.org/) installed (`sudo dnf install toolbox` on Fedora)

## Create a toolbox

```bash
toolbox create --image quay.io/toolbox-dev/toolbox-dev:latest dev
```

## Enter the toolbox

```bash
toolbox enter dev
```

## Configure your environment

On first entry, run `tdx-edit` to open the configuration file:

```bash
tdx-edit
```

This creates `~/.config/toolbox-dev/config.yml` with all roles disabled. Enable the ones you need:

```yaml
languages:
  python_development: true
  nodejs_development: true
  go_development: false
  rust_development: true
  cpp_development: false
  ruby_development: false
  dotnet_development: false
  zig_development: false

environments:
  fedora_packaging: false

applications:
  cursor_ide: false
```

## Apply the configuration

```bash
tdx-apply
```

Ansible installs the packages for each enabled role. This only needs
to run once -- the installed packages persist in the container.

## Auto-apply

If you edit the config and re-enter the container, toolbox-dev detects
the change and automatically runs `tdx-apply`. You can also pass extra
Ansible flags:

```bash
tdx-apply -v          # verbose output
tdx-apply --check     # dry run
```

## Base tools

The following tools are always available regardless of configuration:

- git, git-lfs
- neovim
- jq, ripgrep, fd-find, fzf
- make, gcc, g++
- fish, shfmt
- strace, zstd
- asciinema, task
