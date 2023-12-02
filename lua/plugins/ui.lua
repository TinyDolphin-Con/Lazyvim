return {
  -- folke/edgy.nvim 导航栏
  -- {
  --   "folke/edgy.nvim",
  --   event = "VeryLazy",
  --   -- opts = function(_, opts)
  --   -- end,
  --   opts = function()
  --     local opts = {
  --       options = {
  --         left = { size = 30 },
  --         bottom = { size = 10 },
  --         right = { size = 30 },
  --         top = { size = 10 },
  --       },
  --       animate = {
  --         enabled = true,
  --         fps = 100, -- frames per second
  --         cps = 120, -- cells per second
  --         on_begin = function()
  --           vim.g.minianimate_disable = true
  --         end,
  --         on_end = function()
  --           vim.g.minianimate_disable = false
  --         end,
  --         -- Spinner for pinned views that are loading.
  --         -- if you have noice.nvim installed, you can use any spinner from it, like:
  --         -- spinner = require("noice.util.spinners").spinners.circleFull,
  --         spinner = {
  --           frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
  --           interval = 80,
  --         },
  --       },
  --       -- enable this to exit Neovim when only edgy windows are left
  --       exit_when_last = false,
  --       -- close edgy when all windows are hidden instead of opening one of them
  --       -- disable to always keep at least one edgy split visible in each open section
  --       close_when_all_hidden = true,
  --       -- global window options for edgebar windows
  --       ---@type vim.wo
  --       wo = {
  --         -- Setting to `true`, will add an edgy winbar.
  --         -- Setting to `false`, won't set any winbar.
  --         -- Setting to a string, will set the winbar to that string.
  --         winbar = true,
  --         winfixwidth = true,
  --         winfixheight = false,
  --         winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
  --         spell = false,
  --         signcolumn = "no",
  --       },
  --       bottom = {
  --         {
  --           ft = "toggleterm",
  --           size = { height = 0.4 },
  --           filter = function(buf, win)
  --             return vim.api.nvim_win_get_config(win).relative == ""
  --           end,
  --         },
  --         {
  --           ft = "noice",
  --           size = { height = 0.4 },
  --           filter = function(buf, win)
  --             return vim.api.nvim_win_get_config(win).relative == ""
  --           end,
  --         },
  --         {
  --           ft = "lazyterm",
  --           title = "LazyTerm",
  --           size = { height = 0.4 },
  --           filter = function(buf)
  --             return not vim.b[buf].lazyterm_cmd
  --           end,
  --         },
  --         "Trouble",
  --         { ft = "qf", title = "QuickFix" },
  --         {
  --           ft = "help",
  --           size = { height = 20 },
  --           -- don't open help files in edgy that we're editing
  --           filter = function(buf)
  --             return vim.bo[buf].buftype == "help"
  --           end,
  --         },
  --         { ft = "spectre_panel", size = { height = 0.4 } },
  --         { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
  --       },
  --       left = {
  --         {
  --           title = "Neo-Tree",
  --           ft = "neo-tree",
  --           filter = function(buf)
  --             return vim.b[buf].neo_tree_source == "filesystem"
  --           end,
  --           pinned = true,
  --           open = function()
  --             vim.api.nvim_input("<esc><space>e")
  --           end,
  --           size = { height = 0.4 },
  --         },
  --         { title = "Neotest Summary", ft = "neotest-summary" },
  --         {
  --           title = "Neo-Tree Git",
  --           ft = "neo-tree",
  --           filter = function(buf)
  --             return vim.b[buf].neo_tree_source == "git_status"
  --           end,
  --           pinned = true,
  --           open = "Neotree position=right git_status",
  --           size = { height = 0.2 },
  --         },
  --         {
  --           title = "Neo-Tree Buffers",
  --           ft = "neo-tree",
  --           filter = function(buf)
  --             return vim.b[buf].neo_tree_source == "buffers"
  --           end,
  --           pinned = true,
  --           open = "Neotree position=top buffers",
  --           size = { height = 0.2 },
  --         },
  --
  --         "neo-tree",
  --       },
  --       right = {},
  --       top = {},
  --       keys = { -- close window
  --         ["q"] = function(win)
  --           win:close()
  --         end,
  --         -- hide window
  --         ["<c-q>"] = function(win)
  --           win:hide()
  --         end,
  --         -- close sidebar
  --         ["Q"] = function(win)
  --           win.view.edgebar:close()
  --         end,
  --         -- next open window
  --         ["]w"] = function(win)
  --           win:next({ visible = true, focus = true })
  --         end,
  --         -- previous open window
  --         ["[w"] = function(win)
  --           win:prev({ visible = true, focus = true })
  --         end,
  --         -- next loaded window
  --         ["]W"] = function(win)
  --           win:next({ pinned = false, focus = true })
  --         end,
  --         -- prev loaded window
  --         ["[W"] = function(win)
  --           win:prev({ pinned = false, focus = true })
  --         end,
  --         -- increase width
  --         ["<c-w>>"] = function(win)
  --           win:resize("width", 2)
  --         end,
  --         -- decrease width
  --         ["<c-w><lt>"] = function(win)
  --           win:resize("width", -2)
  --         end,
  --         -- increase height
  --         ["<c-w>+"] = function(win)
  --           win:resize("height", 2)
  --         end,
  --         -- decrease height
  --         ["<c-w>-"] = function(win)
  --           win:resize("height", -2)
  --         end,
  --         -- reset all custom sizing
  --         ["<c-w>="] = function(win)
  --           win.view.edgebar:equalize()
  --         end,
  --       },
  --     }
  --     local Util = require("lazyvim.util")
  --     if Util.has("symbols-outline.nvim") then
  --       table.insert(opts.left, {
  --         title = "Outline",
  --         ft = "Outline",
  --         pinned = true,
  --         open = "SymbolsOutline",
  --         size = { height = 0.4 },
  --       })
  --     end
  --     return opts
  --   end,
  -- },
  -- tokyonight transparent 主题透明
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
