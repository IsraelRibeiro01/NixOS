{ config, pkgs, ...}:

let 
 nvimConfigDir = "/etc/nixos/dotfiles/neovim";

 neovimConfig = pkgs.stdenv.mkDerivation {
   name = "neovim-config";
   buildCommand = ''
     mkdir -p $out
     ln -s ${nvimConfigDir} $out/nvim
    '';
  };
 in
 {
   programs.neovim = {
     enable = true;
     viAlias = true;
     vimAlias = true;

     extraConfig = ''
     " << EOF
      vim.opt.runtimepath:prepend("${nvimConfigDir}")
      require('init')
      EOF
    '';

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      plenary-nvim
    ];
  };

  xdg.configFile."nvim" = {
     source = "${neovimConfig}/nvim";
     recursive = true;
   };
 }
