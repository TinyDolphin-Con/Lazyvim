return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- Configure LazyVim to load tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
