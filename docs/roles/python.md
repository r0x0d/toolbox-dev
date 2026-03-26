# Python

Config key: `languages.python_development`

## What it installs

**DNF packages:**

- `python3-devel`, `python3-pip`
- `yamllint`, `ruff`, `pre-commit`
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

## Notes

The pyenv build dependencies are included so you can install additional
Python versions with [pyenv](https://github.com/pyenv/pyenv) if needed.
pyenv itself is not installed -- use `pip install pyenv` or install it
manually.
