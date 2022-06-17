{lib, config, pkgs, ...}:

{
	home.packages = with pkgs; [
		# infra as code tools
		tfenv
		awscli2

		# golang
		go
		gopls

		# nodejs
		nodejs-16_x

		# Python 
		python310

		# C
		gcc

		# java
		jdk
		jbang
		groovy

		#language servers
		sumneko-lua-language-server

		# docker
		docker-compose_2
		docker-compose

		# database stuff
		fsql
	];
}