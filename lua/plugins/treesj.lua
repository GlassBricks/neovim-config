return {
  "Wansmer/treesj",
  keys = {
    {
      "H",
      function()
        require("treesj").toggle()
      end,
      desc = "Split/Join",
      mode = "n",
    },
  },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      max_join_length = 300,
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
