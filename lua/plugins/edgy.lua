return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    if vim.g.neovide then
      vim.tbl_deep_extend("force", opts, {
        animate = { enabled = false },
      })
    end
    vim.list_extend(opts.left, {
      {
        title = "Explorer",
        ft = "snacks_layout_box",
        pinned = true,
        open = function()
          Snacks.explorer.open()
        end,
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
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
