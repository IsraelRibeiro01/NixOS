-- ~/.config/nvim/lua/config/lazy.lua

--
-- 1) Carrega o LazyVim (plugins padrão + atalhos próprios do LazyVim).
-- 2) Carrega extras do LazyVim (por exemplo, lazyvim.plugins.extras.*), caso precise.
-- 3) Por fim, declara e instala os seus próprios plugins (como o Catppuccin)
--    garantindo a ordem: LazyVim → extras → seus plugins.
--

-- 1) Require do LazyVim (ele já faz require("lazyvim.plugins") internamente).
--    Isso carrega TODOS os plugins padrão do LazyVim (core, keymaps, LSP, etc.).
require("lazyvim")

-- 2) Se você usar algum extra oficial do LazyVim, carregue aqui. 
--    Exemplo: require("lazyvim.plugins.extras.lang.go")
--    (Comente ou remova se não estiver usando nenhum extra.)

-- 3) A configuração do lazy.nvim com os seus plugins:
--    * Plugins do LazyVim já vieram no require("lazyvim"), agora declaramos
--      apenas os nossos.
--    * É aqui que indicamos o Catppuccin (repository correto: "catppuccin/nvim").
local my_plugins = {
  -- ========== EXEMPLO: Catppuccin ========== --
  {
    "catppuccin/nvim",        -- repositorio oficial do Catppuccin
    name = "catppuccin",      -- nome usado para chamar depois
    priority = 1000,          -- carrega antes dos outros (= tema padrão)
    config = function()
      -- função executada assim que o plugin for carregado
      -- ativa o tema Catppuccin
      vim.cmd([[colorscheme catppuccin]])
      -- aqui você pode personalizar opções, ex:
      -- vim.g.catppuccin_flavour = "mocha"
    end,
  },

  -- ========== OUTROS PLUGINS, SE NECESSÁRIO ========== --
  -- Por exemplo, para exibir ícones em statusline e árvore de arquivos:
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = { theme = "catppuccin" },
      })
    end,
  },
{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 30, side = "left" },
    })
  end,
},

  -- Se quiser adicionar algum plugin seu, coloque abaixo
  -- { "autor/nome-do-plugin", ... },
}

-- Finaliza a configuração do lazy.nvim
require("lazy").setup(my_plugins, {
  root = vim.fn.stdpath("data") .. "/lazy",  -- onde os plugins ficam instalados
  defaults = { lazy = true },                  -- todos serão carregados sob demanda
  install = {
    colorscheme = { "catppuccin" },            -- diz ao lazy: “use Catppuccin como esquema de cores default”
  },
})

