-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

----------------------------
------ Unmap mapping -------
----------------------------
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del({ "n" }, "<leader>ww")
vim.keymap.del({ "n" }, "<leader>wd")
vim.keymap.del({ "n" }, "<leader>w-")
vim.keymap.del({ "n" }, "<leader>w|")
vim.keymap.del({ "n" }, "<leader>-")
vim.keymap.del({ "n" }, "<leader>|")
vim.keymap.del({ "n" }, "<leader>ft")
vim.keymap.del({ "n" }, "<leader>fT")

----------------------------
----- 通用设置 general -----
----------------------------

-- 快速保存
map({ "n" }, "W", ":w<CR>zz", { nowait = true, noremap = true, silent = true })
-- 快速退出
map({ "n" }, "Q", ":q<CR>", { nowait = true, noremap = true, silent = true })
-- 快速保存并退出
map({ "n" }, "qw", ":wq<CR>", { nowait = true, noremap = true, silent = true })
-- 快速保存并退出所有窗口
map({ "n" }, "qa", ":wqa<CR>", { nowait = true, noremap = true, silent = true })
-- 快速保存（修改时保存）并退出所有窗口
map({ "n" }, "qx", ":xa<CR>", { nowait = true, noremap = true, silent = true })

-- 选中全文（普通模式、可视模式和选择模式）
map({ "n", "x" }, "VV", "<Esc>gg0vG$<CR>", { nowait = true, noremap = true, silent = true })
-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader><CR>",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 向下翻转半页并居中（:set scrolloff=999）
-- map("n", "<C-d>", "<C-d>zz", { nowait = true, noremap = true, silent = true })
-- map("n", "<C-u>", "<C-u>zz", { nowait = true, noremap = true, silent = true })
-- 向下翻转整页并居中（:set scrolloff=999）
-- map("n", "<C-f>", "<C-f>zz", { nowait = true, noremap = true, silent = true })
-- map("n", "<C-b>", "<C-b>zz", { nowait = true, noremap = true, silent = true })

-- n 始终向后搜索，N 始终向前搜索
-- taken from https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

map({ "n", "x" }, "r", "gr", { nowait = true, noremap = true, silent = true })
-- 字符替换（建议：使用虚拟替换模式，会按屏幕实际显示宽度来替换字符）
map({ "n", "x" }, "R", "gR", { nowait = true, noremap = true, silent = true })

-- 切换粘贴模式
map("n", "<leader>P", ":setlocal paste!<CR>", { nowait = true, noremap = true, silent = true, desc = "Switch paste" })

-- 切分分屏：右左上下
map("n", "sl", ":set splitright<CR>:vsplit<CR>", { nowait = true, noremap = true, silent = true, desc = "Split right" })
map(
  "n",
  "sh",
  ":set nosplitright<CR>:vsplit<CR>",
  { nowait = true, noremap = true, silent = true, desc = "Split left" }
)
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", { nowait = true, noremap = true, silent = true, desc = "Split top" })
map("n", "sj", ":set splitbelow<CR>:split<CR>", { nowait = true, noremap = true, silent = true, desc = "Split below" })

-- 调整分屏大小
map("n", "sL", "<C-w>>", { noremap = true, silent = true, desc = "Resize right" })
map("n", "sK", "<C-w>-", { noremap = true, silent = true, desc = "Resize top" })
map("n", "sJ", "<C-w>+", { noremap = true, silent = true, desc = "Resize below" })
map("n", "s=", "<C-w>=", { noremap = true, silent = true, desc = "Resize below" })
map("n", "sH", "<C-w><", { noremap = true, silent = true, desc = "Resize left" })

