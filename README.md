<h1 align="center"> 1995parham's dotfiles Ansible role </h1>

<p align="center">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/1995parham-me/ansible-role/ci.yml?logo=github&style=for-the-badge&label=CI">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/1995parham-me/ansible-role/test.yml?logo=github&style=for-the-badge&label=Test">
</p>

## Introduction

This role installs the Parham Alvani's dotfiles from its [source](https://github.com/1995parham/dotfiles).
It also installs the required packages, vim plugins, etc.

The following modules are configured with `install.sh`:

- `zsh`, `vim`, `tmux`
- `dircolors`
- `wakatime`
- `git`
- bash and python scripts (`owghat`, `rename`, etc.)

## Requirements

This role depends on `community.general` and `ansible.posix` collections. Install them using:

```bash
ansible-galaxy collection install -r requirements.yml
```

## Role Variables

### Required Variables

`dotfiles_home` specifies the directory for dotfiles. Please note that all configurations are softly linked to this location, so you need
to re-run this role in case of `dotfiles_home` change.

```yaml
dotfiles_home: ~/dotfiles  # Default value
```

`dotfiles_repo` specifies the Git repository URL for the dotfiles.

```yaml
dotfiles_repo: https://github.com/1995parham/dotfiles  # Default value
```

`dotfiles_version` specifies the Git branch, tag, or commit to checkout. This allows you to pin a specific version of your dotfiles.

```yaml
dotfiles_version: main  # Default value, can be a branch, tag, or commit SHA
```

`git_email` and `git_name` contains the user email and name for the git. They are useful if you want to commit anything from your target.

```yaml
git_email: parham.alvani@gmail.com  # Default value
git_name: "Parham Alvani"  # Default value
```

`github_keys_username` is used for fetching trusted SSH keys from GitHub. By default it fetches **1995parham** keys, so you must update it.

```yaml
github_keys_username: 1995parham  # Default value
```

### System Configuration Variables

`config_system_enabled` controls whether system-level locale configuration should be applied. Set to `true` to enable locale management.

```yaml
config_system_enabled: false  # Default value
```

`config_system_locale` specifies the system locale to be configured when `config_system_enabled` is `true`.

```yaml
config_system_locale: en_US.UTF-8  # Default value
```

`config_system_language` specifies the system language to be configured when `config_system_enabled` is `true`.

```yaml
config_system_language: en_US.UTF-8  # Default value
```

## Testing

This role uses [Molecule](https://molecule.readthedocs.io/) for testing with Docker containers.

### Prerequisites

Install Molecule and Docker support:

```bash
pip install molecule molecule-plugins[docker] docker
```

### Run Tests

Run the complete test suite (creates containers, applies role, verifies, and destroys):

```bash
molecule test
```

Or run individual steps:

```bash
# Create containers
molecule create

# Apply the role
molecule converge

# Run verification tests
molecule verify

# Login to a container for debugging
molecule login --host ubuntu-jammy

# Destroy containers
molecule destroy
```

The test suite validates:

- Dotfiles repository is cloned
- Symbolic links are created correctly
- Required packages are installed
- Git configuration is set up
- ZSH is installed and configured

## Example Playbook

### Basic Usage

```yaml
# playbook.yml
- hosts: servers
  roles:
    - role: parham_alvani.ansible_role
      vars:
        dotfiles_home: ~/Documents/dotfiles
        git_email: your.email@example.com
        git_name: "Your Name"
        github_keys_username: your-github-username
```

### Advanced Usage with System Configuration

```yaml
# playbook.yml
- hosts: servers
  roles:
    - role: parham_alvani.ansible_role
      vars:
        dotfiles_home: ~/.dotfiles
        dotfiles_repo: https://github.com/yourusername/dotfiles
        dotfiles_version: v1.0.0  # Pin to specific version/tag/branch
        git_email: your.email@example.com
        git_name: "Your Name"
        github_keys_username: your-github-username
        config_system_enabled: true
        config_system_locale: en_US.UTF-8
        config_system_language: en_US.UTF-8
```

### Role Installation

```yaml
# requirements.yml
- src: https://github.com/1995parham-me/ansible-role.git
  scm: git
  version: main
  name: parham_alvani.ansible_role
```

Then install with:

```bash
ansible-galaxy role install -r requirements.yml
```
