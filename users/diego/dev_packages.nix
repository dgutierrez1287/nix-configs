{lib, config, pkgs, os, ...}:

{
	home.packages = with pkgs; [
		# infra as code tools
		tfenv
        #awscli2

		# golang
		go
		gopls

		# nodejs
		nodejs-16_x

        # latex
        texlive.combined.scheme-full

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
        #docker-compose_2
        #docker-compose

		# database stuff
		fsql

        # terminal web browser
        lynx

        # aws-nuke
        aws-nuke
      ]
      ++ (if os == "Linux"
          then [
            awscli2
            docker-compose
          ]
          else []);
}
