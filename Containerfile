FROM fedora:latest

RUN dnf -y update
RUN dnf -y install util-linux ncurses procps-ng ansible podman
RUN dnf -y install gcc python3-pip python3-devel openssl-devel python3-libselinux
RUN python3 -m ensurepip && \
	python3 -m pip install molecule ansible-core && \
	python3 -m pip install --upgrade --user setuptools && \
	python3 -m pip install --user molecule && \
	python3 -m pip install --user molecule ansible-lint && \
	python3 -m pip install --user "molecule-plugins[podman]"
RUN dnf clean all

CMD [ "/usr/bin/bash" ]
