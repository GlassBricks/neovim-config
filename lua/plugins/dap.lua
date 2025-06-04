return {
  {
    "mfussenegger/nvim-dap",
    opts = {
      defaults = {
        python = {
          exception_breakpoints = { "uncaught", "userUnhandled" },
        },
      },
    },
    config = function()
      local dap = require("dap")
      --dap.listeners.before.event_terminated["dapui_config"] = nil
      --dap.listeners.before.event_exited["dapui_config"] = nil
    end,
  },
  {
    "lucaSartore/nvim-dap-exception-breakpoints",
    dependencies = { "mfussenegger/nvim-dap" },

    config = function()
      local set_exception_breakpoints = require("nvim-dap-exception-breakpoints")

      vim.api.nvim_set_keymap(
        "n",
        "<leader>dE",
        "",
        { desc = "[E]xception breakpoints", callback = set_exception_breakpoints }
      )
    end,
  },
}
