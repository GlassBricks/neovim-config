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
      sources = {
        projects = {
          patterns = {
            "compile_commands.json",
            ".project-root",
            ".git",
          },
        },
      },
    },
  },
}
