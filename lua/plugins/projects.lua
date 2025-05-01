return {
  "ahmedkhalf/project.nvim",
  opts = {
    patterns = {
      ".project-root",
      ".git",
      "compile_commands.json",
      "Makefile",
      "package.json",
      "Cargo.toml",
      "pyproject.toml",
      "requirements.txt",
      ".env",
    },
    show_hidden = true,
    silent_chdir = false,
  },
}
