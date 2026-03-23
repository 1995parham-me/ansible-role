<h1 align="center"> parham_alvani.dotfiles </h1>

<p align="center">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/1995parham-me/ansible-role/ci.yml?logo=github&style=for-the-badge&label=CI">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/1995parham-me/ansible-role/test.yml?logo=github&style=for-the-badge&label=Test">
</p>

## Introduction

An Ansible collection that installs Parham Alvani's dotfiles from its [source](https://github.com/1995parham/dotfiles).
It also installs the required packages, vim plugins, etc.

The following modules are configured with `install.sh`:

- `zsh`, `vim`, `tmux`
- `dircolors`
- `wakatime`
- `git`
- bash and python scripts (`owghat`, `rename`, etc.)

## Installation

Install the collection from the Git repository:

```bash
ansible-galaxy collection install git+https://github.com/1995parham-me/ansible-role.git,main
```

Or add it to your `requirements.yml`:

```yaml
collections:
  - name: https://github.com/1995parham-me/ansible-role.git
    type: git
    version: main
```

Then install with:

```bash
ansible-galaxy collection install -r requirements.yml
```

Collection dependencies (`community.general` and `ansible.posix`) are automatically resolved during installation.

## Roles

### `parham_alvani.dotfiles.setup`

The main role that installs dotfiles and configures the development environment.

#### Role Variables

##### Required Variables

`setup_dotfiles_home` specifies the directory for dotfiles. Please note that all configurations are softly linked to this location, so you need
to re-run this role in case of `setup_dotfiles_home` change.

```yaml
setup_dotfiles_home: ~/dotfiles  # Default value
```

`setup_dotfiles_repo` specifies the Git repository URL for the dotfiles.

```yaml
setup_dotfiles_repo: https://github.com/1995parham/dotfiles  # Default value
```

`setup_dotfiles_version` specifies the Git branch, tag, or commit to checkout. This allows you to pin a specific version of your dotfiles.

```yaml
setup_dotfiles_version: main  # Default value, can be a branch, tag, or commit SHA
```

`setup_git_email` and `setup_git_name` contains the user email and name for the git. They are useful if you want to commit anything from your target.

```yaml
setup_git_email: parham.alvani@gmail.com  # Default value
setup_git_name: "Parham Alvani"  # Default value
```

`setup_github_keys_username` is used for fetching trusted SSH keys from GitHub. By default it fetches **1995parham** keys, so you must update it.

```yaml
setup_github_keys_username: 1995parham  # Default value
```

##### System Configuration Variables

`setup_config_system_enabled` controls whether system-level locale configuration should be applied. Set to `true` to enable locale management.

```yaml
setup_config_system_enabled: false  # Default value
```

`setup_config_system_locale` specifies the system locale to be configured when `setup_config_system_enabled` is `true`.

```yaml
setup_config_system_locale: en_US.UTF-8  # Default value
```

`setup_config_system_language` specifies the system language to be configured when `setup_config_system_enabled` is `true`.

```yaml
setup_config_system_language: en_US.UTF-8  # Default value
```

## Testing

This collection uses [Molecule](https://molecule.readthedocs.io/) for testing with Docker containers.

### Prerequisites

Install dependencies using [uv](https://docs.astral.sh/uv/):

```bash
uv sync
```

### Run Tests

Set up the local collection symlink and run the complete test suite:

```bash
just test
```

Or run individual steps:

```bash
# Create collection symlink for local testing
just setup

# Create and prepare containers
just prepare

# Apply the role
just converge

# Run verification tests
just verify

# Login to a container for debugging
just shell ubuntu-latest

# Destroy containers
just destroy
```

## Example Playbook

### Basic Usage

```yaml
# playbook.yml
- hosts: servers
  roles:
    - role: parham_alvani.dotfiles.setup
      vars:
        setup_dotfiles_home: ~/Documents/dotfiles
        setup_git_email: your.email@example.com
        setup_git_name: "Your Name"
        setup_github_keys_username: your-github-username
```

### Advanced Usage with System Configuration

```yaml
# playbook.yml
- hosts: servers
  roles:
    - role: parham_alvani.dotfiles.setup
      vars:
        setup_dotfiles_home: ~/.dotfiles
        setup_dotfiles_repo: https://github.com/yourusername/dotfiles
        setup_dotfiles_version: v1.0.0
        setup_git_email: your.email@example.com
        setup_git_name: "Your Name"
        setup_github_keys_username: your-github-username
        setup_config_system_enabled: true
        setup_config_system_locale: en_US.UTF-8
        setup_config_system_language: en_US.UTF-8
```
