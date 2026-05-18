GNOME_ROLE_FILE_PATH := "./roles/gnome/files"
RUN_PLAYBOOK_CMD := "ansible-playbook --ask-become-pass"

prepare:
	pipx install --include-deps ansible

azrael:
	{{RUN_PLAYBOOK_CMD}} playbooks/azrael.yml

save-dconf:
	dconf dump /org/gnome/desktop/wm/keybindings/ > {{GNOME_ROLE_FILE_PATH}}/dconf_gnome_desktop_wm_keybindings.dconf
	dconf dump /org/gnome/desktop/input-sources/ > {{GNOME_ROLE_FILE_PATH}}/dconf_gnome_desktop_input-sources.dconf
	dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > {{GNOME_ROLE_FILE_PATH}}/dconf_gnome_settings-daemon_plugins_media-keys.dconf
	dconf dump /org/gnome/shell/keybindings/ > {{GNOME_ROLE_FILE_PATH}}/dconf_gnome_shell_keybindings.dconf
	dconf dump /org/gnome/shell/extensions/ > {{GNOME_ROLE_FILE_PATH}}/dconf_gnome_shell_extensions.dconf

save-extensions:
	gnome-extensions list --enabled > {{GNOME_ROLE_FILE_PATH}}/extensions_list.txt

