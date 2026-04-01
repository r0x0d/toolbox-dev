# Adding New Roles

This guide explains how to add a new role to toolbox-dev.

## 1. Create the role directory

Roles are organized into categories under `ansible/roles/`:

```text
ansible/roles/
├── languages/          # Programming language toolchains
└── environments/       # Specialized development environments
```

Create a new directory under the appropriate category with both `tasks/` and `defaults/`:

```text
ansible/roles/languages/your_language_development/
├── defaults/
│   └── main.yml
└── tasks/
    └── main.yml
```

Use a descriptive name -- e.g., `python_development`, `fedora_packaging`.

## 2. Define the binaries list

Create `defaults/main.yml` with the list of binaries your role provides.
These are used to create host wrapper scripts in `~/.local/bin/`:

```yaml
---
your_language_development_binaries:
  - your-compiler
  - your-package-manager
```

The variable name must match the pattern `<role_name>_binaries`.

## 3. Write the tasks

The `tasks/main.yml` contains the Ansible tasks. Every task must include
a `when:` condition so the role can handle both the enabled
(install + create wrappers) and disabled (remove wrappers) states.

**Template:**

```yaml
---
- name: Install packages
  ansible.builtin.dnf:
    name:
      - your-compiler
      - your-package-manager
    state: present
  when: languages.your_language_development | default(false) | bool

# ... any post-install tasks with the same when condition ...

- name: Manage wrapper scripts
  ansible.builtin.include_role:
    name: internal/bin_wrapper
  vars:
    bin_wrapper_binaries: "{{ your_language_development_binaries }}"
    bin_wrapper_enabled: "{{ languages.your_language_development | default(false) | bool }}"
```

### Tips for writing tasks

- Use `state: present` for DNF packages (idempotent -- safe to run multiple times)
- For commands that should only run once, use `creates:` to guard them:

  ```yaml
  - name: Initialize something
    ansible.builtin.command: some-init-command
    args:
      creates: /path/that/exists/after/init
  ```

- Use `become: false` on tasks that should run as the user, not root
- The `community.general` collection is available -- use
  `community.general.npm`, `community.general.gem`, etc. instead of
  raw shell commands when possible
- The `internal/bin_wrapper` include must always be the last task

## 4. Register the role in the playbook

Add your role to `ansible/playbook.yml` under the appropriate category
comment. Roles are included **without** a `when:` clause -- each role
handles its own enabled/disabled logic internally:

```yaml
roles:
  # Languages
  # ... existing roles ...
  - role: languages/your_language_development
```

## 5. Add the config key to defaults

Add your role's toggle to `ansible/defaults.yml` under the appropriate category:

```yaml
languages:
  # ... existing entries ...
  your_language_development: false
```

## 6. Add documentation

Create a docs page at `docs/roles/your-language.md`:

```markdown
# Your Language

Config key: `languages.your_language_development`

## What it installs

**DNF packages:**

- `your-compiler`
- `your-package-manager`

**Host wrappers:** `your-compiler`, `your-package-manager`

## Usage

\```yaml
languages:
  your_language_development: true
\```
```

Then add it to the nav in `mkdocs.yml`:

```yaml
nav:
  - Roles:
      # ... existing entries ...
      - Your Language: roles/your-language.md
```

And add a row to the appropriate table in `docs/roles/index.md`.

## 7. Test locally

Build and test the image with your new role enabled:

```bash
make build
podman run --rm local/toolbox-dev bash -c "
  cat > /tmp/test.yml <<EOF
languages:
  your_language_development: true
EOF
  sudo ansible-playbook /usr/share/toolbox-dev/ansible/playbook.yml \
    --extra-vars '@/tmp/test.yml'
"
```

## Checklist

- [ ] `defaults/main.yml` with binaries list
- [ ] `tasks/main.yml` with install tasks, wrapper creation, and wrapper removal
- [ ] All tasks guarded with `when:` condition
- [ ] Role added to `ansible/playbook.yml` (no `when:` on the role itself)
- [ ] Config key added to `ansible/defaults.yml`
- [ ] Documentation page in `docs/roles/`
- [ ] Role added to nav in `mkdocs.yml`
- [ ] Role added to table in `docs/roles/index.md`
- [ ] Tested locally with `make build`
