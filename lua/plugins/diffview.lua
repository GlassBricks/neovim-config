local diffviewClose = { "n", "q", vim.cmd.DiffviewClose, { desc = "Quit Diffview" } }
return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
    "DiffviewClose",
    "DiffviewFocusFiles",
    "DiffviewToggleFiles",
  },
  keys = {
    { "<leader>gi", vim.cmd.DiffviewOpen, desc = "Diffview (index)" },
    {
      "<leader>gD",
      function()
        vim.cmd("DiffviewOpen HEAD")
      end,
      desc = "Diffview (HEAD)",
    },
    {
      "<leader>gh",
      function()
        vim.cmd("DiffviewFileHistory %")
      end,
      desc = "Git history (file)",
    },
    {
      "<leader>gh",
      ":DiffviewFileHistory<cr>",
      desc = "Git history (selection)",
      mode = "v",
    },
    { "<leader>gH", vim.cmd.DiffviewFileHistory, desc = "Git history (all)" },
    { "<leader>gq", vim.cmd.DiffviewClose, { desc = "Quit Diffview" } },
  },
  opts = {
    keymaps = {
      file_panel = { diffviewClose },
      file_history_panel = { diffviewClose },
      diff1 = { diffviewClose },
      diff2 = { diffviewClose },
      diff3 = { diffviewClose },
    },
  },
}
