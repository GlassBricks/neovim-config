return {
  {
    name = "arista",
    dir = "/usr/share/vim/vimfiles/",
    cond = function()
      return vim.fn.isdirectory("/usr/share/vim/vimfiles/")
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
  },
  -- lsps
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tac = {},
        clangd = {
          init_options = {
            compilationDatabasePath = "/src",
            root_dir = "/src",
          },
        },
      },
      setup = {
        tac = function(_, opts)
          local lspconfig = require("lspconfig")
          local configs = require("lspconfig.configs")

          if not configs.tac then
            configs.tac = {
              default_config = {
                cmd = {
                  "/usr/bin/artaclsp",
                  "-I",
                  "/bld",
                },
                filetypes = { "tac" },
                root_dir = "/src",
              },
            }
          end
          lspconfig.tac.setup(opts)
        end,
      },
    },
  },
  -- clang format
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["clang-format"] = {
          command = "/usr/bin/clang-format",
        },
      },
      formatters_by_ft = {
        cpp = {
          "clang-format",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      ---@class config
      local configs = require("nvim-treesitter.parsers").get_parser_configs()
      configs.tac = {
        install_info = {
          url = "~/src/tree-sitter-tac/",
          files = {
            "src/parser.c",
            "src/scanner.cc",
          },
        },
      }
    end,
  },
}
