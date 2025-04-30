local function toggleTreeFocus(dir)
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("wincmd l")
  else
    require("neo-tree.command").execute({ dir = dir })
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    -- handled instead in keymaps.lua
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
