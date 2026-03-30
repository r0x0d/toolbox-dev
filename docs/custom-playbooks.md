# Custom Playbooks

You can extend toolbox-dev with your own Ansible task files. Custom playbooks
let you install additional packages, copy dotfiles, configure services, or
anything else Ansible can do -- without forking the project.

## How it works

1. Write a standard Ansible task file
2. List its path under `custom_playbooks` in your config
3. Run `tdx-apply` -- your tasks execute after all built-in roles

Custom playbooks run as `post_tasks` in the main playbook, so they have
access to all variables set up by toolbox-dev:

| Variable             | Description                    |
|----------------------|--------------------------------|
| `tdx_user`           | The real (non-root) user       |
| `tdx_user_home`      | User's home directory          |
| `tdx_user_bin`       | `~/.local/bin` path            |
| `tdx_container_name` | Name of the toolbox container  |

## Setup

### 1. Create a task file

A custom playbook is a YAML file containing a list of Ansible tasks.
Place it anywhere you like -- `~/.config/toolbox-dev/playbooks/` is a
good convention:

```bash
mkdir -p ~/.config/toolbox-dev/playbooks
```

Example -- `~/.config/toolbox-dev/playbooks/my-tools.yml`:

```yaml
- name: Install extra CLI tools
  ansible.builtin.dnf:
    name:
      - htop
      - tmux
      - bat
    state: present

- name: Copy my gitconfig
  ansible.builtin.copy:
    src: "{{ tdx_user_home }}/.gitconfig-shared"
    dest: "{{ tdx_user_home }}/.gitconfig"
    owner: "{{ tdx_user }}"
    mode: "0644"
    remote_src: true
```

### 2. Register it in your config

Open your config with `tdx-edit` and add the `custom_playbooks` list:

```yaml
languages:
  python_development: true
  nodejs_development: false
  # ...

environments:
  fedora_packaging: false

custom_playbooks:
  - ~/.config/toolbox-dev/playbooks/my-tools.yml
```

You can list as many playbooks as you need. They run in order.

### 3. Apply

```bash
tdx-apply
```

Your custom tasks will run after all built-in roles have completed.

## Tips

- **Idempotent tasks** -- Use `state: present` for packages and `creates:`
  guards for one-time commands, so re-running `tdx-apply` is safe.

- **User-level tasks** -- Tasks run as root by default (via `sudo`). For tasks
  that should run as the regular user, add `become: false`:

    ```yaml
    - name: Create user config directory
      ansible.builtin.file:
        path: "{{ tdx_user_home }}/.config/my-app"
        state: directory
        owner: "{{ tdx_user }}"
        mode: "0755"
    ```

- **Available collections** -- The `community.general` Ansible collection is
  pre-installed. You can use modules like `community.general.npm`,
  `community.general.gem`, etc.

- **Debugging** -- Run with verbose output to troubleshoot:

    ```bash
    tdx-apply -v
    ```

- **Dry run** -- Preview what your playbook would do without applying changes:

    ```bash
    tdx-apply --check
    ```

## Removing a custom playbook

Remove the entry from `custom_playbooks` in your config. Note that any
packages installed by the playbook will remain -- Ansible does not
automatically undo previous runs. To clean up, you can write a separate
task with `state: absent`.
