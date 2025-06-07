{ config, pkgs, ... }:

{ 
 wayland.windowManager.hyprland = {
  enable = true;
  settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, RETURN, exec, ghostty"
      "$mod, D, exec, rofi -show drun"
   ];
  monitor = ",preferred,auto,auto";
   };
  };
 home.packages = with pkgs; [
  rofi-wayland
  waybar
  ];
}


