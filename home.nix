{ config, pkgs, inputs, ...}:
{ 
  imports = [
  ./home/default.nix
  ];

 home.username = "gaku";
 home.homeDirectory = "/home/gaku";
 home.stateVersion = "25.05";

}
