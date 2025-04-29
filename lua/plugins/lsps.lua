return {

  "nvim-lspconfig",
  opts = {
    codelens = {
      enabled = true,
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
