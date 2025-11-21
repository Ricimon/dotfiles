local vimrc = vim.fn.stdpath("config") .. "/nvimrc.vim"
vim.cmd.source(vimrc)

require ("config.lazy")

-- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#setup
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- keybinds
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

-- LSP
vim.lsp.inlay_hint.enable(true)
