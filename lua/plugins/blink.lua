local win_options = {
  border = "rounded",
  winblend = 20,
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
