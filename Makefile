.PHONY: build
build:
	podman build -t ureakim/ansible .

.PHONY: up
up:
	podman run --rm -it --init -v .:/root/.ansible/collections/ansible_collections:Z ureakim/ansible
