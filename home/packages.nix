{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
 	# CLi
 	htop
 	ripgrep
 	fd
 	exa
 	tree
 	bat
 	fzf

 	#app
	vesktop
 	vscode

 	# Dev
 	nodejs
 	python3
 	gcc
 	rustc
 	cargo
     ];
  }
