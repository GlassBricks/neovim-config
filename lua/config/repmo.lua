vim.g.last_motion_key = ""

local charRemap = {
  j = "[",
  l = "]",
}

local function run_and_record_motion(prefix)
  local motion = vim.fn.getcharstr()
  if motion == "" then
    return
  end
  motion = charRemap[motion] or motion

  vim.g.last_motion_key = motion
  vim.api.nvim_feedkeys(prefix .. motion, "m", false)
end

local remap = {
  ["[]"] = "[[",
  ["]["] = "]]",
}
local function repeat_motion_with(prefix)
  if vim.g.last_motion_key ~= "" then
    local motion = prefix .. vim.g.last_motion_key
    local actualMotion = remap[motion] or motion
    vim.api.nvim_feedkeys(actualMotion, "m", false)
  else
    print("No previous motion recorded.")
  end
end

vim.keymap.set({ "n", "v" }, "l", function()
  run_and_record_motion("]")
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-L>", function()
  run_and_record_motion("[")
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-L>", function()
  repeat_motion_with("]")
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-S-L>", function()
  repeat_motion_with("[")
end, { noremap = true, silent = true })
