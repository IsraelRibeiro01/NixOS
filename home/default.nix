
{ config, pkgs, ...};

{ 
   imports = [
   ./zsh.nix
   ./neovim.nix
   ./packages.nix
   ./window-managers/i3.nix
   ./window-managers/hyprland.nix
   ];

   #basic config
   home.username = "gaku"
   home.homeDirectory = "home/gaku";
   home.stateVersion = "25.05";
