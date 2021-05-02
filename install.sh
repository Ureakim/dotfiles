dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf update
dnf install -y compton redshift alacritty zsh fontawesome-fonts julietaula-montserrat-fonts rofi arandr htop ffmpeg keepassxc syncthing
