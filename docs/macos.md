# macOS (apple/container)

On macOS there is no Toolbox, but the image runs as a
[container machine](https://github.com/apple/container/blob/main/docs/command-reference.md#container-machine-management)
with Apple's [`container`](https://github.com/apple/container) CLI. Like
Toolbox, a container machine boots the image's init system, creates an
account matching your macOS user, and mounts your home directory. The image
is published for `arm64`, so it runs natively on Apple silicon.

## Prerequisites

- A Mac with Apple silicon running macOS 26 or later
  (see apple/container's [requirements](https://github.com/apple/container#requirements))
- `container` installed from the
  [apple/container releases](https://github.com/apple/container/releases)

Start the container system service once:

```bash
container system start
```

## Create the container machine

```bash
container machine create --name dev --cpus 4 --memory 8G \
  quay.io/toolbox-dev/toolbox-dev:latest
```

Adjust `--cpus` / `--memory` to your machine (memory defaults to half of
system memory). Add `--set-default` to make it the default machine, so you
can leave out `-n dev` in the commands below. To change resources later:

```bash
container machine set -n dev cpus=8 memory=16G   # applies after a restart
```

## Enter the container machine

```bash
container machine run -n dev
```

With no command, this opens a login shell as your user, which also triggers
[auto-apply](configuration.md#auto-apply-behavior). Your macOS home directory
is mounted read-write, so `~/.config/toolbox-dev/config.yml` lives on the Mac.

From there, configure and apply as usual:

```bash
tdx-edit
tdx-apply
```

You can also run a single command without opening a shell:

```bash
container machine run -n dev -- tdx-apply
```

## Stop, start and remove

```bash
container machine stop dev
container machine run -n dev     # boots it again if it's stopped
container machine delete dev
container machine list
```

Installed packages live in the container machine, so they're kept across
stop/start but lost when it is deleted. Your config is in your macOS home
directory, so it survives.

## Building locally

`make build` detects macOS and uses `container build` instead of Podman:

```bash
make build
container machine create --name dev-local local/toolbox-dev
```

## Upgrading

See [Upgrading](upgrade.md#macos-applecontainer).