-- 切换上下左右窗口（允许重新映射）
map("n", "<C-h>", "<C-w>h", { nowait = true, silent = true, desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { nowait = true, silent = true, desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { nowait = true, silent = true, desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { nowait = true, silent = true, desc = "Go to right window", remap = true })

-- 移动一行文字
map("n", "<C-S-Up>", "<cmd>m .-2<cr>==", { nowait = true, noremap = true, silent = true, desc = "Move up" })
map("n", "<C-S-Down>", "<cmd>m .+1<cr>==", { nowait = true, noremap = true, silent = true, desc = "Move down" })
map("i", "<C-S-Up>", "<esc><cmd>m .-2<cr>==gi", { nowait = true, noremap = true, silent = true, desc = "Move up" })
map("i", "<C-S-Down>", "<esc><cmd>m .+1<cr>==gi", { nowait = true, noremap = true, silent = true, desc = "Move down" })
map("v", "<C-S-Up>", ":m '<-2<cr>gv=gv", { nowait = true, noremap = true, silent = true, desc = "Move up" })
map("v", "<C-S-Down>", ":m '>+1<cr>gv=gv", { nowait = true, noremap = true, silent = true, desc = "Move down" })

-- 移动到行首行尾
map({ "n", "x" }, "H", "^", { nowait = true, noremap = true, silent = true, desc = "Begin of line" })
map({ "n", "x" }, "L", "$", { nowait = true, noremap = true, silent = true, desc = "End of line" })

-- 进入命令行
map({ "n" }, ";", ":", { nowait = true, noremap = true, silent = true, desc = "Begin of line" })

-- 添加撤销的断点
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- 缩进后，继续选中内容
map({ "n", "x" }, ">", ">gv", { nowait = true, noremap = true, silent = true })
map({ "n", "x" }, "<", "<gv", { nowait = true, noremap = true, silent = true })

-- p 复制时，不拷贝当前选中内容（P 也能满足）
map(
  { "n", "x" },
  "p",
  'p:let @+=@0<CR>:let @"=@0<CR>',
  { nowait = true, noremap = true, silent = true, desc = "Dont copy replaced text" }
)

-- 插入模式中：快速移动
map({ "i" }, "<C-q>", "<ESC>^i", { nowait = true, noremap = true, silent = true, desc = "Begin of line" })
map({ "i" }, "<C-e>", "<End>", { nowait = true, noremap = true, silent = true, desc = "End of line" })
map({ "i" }, "<C-h>", "<Left>", { nowait = true, noremap = true, silent = true, desc = "Move left" })
map({ "i" }, "<C-l>", "<Right>", { nowait = true, noremap = true, silent = true, desc = "Move right" })
map({ "i" }, "<C-j>", "<Down>", { nowait = true, noremap = true, silent = true, desc = "Move down" })
map({ "i" }, "<C-k>", "<Up>", { nowait = true, noremap = true, silent = true, desc = "Move up" })
-- 向后移动一个单词
-- map({ "i" }, "<C-f>", "<C-o>w", { nowait = true, noremap = true, silent = true, desc = "Move a word" })
-- 删除当前行
map({ "i" }, "<C-d>", "<C-o>dd", { nowait = true, noremap = true, silent = true, desc = "Delete current line" })
-- 向后删除
map({ "i" }, "<C-x>", "<Delete>", { nowait = true, noremap = true, silent = true, desc = "Backward belete" })

-- 使当前行居中
map({ "i" }, "<C-z>", "<C-o>zz", { nowait = true, noremap = true, silent = true, desc = "Backward belete" })

----------------------------
----- 插件相关 plugins -----
----------------------------

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- floating terminal
local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end
map("n", "<C-/>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("n", "<leader>tT", function()
--   Util.float_term()
-- end, { desc = "Terminal (cwd)" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- lspconfig
map("n", "gsh", "<Cmd> ClangdSwitchSourceHeader <CR>", { desc = "Switch Source Header" })

-- mini.surround 符号
-- 新增符号：gza
-- 删除符号：gzd
-- 替换符号：gzr
-- 高亮符号：gzh
-- 查找符号：gzf

-- nvim-spectre
-- 开启替换：<leadersr>

-- telescope.nvim 强大的搜索
-- <leader>,  : 搜索所有活动的 buffer
-- <leader>/  : 搜索代码内容（可使用正则表达式）
-- <leader>:  : 搜索命令行历史
-- <leader>f  : 查找文件相关
-- <leader>g  : git 相关
-- <leader>s  : 搜索相关
-- <leader><space>: 搜索所有文件

-- flash.nvim 快速跳转
-- s 常规搜索
-- r Remote

-- gitsigns.nvim
-- ]h  : next_hunk
-- [h  : prev_hunk
-- <leader>g : gitsigns 相关

-- vim-illuminate 自动凸显当前光标所在单词
-- [[ 上一个
-- ]] 下一个

-- bufremove 删除 buffer
-- <leader>bd

-- trouble.nvim 更好的诊断列表
-- <leader>x

-- todo-comments
-- [t 上一个 todo-comments
-- ]t 下一个 todo-comments
-- <leader>xt 列表打开 TODO
-- <leader>xT 列表打开 TODO FIX FIXME
-- <leader>st telescope 打开 TODO
-- <leader>sT telescope 打开 TODO FIX FIXME

-- bufferline
-- <leader>bp 钉住 buffer
-- <leader>bP 删除未被钉住的 buffer

-- noice.nvim
-- <leader>sn 相关快捷键

-- persistence.nvim
-- <leader>qs : 恢复会话
-- <leader>ql : 恢复最近一次会话
-- <leader>qd : 不保存当前恢复
