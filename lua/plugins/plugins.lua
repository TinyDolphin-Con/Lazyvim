return {
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
  -- s1n7ax/nvim-window-picker 窗口选择
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    keys = {
      {
        "sw",
        function()
          local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
          vim.api.nvim_set_current_win(picked_window_id)
        end,
        desc = "Pick a window",
      },
      {
        "sW",
        function()
          local window = require("window-picker").pick_window()
          local target_buffer = vim.fn.winbufnr(window)
          vim.api.nvim_win_set_buf(window, 0)
          vim.api.nvim_win_set_buf(0, target_buffer)
        end,
        desc = "Swap windows",
      },
    },
  },

  -- MattesGroeger/vim-bookmarks 书签
  {
    "MattesGroeger/vim-bookmarks",
    event = "BufRead",
    setup = function()
      vim.cmd([[hi link BookmarkSign TodoSignTODO]])
      vim.cmd([[hi link BookmarkAnnotationSign TodoSignTODO]])
    end,
    keys = {
      { "<leader>ma", "<Cmd>Telescope vim_bookmarks current_file<CR>", desc = "Current_file's bookmarks" },
      { "<leader>mA", "<Cmd>Telescope vim_bookmarks all<CR>", desc = "All bookmarks" },
    },
    config = function()
      vim.g.bookmark_sign = ""
      vim.g.bookmark_annotation_sign = ""
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_no_default_key_mappings = 1
    end,
  },

  -- ThePrimeagen/harpoon 文件收藏夹
  {
    "ThePrimeagen/harpoon",
    cmd = "Telescope harpoon marks",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ha", "<Cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add file" },
      { "<leader>hm", "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle Menu" },
      { "<leader>hj", "<Cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Next" },
      { "<leader>hk", "<Cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Prev" },
      { "<leader>hr", "<Cmd>lua require('harpoon.mark').rm_file()<CR>", desc = "Remove file" },
    },
    config = function()
      require("harpoon").setup({})
      require("telescope").load_extension("harpoon")
    end,
  },
}
