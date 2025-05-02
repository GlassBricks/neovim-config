local gitui_fixed = "bash -c 'eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa && gitui'"

return {
  "williamboman/mason.nvim",
  keys = {
    {
      "<leader>gG",
      function()
        Snacks.terminal(gitui_fixed)
      end,
      desc = "GitUi (cwd)",
    },
    {
      "<leader>gg",
      function()
        Snacks.terminal(gitui_fixed, { cwd = LazyVim.root.get() })
      end,
      desc = "GitUi (Root Dir)",
    },
  },
}
