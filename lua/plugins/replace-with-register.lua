return {
  "vim-scripts/ReplaceWithRegister",
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(Keys, {
        { "gr", false },
      })
    end,
  },
}
