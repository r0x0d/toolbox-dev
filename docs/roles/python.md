# Python

Config key: `languages.python_development`

## What it installs

**DNF packages:**

- `python3-devel`, `python3-pip`
- `yamllint`, `ruff`, `pre-commit`, `uv`
- `pipx`, `poetry`, `tox`, `python3-virtualenv`
- Extra interpreters with headers: `python3.9` ... `python3.14` (+ `-devel`)
- pyenv build dependencies: `patch`, `zlib-devel`, `bzip2`,
  `bzip2-devel`, `readline-devel`, `sqlite`, `sqlite-devel`,
  `tk-devel`, `libffi-devel`, `xz-devel`, `libuuid-devel`,
  `gdbm-libs`, `libnsl2`

**Pip packages:**

- `pyright==1.1.407`

## Usage

```yaml
languages:
  python_development: true
```

### Tunables

| Variable | Default | Description |
|----------|---------|-------------|
| `python_extra_versions` | `["3.9", "3.10", "3.11", "3.12", "3.13", "3.14"]` | Extra Fedora-packaged interpreters (`[]` to skip) |

Create a venv for a specific version with `python3.11 -m venv .venv` or
`uv venv -p 3.11`. For versions Fedora doesn't ship, `uv python install 3.8`.

## Notes

The pyenv build dependencies are included so you can install additional
Python versions with [pyenv](https://github.com/pyenv/pyenv) if needed.
pyenv itself is not installed -- use `pip install pyenv` or install it
manually.
