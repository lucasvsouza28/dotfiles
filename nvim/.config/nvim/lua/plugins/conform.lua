return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      elixir = { "mix" },
      eex = { "mix" },
      heex = { "mix" },
      lua = { "stylua" },
      cs = { "csharpier" },
      csharp = { "csharpier" },
    },
    formatters = {
      -- mix = {
      --   command = "mix",
      --   args = { "format", "-" },
      --   stdin = true,
      --   condition = function() return vim.fn.executable "mix" == 1 end,
      -- },
      -- stylua = {
      --   command = "stylua",
      --   args = { "-" },
      --   stdin = true,
      --   condition = function() return vim.fn.executable "stylua" == 1 end,
      -- },
    },
    notify_on_error = true,
    log_level = vim.log.levels.WARN,
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true, -- Use LSP formatting if conform formatter fails
      quiet = false, -- Show errors if formatting fails
    },
  },
}
