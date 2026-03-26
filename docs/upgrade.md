# Upgrading

The `tdx-upgrade` command upgrades your toolbox container to the latest published image while preserving your installed packages.

## Prerequisites

Enable the Podman socket on your host:

```bash
systemctl --user enable --now podman.socket
```

## Usage

From inside the toolbox:

```bash
tdx-upgrade
```

## What it does

1. **Checks for updates** by comparing the local image digest against the remote registry
2. **Pulls the latest image** if an update is available
3. **Captures your installed RPMs** so user-installed packages can be restored
4. **Renames the current container** with a timestamp suffix (e.g., `dev_2026-03-26-143000`) as a backup
5. **Creates a new container** from the latest image using the original name
6. **Re-installs your RPMs** in the new container (with `--skip-broken --skip-unavailable` for safety)
7. **Enters the new container**

## After upgrading

After the upgrade, run `tdx-apply` to re-apply your Ansible configuration:

```bash
tdx-apply
```

The config file and timestamp persist in your home directory, so auto-apply will trigger on first entry if the config exists.

## Rollback

If something goes wrong, your old container still exists with the timestamped name:

```bash
toolbox list                              # find the backup name
toolbox enter dev_2026-03-26-143000       # enter the old container
```
