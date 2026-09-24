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


-- enable TS and Rust LSPs
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")

vim.lsp.set_log_level("debug")

-- Custom stack thingy

local nav_stack = {}

-- NAV STACK UI

local nav_stack_win = nil
local nav_stack_buf = nil

local function render_nav_stack()
  -- close if empty
  if #nav_stack == 0 then
    if nav_stack_win and vim.api.nvim_win_is_valid(nav_stack_win) then
      vim.api.nvim_win_close(nav_stack_win, true)
    end
    nav_stack_win = nil
    nav_stack_buf = nil
    return
  end

  -- build display lines, most recent first, capped at 5
  local lines = {}
  local count = math.min(#nav_stack, 5)
  for i = 0, count - 1 do
    local frame = nav_stack[#nav_stack - i]
    local filename = vim.fn.fnamemodify(frame.file, ":t")
    table.insert(lines, string.format("%d: %s → %s:%d", i + 1, frame.symbol, filename, frame.line))
  end

  if not nav_stack_buf or not vim.api.nvim_buf_is_valid(nav_stack_buf) then
    nav_stack_buf = vim.api.nvim_create_buf(false, true) -- unlisted, scratch
  end
  vim.api.nvim_buf_set_lines(nav_stack_buf, 0, -1, false, lines)

  local width = 0
  for _, l in ipairs(lines) do
    width = math.max(width, #l)
  end
  width = width + 2

  if not nav_stack_win or not vim.api.nvim_win_is_valid(nav_stack_win) then
    nav_stack_win = vim.api.nvim_open_win(nav_stack_buf, false, {
      relative = "editor",
      anchor = "NE",
      row = 0,
      col = vim.o.columns,
      width = width,
      height = #lines,
      style = "minimal",
      border = "rounded",
      focusable = false,
    })
  else
    vim.api.nvim_win_set_config(nav_stack_win, {
      relative = "editor",
      anchor = "NE",
      row = 0,
      col = vim.o.columns,
      width = width,
      height = #lines,
    })
  end
end

-- CORE MECHANISM


-- push stuff

local function push_nav_frame()
  local symbol = vim.fn.expand("<cword>")
  local bufnr = vim.api.nvim_get_current_buf()
  local pos = vim.api.nvim_win_get_cursor(0) -- { line, col }
  table.insert(nav_stack, {
    symbol = symbol,
    file = vim.api.nvim_buf_get_name(bufnr),
    line = pos[1],
    col = pos[2],
  })
  render_nav_stack()
end

local function goto_definition_with_stack()
  push_nav_frame()
  vim.lsp.buf.definition()
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "gd", goto_definition_with_stack, { buffer = bufnr, desc = "Go to definition (LSP)" })
  end,
})

-- pop stuff

local function pop_nav_frame()
  if #nav_stack == 0 then
    vim.cmd("normal! \25") -- fallback to native Ctrl-O
    return
  end

  local frame = table.remove(nav_stack)
  vim.cmd("edit " .. vim.fn.fnameescape(frame.file))
  vim.api.nvim_win_set_cursor(0, { frame.line, frame.col })
  render_nav_stack()
end

vim.keymap.set("n", "<C-o>", pop_nav_frame, { desc = "Pop nav stack (fallback: native jumplist)" })

vim.api.nvim_create_user_command("NavStack", function()
  print(vim.inspect(nav_stack))
end, {})

