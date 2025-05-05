return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = {
      pattern = [[.*(KEYWORDS)[\d\s]*:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\d*:]],
    },
  },
}
