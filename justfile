default:
    @just --list

# run molecule converge (apply role to test containers)
converge:
    uv run molecule converge

# run molecule test (full test suite)
test:
    uv run molecule test

# destroy test containers
destroy:
    uv run molecule destroy

# create and prepare test containers
prepare:
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
