return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      matcher = {
        frecency = true,
        cwd_bonus = true,
      },
      projects = {
        patterns = {
          ".project-root",
          ".git",
          "compile_commands.json",
          "Makefile",
        },
      },
    },
  },
}
