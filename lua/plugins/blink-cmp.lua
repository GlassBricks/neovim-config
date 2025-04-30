local win_options = {
  winblend = vim.o.winblend,
}
return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = win_options,
        documentation = {
          window = win_options,
        },
      },
      signature = {
        enabled = true,
        window = win_options,
      },
    },
  },
}
