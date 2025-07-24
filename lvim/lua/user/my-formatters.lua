local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
}
