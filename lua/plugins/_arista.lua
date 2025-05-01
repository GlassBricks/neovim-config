local function setup_lsp(name, config)
  return function(_, opts)
    local configs = require("lspconfig.configs")
    local lspconfig = require("lspconfig")
    if not configs[name] then
      configs[name] = config
    end
    lspconfig[name].setup(opts)
  end
end

return {
  { -- arista configs
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
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "pyright",
      },
    },
  },
  { -- tac and s4 lsps
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tac = {},
        s4 = {},
        clangd = {
          init_options = {
            compilationDatabasePath = "/src",
            root_dir = "/src",
          },
        },
      },
      setup = {
        tac = setup_lsp("tac", {
          default_config = {
            cmd = {
              "/usr/bin/artaclsp",
              "-I",
              "/bld",
            },
            filetypes = { "tac" },
            root_dir = "/src",
          },
        }),
        s4 = setup_lsp("s4", {
          default_config = {
            cmd = {
              "/usr/bin/s4lsp",
              "-I",
              "/bld",
            },
            filetiypes = { "s4" },
            root_dir = "/src",
          },
        }),
      },
    },
  },
  { -- tac treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      LazyVim.format()
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
  { -- Formatters
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- use container's /usr/bin/clang-format, so it understands basedOnStyle: Aristra
        ["clang-format"] = {
          command = "/usr/bin/clang-format",
        },
        yapf = {
          prepend_args = {
            "--style",
            "/home/benjamin.ye/opt/yapf.cfg",
          },
        },
      },
      formatters_by_ft = {
        cpp = { "clang-format" },
        python = { "yapf" },
      },
    },
  },
}
