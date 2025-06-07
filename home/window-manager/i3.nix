{ config, pkgs, ... }:

{ 
  xsession.enable = true;
  xsession.windowManager.i3 = {
   enable = true;
   config = {
     modifier = "Mod4";
     bars = [ ];
     keybindings = {
        "Mod4+Return" = "exec ghostty";
	"Mod4+d" = "exec rofi -show drun";
	"Mod4+q" = "kill";
   };
 };
};

 home.packages = with  pkgs; [
  i3status
  dmenu
 ];
}

