return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- config = function() vim.cmd "colorscheme rose-pine" end,
  },

  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup {
        transparent = true,
      }
      --vim.cmd("colorscheme vague")
    end,
  },
}
