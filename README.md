# 1995parham dotfiles

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/1995parham-me/ansible-role/ci?label=ci&logo=github&style=flat-square)

## Introduction

This role installs the Parham Alvani's dotfiles from its [source](https://github.com/1995parham/dotfiles).
It also installs the required packages, vim plugins, etc.

The following modules are configured with `install.sh`:

- `zsh`, `vim`, `tmux`
- `dircolors`
- `wakatime`
- `git`
- bash scripts (`owghat`, `rename`, etc.)

## Requirements

This role depends on _community.general_ collection and there is no way for setting this in role metadata.

```bash
ansible-galaxy collection install community.general
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

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
# playbook.yml
- hosts: servers
  roles:
    - { role: 1995parham-me, vars: { dotfiles_home: $HOME/Documents/dotfiles } }
```

```yaml
# requirements.yml
- src: https://github.com/1995parham-me/ansible-role.git
  scm: git
  version: main
  name: 1995parham-me
```
