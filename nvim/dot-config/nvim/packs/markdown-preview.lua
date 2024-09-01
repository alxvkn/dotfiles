return {
  'iamcco/markdown-preview.nvim',
  build = function() vim.fn["mkdp#util#install"]() end
  -- config = function()
  --   vim.api.nvim_create_user_command(
  --     'MarkdownPreviewInstall',
  --     vim.fn["mkdp#util#install"],
  --     {}
  --   )
  -- end
}
