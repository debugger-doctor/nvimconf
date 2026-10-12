-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- No Neovim 0.12+, o comando :LspInfo legado foi descontinuado em favor do :checkhealth vim.lsp.
-- Criamos o comando :LspInfo como alias para manter a compatibilidade e conveniência:
vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, { desc = "Status e informações dos servidores LSP" })
