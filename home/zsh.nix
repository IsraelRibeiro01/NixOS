{ config, pkgs, ...}:

 {
   programs.zsh = {
   enable = true;
   enableCompletion = true;
   enableAutosuggestions  = true;
   syntaxHightlighting.enable = true;

   initExtra = ''

   export EDITOR=nvim
   alias ll='ls -l'
   alias gs='git status'

   if [ -f ~/.zshrc ]; then
     source ~/.zshrc
   fi
  '';

  oh-my-zsh = {
   enable = true;
   plugins - [ "git" "docker" "sudo" ];
   theme = gallifrey;
  };
 };

   users.defaultUserShell = pkgs.zsh;
}
