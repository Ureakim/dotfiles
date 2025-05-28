set unstable

# choose podman if available, or docker instead
container_engine := env('CONTAINER_ENGINE', '') || which('podman') || which('docker')
userns := if container_engine == "docker" { "host" } else { "keep-id" }

build:
	{{container_engine}} build -t ureakim/ansible -f Containerfile .

run:
	{{container_engine}} run --rm -it --init --privileged \
		-v .:/home/ubuntu/.ansible/collections/ansible_collections:Z \
		-w /home/ubuntu/.ansible/collections/ansible_collections/net/ureakim/extensions \
		--userns={{userns}} \
		ureakim/ansible

