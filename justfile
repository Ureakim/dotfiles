set unstable

# choose podman if available, or docker instead
container_engine := env('CONTAINER_ENGINE', '') || which('podman') || which('docker')
container_args := if container_engine == "docker" {
	'--user ' + `id -u` + ':' + `id -g`
} else {
	''
}
container_mountpoint := '/home/ubuntu/.ansible/collections/ansible_collections'
container_launch := container_engine + ' run --rm -it --init --privileged -v .:' + container_mountpoint + ':Z'
image_name := 'ureakim/ansible'
test_script := './testall.sh'

build:
	{{container_engine}} build -t {{image_name}} -f Containerfile .

run:
	{{container_launch}} {{container_args}} -w {{container_mountpoint}} {{image_name}}

test:
	{{container_launch}} {{container_args}} -w {{container_mountpoint}} {{image_name}} {{test_script}}
