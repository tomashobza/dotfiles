-- Line numbers
vim.opt.number = true -- show absolute line number on current line
vim.opt.relativenumber = true -- show relative numbers on other lines
vim.opt.clipboard = "unnamedplus" -- use the OS clipboard for yanking

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
  },
})

vim.lsp.enable("ts_ls")

vim.lsp.set_log_level("debug")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition (LSP)" })
  end,
})

