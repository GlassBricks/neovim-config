return {
  "echasnovski/mini.diff",
  opts = function(_, opts)
    local MiniDiff = require("mini.diff")
    opts.source = {
      MiniDiff.gen_source.git(),
      MiniDiff.gen_source.save(),
    }
  end,
}
