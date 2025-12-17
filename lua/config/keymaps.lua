vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank Text" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Yank Text" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank Text" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank Text" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Put Text From Clipboard After Cursor" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Put Text From Clipboard Before Cursor" })
vim.keymap.set("n", "<leader>gp", '"+gp', { desc = "Put Text From Clipboard After Selection" })
vim.keymap.set("n", "<leader>gP", '"+gP', { desc = "Put Text From Clipboard Before Selection" })
vim.keymap.set("n", "<leader>]p", '"+]p', { desc = "Put Indented From Clipboard After Cursor" })
vim.keymap.set("n", "<leader>[p", '"+[p', { desc = "Put Indented From Clipboard Before Cursor" })

if not vim.g.vscode then
  return
end

local vscode = require("vscode")

local function esc()
  local key = vim.api.nvim_replace_termcodes("<esc>", true, true, true)
  vim.api.nvim_feedkeys(key, "n", false)
end

local k = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { expr = true })
end

local comment = vscode.to_op(function(ctx)
  local cmd = "editor.action.commentLine"
  local opts = { range = nil, callback = esc }
  if ctx.is_current_line then
    opts.range = nil
  end
  vscode.action(cmd, opts)
end)

k({ "n", "x" }, "gc", comment)
k({ "n", "x" }, "<Plug>VSCodeCommentary", comment)
