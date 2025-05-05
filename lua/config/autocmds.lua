-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave", "TabLeave", "FocusLost" }, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local filepath = vim.api.nvim_buf_get_name(buf)

    if
      vim.bo[buf].modifiable
      and vim.bo[buf].modified
      and filepath ~= ""
      and vim.fn.filereadable(filepath) == 1
      and vim.fn.filewritable(filepath) == 1
    then
      vim.cmd("silent! write")
    end
  end,
})
