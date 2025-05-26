FROM ubuntu:latest

RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository --yes --update ppa:ansible/ansible && \
	apt install -y --no-install-recommends util-linux ansible podman \
		python3 python3-pip python3-dev libssl-dev && \
	rm -rf /var/lib/apt/lists/*

RUN export PIP_BREAK_SYSTEM_PACKAGES=1 && \
	python3 -m pip install molecule ansible-core && \
	python3 -m pip install --upgrade --user setuptools && \
	python3 -m pip install --user molecule && \
	python3 -m pip install --user molecule ansible-lint && \
	python3 -m pip install --user "molecule-plugins[podman]"

CMD [ "/usr/bin/bash" ]
