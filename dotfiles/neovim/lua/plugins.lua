-- ~/.config/nvim/lua/plugins.lua

return {
  -- ===================================
  -- 1) Tema Catppuccin
  --    https://github.com/catppuccin/nvim
  -- ===================================
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,  -- carrega antes dos outros, para tema já estar ativo
    config = function()
      vim.g.catppuccin_flavour = "mocha"  -- ou "latte", "frappe", "macchiato"
      vim.g.catppuccin_transparent_background = true
      vim.cmd([[colorscheme catppuccin]])

      vim.cmd("highlight Normal guibg=none")
      vim.cmd("highlight NormalFloat guibg=none")
      vim.cmd("highlight SignColumn guibg=none")
      vim.cmd("highlight EndOfBuffer guibg=none")
      -- Se você usar nvim-tree:
     vim.cmd("highlight NvimTreeNormal guibg=none")
     -- Se usar Telescope:
     vim.cmd("highlight TelescopePromptNormal guibg=none")
     vim.cmd("highlight TelescopeResultsNormal guibg=none")
     vim.cmd("highlight TelescopePreviewNormal guibg=none")
    end,
  },

  -- ===================================
  -- 2) Ícones (web-devicons)
  --    para statusline, file explorer, etc.
  -- ===================================
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,        -- carrega sob demanda
  },

  -- ===================================
  -- 3) Statusline (exemplo com lualine)
  --    https://github.com/nvim-lualine/lualine.nvim
  -- ===================================
  {
    "nvim-lualine/lualine.nvim",
   event = "VeryLazy",
    config = function()
      -- configuração de exemplo para reproduzir algo similar à sua screenshot
      require("lualine").setup({
        options = {
          icons_enabled = true,       -- ativa ícones (branch, arquivo, etc)
          theme = "auto",             -- detecta automaticamente seu colorscheme
          section_separators = { left = '', right = '' }, -- Nerd Font chars
          component_separators = { left = '', right = ''},
	  disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          always_divide_middle = false,
        },
        sections = {
          -- à esquerda (normalmente mode, branch, diff, diagnostics…)
          lualine_a = { 
	    "mode"    },        -- mostra o modo (NORMAL, INSERT, etc)
          lualine_b = {
            {
              "branch",                  -- mostra o branch Git
              icon = "",               -- ícone de Git (ou outro de sua escolha)
            },
            { "diff", colored = true },  -- mostra +num/−num de mudanças Git (se estiver em repositório)
            { "diagnostics", sources = { "nvim_diagnostic" } },
          },
          lualine_c = {
          {
              "filename",               -- mostra o nome do arquivo (ex: configuration.nix)
              file_status = true,       -- mostra “+” se o arquivo estiver modificado
              path = 1,                 -- 0 = só nome, 1 = caminho relativo, 2 = caminho absoluto
            },
          },
          -- à direita (filetype, encoding, posición, percentual, etc)
          lualine_x = {
            {
              "filetype",               -- tipo do arquivo (nix, lua, py, etc)
              icon_only = false,        -- se true, só exibe o ícone; false exibe o nome “Nix” completo
              colored = true,
	      color = { bg = "NONE", fg = "#FFFFFF"},
	      separator = "",
	      padding = { left = 1, right = 1},
            },
            "encoding",                  -- UTF-8, etc
            "fileformat",                -- unix, dos, mac
          },
          lualine_y = { "progress" },    -- exibe porcentagem do arquivo (Top, Bot, 45%, etc)
          lualine_z = { "location" },    -- ex: “1:1” (linha e coluna)
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        extensions = {},
      })
-- 1) modo normal
vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "NONE", fg = "#FFFFFF", bold = true })
-- 2) modo insert (caso queira aplicar também quando você entrar em modo INSERT)
vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "NONE", fg = "#FFFFFF", bold = true })
-- 3) modo visual
vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "NONE", fg = "#FFFFFF", bold = true })
-- 4) modo replace
vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "NONE", fg = "#FFFFFF", bold = true })
-- 5) modo command (caso use)
vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "NONE", fg = "#FFFFFF", bold = true })
-- 6) modo inactive (janela que não estiver em foco)
vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "NONE", fg = "#FFFFFF", bold = true })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE', fg = '#ffffff' }) -- letras brancas, fundo transparente
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE', fg = '#888888' }) -- para buffers não focados
    end, 
  },

  -- ===================================
  -- 4) Nvim-tree (explorador de arquivos)
  --    https://github.com/nvim-tree/nvim-tree.lua
  --    (opcional, caso queira ícones na árvore)
  -- ===================================
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    lazy = true,
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = {
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
      })
    end,
  },
-- ============================================
  -- 5) Alpha-Nvim (tela inicial)
  -- ============================================
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ----- CABEÇALHO ASCII: "NMIXX" -----
      dashboard.section.header.val = {
	  "█████ █   █ █     █ █   █ █   █ █████",
          "██     █ █  █     █ █   █  █ █      █",
          "████    █   █  █  █ █████   █      █ ",
          "██     █ █  █ █ █ █ █   █   █     █  ",
          "██    █   █ ██   ██ █   █   █    █   ",
          "█████ █   █ █     █ █   █   █   █████",
      }

      -- ----- BOTÕES DA TELA INICIAL -----
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Buscar arquivo", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Arquivos recentes", ":Telescope oldfiles<CR>"),
        dashboard.button("n", "  Novo arquivo", ":ene <BAR> startinsert<CR>"),
        dashboard.button("s", "  Pesquisar texto", ":Telescope live_grep<CR>"),
        dashboard.button("c", "  Configurações", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "  Sair", ":qa<CR>"),
      }

      -- ----- CENTRALIZAÇÃO E CONFIGURAÇÃO FINAL -----
      dashboard.config.opts.noautocmd = true
      alpha.setup(dashboard.config)
    end,
  },

  -- ============================================
  -- 6) Telescope (busca de arquivos e live_grep)
  -- ============================================
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "❯ ",
          selection_caret = "➤ ",
          path_display = { "smart" },
        },
      })
    end,
  },

  -- ======================================================
  -- 7) Caso queira que o próprio Lazy.nvim faça conferência
  --    de atualizações automáticas, mantenha o checker:
  -- ======================================================
  -- (Não precisa declarar: já passamos checker = {enabled = true} no setup)
}

