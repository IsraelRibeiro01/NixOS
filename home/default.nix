
{ config, pkgs, ...}:

{ 
   imports = [
   ./neovim.nix
   ./packages.nix
   ./window-manager/i3.nix
   ./window-manager/hyprland.nix
   ];
}
