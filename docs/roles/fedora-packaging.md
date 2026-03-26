# Fedora Packaging

Config key: `environments.fedora_packaging`

## What it installs

**DNF packages:**

- `fedpkg`, `packit`
- `copr`, `copr-rpmbuild`
- Conversion tools: `rust2rpm`, `go2rpm`, `cargo2rpm`, `pyp2spec`, `rubygem-gem2rpm`
- `patch`, `tomcli`, `xxd`
- `python3-pip`
- `pyproject-rpm-macros`, `cargo-rpm-macros`

**Pip packages:**

- `woolly`, `fuzzytail`
- `cookiecutter`, `jinja2_time`

## Usage

```yaml
environments:
  fedora_packaging: true
```
