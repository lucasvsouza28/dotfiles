-- opts
vim.o.swapfile = false

-- maps
local map = vim.keymap.set

map("n", "<C-r>", function() vim.cmd [[:silent! exec "make run"]] end, { desc = "Make [r]un" })
