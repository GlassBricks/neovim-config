return {
  {
    "aerial.nvim",
    opts = {
      open_automatic = function(bufnr)
        local aerial = require("aerial")
        -- Enforce a minimum line count
        return vim.api.nvim_buf_line_count(bufnr) > 80
          -- Enforce a minimum symbol count
          and aerial.num_symbols(bufnr) > 4
          -- A useful way to keep aerial closed when closed manually
          and not aerial.was_closed()
      end,
    },
  },
}
