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
}
