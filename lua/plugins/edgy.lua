return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    if vim.g.neovide then
      vim.tbl_deep_extend("force", opts, {
        animate = { enabled = false },
      })
    end
    vim.list_extend(opts.left, {
      --dap scopes, breakpoints, stacks, watches
      {
        title = "Vars",
        ft = "dapui_scopes",
      },
      {
        title = "Breakpoints",
        ft = "dapui_breakpoints",
      },
      {
        title = "Stacks",
        ft = "dapui_stacks",
      },
      {
        title = "Watches",
        ft = "dapui_watches",
      },
    })
    vim.list_extend(opts.bottom, {
      {
        title = "Dap REPL",
        ft = "dap-repl",
      },
      {
        title = "Dap console",
        ft = "dapui_console",
      },
    })
  end,
}
