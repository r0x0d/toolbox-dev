# Upgrading

To upgrade, pull the latest image and re-create your container. Your
config (`~/.config/toolbox-dev/config.yml`) lives outside the container,
so it is kept. Packages installed by roles are **not** kept: run
`tdx-apply` in the new container to re-install them.

!!! note
    Auto-apply only runs when the config is newer than the last apply,
    so it will **not** trigger on its own after re-creating the container.
    Run `tdx-apply` manually, as shown below.

## Linux (Toolbox)

Run these on the host, not inside the toolbox:

```bash
podman pull quay.io/toolbox-dev/toolbox-dev:latest
toolbox rm --force dev
toolbox create --image quay.io/toolbox-dev/toolbox-dev:latest dev
toolbox enter dev
```

Then, inside the new toolbox:

```bash
tdx-apply
```

To keep the old container as a fallback, create the new one under a
different name first (e.g. `dev-new`) and remove the old one once you're
happy with it.

## macOS (apple/container)

Run these on the Mac:

```bash
container image pull quay.io/toolbox-dev/toolbox-dev:latest
container machine delete dev
container machine create --name dev --cpus 4 --memory 8G \
  quay.io/toolbox-dev/toolbox-dev:latest
container machine run -n dev -- tdx-apply
```

Use the same `container machine create` options you originally created it
with (see [macOS](macos.md)). If it was your default machine, add
`--set-default` again. To keep the old machine as a fallback, create the new
one under a different name instead of deleting `dev` first.
