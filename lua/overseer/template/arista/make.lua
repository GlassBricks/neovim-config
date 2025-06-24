local TAG = require("overseer.constants").TAG
local overseer = require("overseer")

---@type overseer.TemplateDefinition
local tmpl = {
  name = "b ..",
  priority = 48,
  tags = { TAG.BUILD },
  params = {
    args = {
      type = "list",
      delimiter = " ",
    },
  },
  builder = function(params)
    ---@type overseer.TaskDefinition
    return {
      cmd = "b",
      args = params.args,
      cwd = LazyVim.root(),
    }
  end,
}

local variants = {
  "mkf",
  "mkf check",
  "mk",
  "mk check",
  "mk -m",
  "mk -m check",
}

---@type overseer.TemplateFileProvider
return {
  condition = {
    dir = "/src",
  },
  generator = function(opts, cb)
    ---@type overseer.TemplateDefinition[]
    local res = { tmpl }
    for i, v in ipairs(variants) do
      local newTempl = overseer.wrap_template(tmpl, { name = "b " .. v, priority = 40 + i }, {
        args = vim.split(v, " "),
      })
      table.insert(res, newTempl)
    end

    cb(res)
  end,
}
