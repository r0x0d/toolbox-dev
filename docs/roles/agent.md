# Agent

Config key: `environments.agent`

## What it installs

**DNF packages:**

- `goose` — AI agent for development workflows

**NPM global packages:**

- `opencode-ai` — OpenCode AI coding agent (from [opencode.ai](https://opencode.ai))
- `@earendil-works/pi-coding-agent` — Pi coding agent
- `@oh-my-pi/pi-coding-agent` — Oh My Pi coding agent

## Usage

```yaml
environments:
  agent: true
```

## Notes

OpenCode, pi and omp are installed via the official npm package rather than the install script,
which provides better idempotency and removal support through Ansible.
