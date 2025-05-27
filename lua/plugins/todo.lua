return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)[0-9\s]*:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\d*:]],
    },
  },
}
