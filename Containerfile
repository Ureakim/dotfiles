FROM ubuntu:latest

RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository --yes --update ppa:ansible/ansible && \
	apt install -y util-linux ansible podman uidmap fuse-overlayfs \
		python3 python3-pip python3-dev libssl-dev && \
	rm -rf /var/lib/apt/lists/*

RUN export PIP_BREAK_SYSTEM_PACKAGES=1 && \
	python3 -m pip install molecule ansible-core pytest pytest-testinfra && \
	python3 -m pip install --upgrade --user setuptools && \
	python3 -m pip install --user molecule && \
	python3 -m pip install --user molecule ansible-lint && \
	python3 -m pip install --user "molecule-plugins[podman]" && \
	python3 -m pip install --user "molecule-plugins[testinfra]"

CMD [ "/usr/bin/bash" ]
