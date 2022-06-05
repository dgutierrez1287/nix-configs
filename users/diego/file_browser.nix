{lib, config, pkgs, username, ...}:
{
	home.file.".app_config/filebrowser/.keep".text = "";

	home.file."docker_compose_config/filebrowser.yml".text = ''
---
version: '3'
services:
  file-browser:
    image: filebrowser/filebrowser:v2
    container_name: file-browser
    user: 1000:1000
    ports:
      - 8000:80
    volumes:
      - /home/${username}:/srv
      - /home/${username}/.app_config/filebrowser/filebrowser.db:/database.db
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true'';
}