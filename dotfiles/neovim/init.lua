-- ~/.config/nvim/init.lua

-- 1) Bootstrapping do lazy.nvim: clona automaticamente caso não exista
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- última versão estável
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2) Define opções gerais (números de linha, colunas de sinal etc)
vim.opt.number = true                 -- número absoluto à esquerda
vim.opt.relativenumber = false        -- se quiser relativo, troque para true
vim.opt.signcolumn = "yes"            -- sempre reserva espaço para ícones de LSP/diagnóstico
vim.opt.termguicolors = true          -- habilita TrueColor para o tema funcionar direito

-- 3) Carrega os plugins via lazy.nvim; a lista vem de lua/plugins.lua
require("lazy").setup(require("plugins"), {
  install = {
    colorscheme = { "catppuccin" },   -- diz que, por padrão, o tema é Catppuccin
  },
  defaults = { lazy = true },         -- carrega plugins “por demanda” (lazy)
  checker = { enabled = true },       -- verifica atualizações dos plugins
})
-- Função que força grupos com fundo transparente
local function make_transparent()
  vim.cmd("highlight Normal guibg=none")
  vim.cmd("highlight NormalFloat guibg=none")
  vim.cmd("highlight SignColumn guibg=none")
  vim.cmd("highlight EndOfBuffer guibg=none")
  vim.cmd("highlight NvimTreeNormal guibg=none")
  vim.cmd("highlight TelescopePromptNormal guibg=none")
  vim.cmd("highlight TelescopeResultsNormal guibg=none")
  vim.cmd("highlight TelescopePreviewNormal guibg=none")
end

-- Aplica assim que iniciar o Neovim (depois que plugins e tema carregarem)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    make_transparent()
  end,
})

-- Aplica sempre que um novo colorscheme for carregado
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    make_transparent()
  end,
})

