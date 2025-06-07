{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
 	# CLi
 	htop
 	ripgrep
 	fd
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
