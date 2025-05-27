return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    notifier = {
      top_down = false,
      style = "fancy",
    },
    picker = {
      matcher = {
        frecency = true,
        cwd_bonus = true,
      },
      hidden = true,
      ignored = true,
      sources = {
        projects = {
          patterns = {
            ".project-root",
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>fl",
      function()
        Snacks.explorer.open({ cwd = vim.fn.input("Open dir:") })
      end,
      desc = "Explorer Snacks (specify dir)",
    },
  },
}
