{ config, pkgs, ...}:
 
 {
   programs.neovim = {
     enable = true;
     viAlias = true;
     vimAlias = true;

     extraConfig = ''
       lua require('init')
     '';

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      plenary-nvim
    ];
  };
 }
