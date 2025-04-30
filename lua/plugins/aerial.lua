return {
  "stevearc/aerial.nvim",
  opts = {
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Module",
      "Method",
      "Struct",

      "Object",
      "Property",
      "Namespace",
    },
  },
  keys = {
    {
      "<leader>cs",
      function()
        if vim.bo.filetype == "aerial" then
          vim.cmd("wincmd h")
        else
          vim.cmd("AerialOpen")
        end
      end,
      desc = "Aerial (Symbols)",
    },
  },
}
