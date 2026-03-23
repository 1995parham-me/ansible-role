default:
    @just --list

# create symlink structure so ansible can discover the collection locally
setup:
    mkdir -p .collections/ansible_collections/parham_alvani
    ln -sfn "$(pwd)" .collections/ansible_collections/parham_alvani/dotfiles

# run molecule converge (apply role to test containers)
converge: setup
    uv run molecule converge

# run molecule test (full test suite)
test: setup
    uv run molecule test

# destroy test containers
destroy:
    uv run molecule destroy

# create and prepare test containers
prepare: setup
    uv run molecule create
    uv run molecule prepare

# verify test results
verify:
    uv run molecule verify

# list molecule containers
list:
    uv run molecule list

# connect to a specific container as testuser
shell container:
    docker exec -it -u testuser {{ container }} bash

# clean up and run full test
clean-test: destroy test
