# Configuration

## Config file location

The default config path is:

```text
~/.config/toolbox-dev/config.yml
```

Override it with the `TDX_CONFIG` environment variable:

```bash
export TDX_CONFIG=~/my-custom-config.yml
```

## Config format

The config file is a YAML file with roles organized by category:

```yaml
languages:
  python_development: true
  nodejs_development: true
  go_development: false
  rust_development: false
  cpp_development: false
  ruby_development: false
  dotnet_development: false
  zig_development: false

environments:
  fedora_packaging: false
  agent: false

# Optional: paths to custom Ansible task files
custom_playbooks:
  - ~/.config/toolbox-dev/playbooks/my-tools.yml
```

Set a role to `true` to enable it, `false` to disable it.

## CLI tools

### tdx-apply

Runs the Ansible playbook with your configuration:

```bash
tdx-apply              # apply config
tdx-apply -v           # verbose
tdx-apply --check      # dry run (no changes)
```

On first run, if no config exists, it copies the defaults and exits so you can edit them.

### tdx-edit

Opens the config file in your `$EDITOR`:

```bash
tdx-edit
```

Creates the config from defaults if it doesn't exist yet.

### tdx-upgrade

Upgrades the toolbox container to the latest image. See [Upgrading](upgrade.md).

## Auto-apply behavior

A profile script (`/etc/profile.d/tdx.sh`) runs on every interactive shell entry and checks:

1. If the config file exists but has never been applied -- runs `tdx-apply`
2. If the config file is newer than the last apply timestamp -- runs `tdx-apply`
3. Otherwise -- does nothing

The timestamp is stored at `~/.config/toolbox-dev/.last-applied`.

## Custom playbooks

You can run your own Ansible task files by listing them under `custom_playbooks`
in your config. See [Custom Playbooks](custom-playbooks.md) for details.

- **Not uninstall packages** that were previously installed (package removal can break dependencies)
