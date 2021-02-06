# 1995parham dotfiles

[![Travis (.com)](https://img.shields.io/travis/com/1995parham-me/ansible-role?logo=travis&style=flat-square)](https://travis-ci.com/github/1995parham-me/ansible-role)

## Introduction

This role installs the Parham Alvani's dotfiles from its [source](https://github.com/1995parham/dotfiles).
It also installs the required packages, vim plugins, etc.

## Requirements

There isn't any requirement for this role.

## Role Variables

`dotfiles_home` specifies the directory for dotfiles. Plase note that all configurations are soft linked to this location so you need
to re-run this role in case of `dotfiles_home` change.

```yaml
dotfiles_home: $HOME/Documents/dotfiles
```

`git_email` and `git_name` contains the user email and name for the git. they are useful if you want to commit anything from your target.

```yaml
git_email: parham.alvani@gmail.com
git_name: "Parham Alvani"
```

`github_keys_username` is using for fetching trusted keys from github, by default it fetches **1995parham** keys so you must update it.

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
