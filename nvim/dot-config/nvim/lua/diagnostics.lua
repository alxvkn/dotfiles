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
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    }
  }
})
