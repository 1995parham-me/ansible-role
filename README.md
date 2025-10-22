<h1 align="center"> 1995parham's dotfiles Ansible role </h1>

<p align="center">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/1995parham-me/ansible-role/ci.yaml?logo=github&style=for-the-badge">
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

`dotfiles_home` specifies the directory for dotfiles. Please note that all configurations are softly linked to this location, so you need
to re-run this role in case of `dotfiles_home` change.

```yaml
dotfiles_home: $HOME/Documents/dotfiles
```

`git_email` and `git_name` contains the user email and name for the git. They are useful if you want to commit anything from your target.

```yaml
git_email: parham.alvani@gmail.com
git_name: "Parham Alvani"
```

`github_keys_username` is using for fetching trusted keys from GitHub, by default it fetches **1995parham** keys, so you must update it.

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

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
# playbook.yml
- hosts: servers
  roles:
    - { role: parham_alvani.ansible_role, vars: { dotfiles_home: ~/Documents/dotfiles } }
```

```yaml
# requirements.yml
- src: https://github.com/1995parham-me/ansible-role.git
  scm: git
  version: main
  name: parham_alvani.ansible_role
```
