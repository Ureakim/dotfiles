set unstable

# choose podman if available, or docker instead
container_engine := which("podman") || which("docker")

build:
	{{container_engine}} build -t ureakim/ansible -f Containerfile .

run:
	{{container_engine}} run --rm -it --init --privileged \
		-v .:/home/ubuntu/.ansible/collections/ansible_collections:Z \
		-w /home/ubuntu/.ansible/collections/ansible_collections/net/ureakim/extensions \
		ureakim/ansible
