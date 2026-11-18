# Node.js

Config key: `languages.nodejs_development`

## What it installs

**DNF packages:**

- `nodejs`, `nodejs-npm`, `nodejs-devel`
- Extra majors: `nodejs24`, `nodejs26` (+ `-npm`)

**Global npm packages:**

- `pnpm` (latest)
- `yarn` (latest)

## Usage

```yaml
languages:
  nodejs_development: true
```

### Tunables

| Variable | Default | Description |
|----------|---------|-------------|
| `nodejs_extra_versions` | `[24, 26]` | Extra Fedora-packaged Node.js majors (`[]` to skip) |

## Notes

Extra majors are installed as versioned binaries (`node-24`, `npm-24`, ...);
plain `node` remains the Fedora default.
