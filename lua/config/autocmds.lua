-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- 设置自动切换行数显示
-- 进入缓冲区或离开插入模式时，高亮当前行 & 显示相对行数
vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
  group = augroup("CursorLineOnlyInActiveWindow"),
  callback = function()
    vim.opt_local.cursorline = true
    vim.opt_local.relativenumber = true
  end,
})
-- 离开缓冲区或进入插入模式时，取消高亮当前行 & 取消显示相对行数
vim.api.nvim_create_autocmd({ "BufLeave", "InsertEnter" }, {
  group = augroup("CursorLineOnlyInActiveWindow_"),
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
  end,
})
