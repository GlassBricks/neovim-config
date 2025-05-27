return {
  {
    "mfussenegger/nvim-dap",
    opts = {
      defaults = {
        fallback = {
          exception_breakpoints = { "uncaught", "userUnhandled" },
        },
      },
    },
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
