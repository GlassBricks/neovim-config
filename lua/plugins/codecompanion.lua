if false then
  return {}
end

local adapter = vim.env["GEMINI_API_KEY"] and "gemini" or nil

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      "j-hui/fidget.nvim",
    },
    opts = {
      strategies = {
        chat = { adapter = adapter },
        inline = {
          adapter = adapter,
          keymaps = {
            accept_change = {
              modes = { n = "<leader>at" },
              description = "Accept suggested change",
            },
            reject_change = {
              modes = { n = "<leader>ar" },
              description = "Reject suggested change",
            },
          },
        },
        cmd = { adapter = adapter },
      },
      display = {
        diff = { enabled = true },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    },
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
      require("plugins.codecompanion.extmarks").setup()
    end,
    keys = {
      { "<leader>a", "", desc = "Ai" },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "chat", mode = { "n", "v" } },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "inline", mode = { "n", "v" } },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "actions", mode = { "n", "v" } },
      { "<leader>ag", "<cmd>CodeCompanionChat Add<cr>", desc = "add context", mode = { "n", "v" } },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}
