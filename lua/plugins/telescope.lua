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
    keys = {
      {
        "<leader>sl",
        "<Cmd> lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Live grep args",
      },
      {
        "<leader>/",
        "<Cmd> lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Live grep args",
      },
    },
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
  -- telescope-fzf-native.nvim 模糊查询
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {},
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        -- prompt_prefix = "   ",
        -- selection_caret = "  ",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
    },
  },
}
