local function neotree_switch_or_toggle(dir, allow_switch_in_tree)
  local state = require("neo-tree.sources.manager").get_state("filesystem")
  local curwin = vim.api.nvim_get_current_win()
  if (not state.winid or state.path ~= dir)
      and ( state.winid ~= curwin or allow_switch_in_tree) then
    -- closed or wrong place, just open
    require("neo-tree.command").execute({ dir = dir })
  else
    -- close
    require("neo-tree.command").execute({ action = "close" })
  end
end

vim.keymap.set("n", "<leader>fE", function()
  neotree_switch_or_toggle(vim.uv.cwd())
end)

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>fe",
      function()
        neotree_switch_or_toggle(LazyVim.root())
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>fE",
      function()
        neotree_switch_or_toggle(vim.uv.cwd(), true)
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
}
