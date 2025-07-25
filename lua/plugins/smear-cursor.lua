return {
  "sphamba/smear-cursor.nvim",
  opts = {
    stiffness = 0.8,
    trailing_stiffness = 0.5,
    stiffness_insert_mode = 0.6,
    trailing_stiffness_insert_mode = 0.6,
    distance_stop_animating = 0.5,
    gamma = 1,
  },
  cond = not vim.g.neovide,
}
