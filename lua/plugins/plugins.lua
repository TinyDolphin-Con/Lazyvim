return {
  -- s1n7ax/nvim-window-picker 窗口选择 TODO:(config)
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      -- require("custom.configs.window-picker")
    end,
  },

  -- MattesGroeger/vim-bookmarks 书签 TODO:(config)
  {
    "MattesGroeger/vim-bookmarks",
    event = "BufRead",
    setup = function()
      vim.cmd([[hi link BookmarkSign TodoSignTODO]])
      vim.cmd([[hi link BookmarkAnnotationSign TodoSignTODO]])
    end,
    config = function()
      vim.g.bookmark_sign = ""
      vim.g.bookmark_annotation_sign = ""
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_no_default_key_mappings = 1
    end,
  },

  -- ThePrimeagen/harpoon 文件收藏夹 TODO:(config)
  {
    "ThePrimeagen/harpoon",
    cmd = "Telescope harpoon marks",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup({})
      require("telescope").load_extension("harpoon")
    end,
  },

  -- telescope-vim-bookmarks.nvim 书签搜索
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function()
      require("telescope").load_extension("vim_bookmarks")
      require("telescope").load_extension("noice")
    end,
  },
  -- telescope-live-grep-args.nvim 可指定参数的文本搜索
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },
  -- telescope-ui-select.nvim 搜索和选择
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
