{config, pkgs,inputs,...}:

{
 programs.zsh = {
   enableCompletion = true;
   syntaxHighlighting.enable = true;

   oh-my-zsh = {
     enable = true;
     plugins = [ "git" "docker" "sudo" ];
     theme = "agnoster";
   };
  };
 }
