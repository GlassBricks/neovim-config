return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = false,
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              paramType = true,
              paramName = true,
              setType = true,
            },
          },
        },
      },
    },
  },
}
