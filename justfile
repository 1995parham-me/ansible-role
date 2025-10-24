# Run molecule converge (apply role to test containers)
converge:
    uv run molecule converge

# Run molecule test (full test suite)
test:
    uv run molecule test

# Destroy test containers
destroy:
    uv run molecule destroy

# Create and prepare test containers
prepare:
    uv run molecule create
    uv run molecule prepare

# Verify test results
verify:
    uv run molecule verify

# List running molecule containers
list:
    docker ps --filter "name=ubuntu-latest" --filter "name=archlinux-latest"

# Connect to ubuntu container as testuser
shell-ubuntu:
    docker exec -it -u testuser ubuntu-latest bash

# Connect to archlinux container as testuser
shell-arch:
    docker exec -it -u testuser archlinux-latest bash

# Clean up and run full test
clean-test: destroy test
