# .NET

Config key: `languages.dotnet_development`

## What it installs

**DNF packages:**

- `dotnet-sdk-10.0`
- `dotnet-runtime-10.0`
- `libicu`

**Additional SDKs (via `dotnet-install.sh`):**

- .NET 8.0 and 9.0 SDKs

## Usage

```yaml
languages:
  dotnet_development: true
```

### Tunables

| Variable | Default | Description |
|----------|---------|-------------|
| `dotnet_extra_channels` | `["8.0", "9.0"]` | Older SDK channels to install side by side (`[]` to skip) |
| `dotnet_root` | `/usr/lib64/dotnet` | Install location (Fedora's dotnet root) |

## Notes

Fedora only packages .NET 10.0+. Older channels are installed with Microsoft's
[`dotnet-install.sh`](https://learn.microsoft.com/dotnet/core/tools/dotnet-install-script)
into the same root, so a single `dotnet` sees every SDK (`dotnet --list-sdks`).
Pin a project with `global.json`.
