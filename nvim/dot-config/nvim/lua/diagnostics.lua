-- highlight the number instead of using signcolumn
-- for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
--     vim.fn.sign_define("DiagnosticSign" .. diag, {
--         text = "",
--         texthl = "DiagnosticSign" .. diag,
--         linehl = "",
--         numhl = "DiagnosticSign" .. diag,
--     })
-- end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
