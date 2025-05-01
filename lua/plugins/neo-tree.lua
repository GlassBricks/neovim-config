local function toggleTreeFocus(dir)
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("wincmd l")
  else
    require("neo-tree.command").execute({ dir = dir })
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sync_root_with_cwd = true,
    respsect_buf_cwd = true,
    updated_focused_file = {
      enabled = true,
      update_root = true,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        toggleTreeFocus(LazyVim.root())
      end,
      desc = "Focus explorer (root)",
    },
    {
      "<leader>e",
      function()
        toggleTreeFocus(vim.uv.cwd())
      end,
      desc = "Focus explorer (root)",
    },
  },
}
