# Agent

Config key: `environments.agent`

## What it installs

**DNF packages:**

- `goose` — AI agent for development workflows
- `nodejs`, `nodejs-npm`, `nodejs-devel` — pulled in from the [Node.js](node.md) role's
  runtime tasks (no need to enable `languages.nodejs_development`)

**NPM global packages:**

- `@anthropic-ai/claude-code` — [Claude Code](https://docs.claude.com/en/docs/claude-code)
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

Claude Code is installed globally by root, so its auto-updater is disabled via
`/etc/profile.d/tdx-agent.sh` (`DISABLE_AUTOUPDATER=1`); set
`agent_claude_disable_autoupdater: false` to skip that. Update it with
`sudo npm update -g @anthropic-ai/claude-code`. Since toolbox shares your home
directory, Claude Code uses the same `~/.claude` config and login as the host.
