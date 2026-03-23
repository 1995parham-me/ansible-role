====================================
parham_alvani.dotfiles Release Notes
====================================

.. contents:: Topics

v1.0.0
======

Release Summary
---------------

Initial release as an Ansible collection. Migrated from standalone role ``parham_alvani.ansible_role``.

Major Changes
-------------

- Migrated from standalone Ansible role to Ansible collection structure.
- All role variables now use the ``setup_`` prefix (e.g., ``dotfiles_home`` is now ``setup_dotfiles_home``).
- Collection dependencies (``community.general``, ``ansible.posix``) are declared in ``galaxy.yml``.
- Role is now referenced as ``parham_alvani.dotfiles.setup``.
