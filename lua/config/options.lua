-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 启用全局选项处理
local opt = vim.opt

-- 设定保存历史记录的行数 (默认值: 50 )
opt.history = 1000

-- 设置键盘启用情况
opt.mouse = "a"

-- 设置同步系统粘贴板
opt.clipboard = "unnamedplus"

-- 显示普通行数
opt.number = true
-- 显示相对行数
opt.relativenumber = true
-- 始终显示 git 状态列（否则每次都会移动文本）
opt.signcolumn = "yes"

-- 启用 wildmenu 命令行菜单：Tab 键可显示匹配内容
opt.wildmenu = true
-- 点击Tab键，将显示可能匹配的文件列表，并使用最长的子串进行补全；
--   再次点击Tab键，可以在wildmenu中遍历匹配的文件列表
opt.wildmode = "longest:full,full"
-- 在匹配列表中忽略指定类型的文件
opt.wildignore = {
  "*.aux,*.out,*.toc",
  "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
  -- media
  "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
  "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
  "*.eot,*.otf,*.ttf,*.woff",
  "*.doc,*.pdf",
  -- archives
  "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
  -- temp/system
  "*.*~,*~ ",
  "*.swp,.lock,.DS_Store,._*,tags.lock",
  -- version control
  ".git,.svn",
}

-- 命令行高度
opt.cmdheight = 2
-- 命令行菜单栏选择
opt.completeopt = "menu,menuone,noselect,noinsert"
-- 左移键回到上一行的行尾，在行尾用右移键能够到下一行的开头
opt.whichwrap = "<,>,b,s,h,l"

-- 文件名自动补全时，忽略文件名的大小写
opt.wildignorecase = true
-- 忽略搜索模式的大小写
opt.ignorecase = true
-- 智能的判断要不要区分搜索模式大小写（只能在 ignorecase 开启时使用）
opt.smartcase = true

-- 高亮显示匹配的括号
opt.showmatch = true
-- 高亮显示匹配括号的时间（单位：十分之一秒）
opt.matchtime = 15

-- 光标距离buffer的顶部或底部分别保持 4、8 行距离
opt.scrolloff = 4
opt.sidescrolloff = 8

-- 开启真彩色模式
opt.termguicolors = true

-- 启用自动读取: 当文件被其他编辑器修改时，自动加载
opt.autoread = true
-- 启用自动保存: 当失去焦点或者离开当前的 buffer 的时候保存
opt.autowrite = true
-- 启用交互式确认，影响文件内容时，向用户进行确认
opt.confirm = true

-- 开启持久性撤销功能
--  意味着即使关闭了缓冲区/Vim，重新进入时仍能执行撤销操作
-- 启用持久化 undo
opt.undofile = true
-- 设置 undo 文件的保存路径
opt.undodir = "/tmp/lazyvim/undo"
-- 更快完成
opt.updatetime = 200

-- 设置折叠
opt.foldenable = true
-- 设置折叠函数
opt.foldmethod = "indent"
-- opt.foldmethod = "expr"
-- 设置折叠表达式
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 设置打开文件时默认的折叠级别
opt.foldlevelstart = 99
-- 指定折叠级别的最大深度
opt.foldlevel = 99
-- 设置代码折叠的最小行数
opt.foldminlines = 3
-- 在左边增加一列显示折叠栏
opt.foldcolumn = "3"

-- 使用空格而非制表符
opt.expandtab = true
-- 将 tab 设置为 2 个空格
opt.tabstop = 2
-- 每一级缩进 2 个空格
opt.shiftwidth = 2
-- 自动缩进：每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出括号
opt.smartindent = true

-- 光标超过 80 行时，进行断行
opt.textwidth = 80
-- 设置不在单词中断行
opt.linebreak = true

-- 向右切分分屏
opt.splitright = true
-- 向下切分分屏
opt.splitbelow = true

-- 指定在缓冲区之间切换时的行为：直接切换过去，而不是新建一个
opt.switchbuf = "useopen,usetab,newtab"

-- 显示特殊字符（比如：Tab、空格、行尾空格、换行符等等）
opt.list = true

-- 弹出窗口的高度
opt.pumheight = 10

-- 普通模式下，按键响应的等待时间（默认 1000）
opt.timeoutlen = 300
-- 插入模式下，按键响应的等待时间（默认 50）
opt.ttimeoutlen = 200
-- 屏幕重绘时间（默认 1000）
opt.redrawtime = 1500
