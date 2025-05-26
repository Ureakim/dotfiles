container_engine := `command -v podman || command -v docker`

build:
	{{container_engine}} build -t ureakim/ansible -f Containerfile .

up:
	{{container_engine}} run --rm -it --init -v .:/root/.ansible/collections/ansible_collections:Z ureakim/ansible
