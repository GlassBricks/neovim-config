---@param buf? boolean
local function snacks_mode_toggle(buf)
  return Snacks.toggle({
    name = "Format Changes only (" .. (buf and "Buffer" or "Global") .. ")",
    get = function()
      if not buf then
        local mode = vim.g.formatmode == nil and "file" or vim.g.formatmode
        return mode == "changes"
      end
      return LazyVim.format.mode() == "changes"
    end,
    set = function(state)
      if state then
        LazyVim.format.setmode("changes", buf)
      else
        LazyVim.format.setmode("file", buf)
      end
    end,
  })
end
snacks_mode_toggle():map("<leader>um")
snacks_mode_toggle(true):map("<leader>uM")

local function diff_changes(buf)
  buf = buf or vim.api.get_current_buf(buf)
  local data = MiniDiff.get_buf_data(buf)
  if not data or not data.hunks then
    return {}
  end
  local hunks = data.hunks
  hunks = vim.tbl_filter(function(h)
    return h and h.type ~= "delete"
  end, hunks)
  return vim.tbl_map(function(h)
    local start = h.buf_start
    local last = start + h.buf_count
    local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
    return { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
  end, hunks)
end

---@class lazyvim.util.format
local M = LazyVim.format

---@param buf number
function M._format_changes(_, buf)
  local changes = diff_changes(buf)
  for i = #changes, 1, -1 do
    local change = changes[i]
    require("conform").format({ bufnr = buf, range = change })
  end
end

---@param formatter LazyFormatter
---@param buf number
function M._format_file(formatter, buf)
  return formatter.format(buf)
end

---@param opts? {force?:boolean, buf?:number, changes?:boolean}
---@diagnostic disable-next-line: duplicate-set-field
function M.format(opts)
  opts = opts or {}
  local buf = opts.buf or vim.api.nvim_get_current_buf()
  if not ((opts and opts.force) or M.enabled(buf)) then
    return
  end
  local range_exclude_ft = vim.g.format_range_exclude_ft

  local format = M._format_file
  local mode = (opts.changes and "changes") or M.mode(buf)
  if mode == "changes" and not vim.tbl_contains(range_exclude_ft, vim.bo[buf].filetype) then
    format = M._format_changes
  end
  for _, formatter in ipairs(M.resolve(buf)) do
    if formatter.active then
      LazyVim.try(function()
        return format(formatter, buf)
      end, { msg = "Formatter `" .. formatter.name .. "` failed" })
    end
  end
end

---@param mode "changes" | "file"
---@param buf? boolean
function M.setmode(mode, buf)
  if buf then
    vim.b.formatmode = mode
  else
    vim.g.formatmode = mode
    vim.b.formatmode = nil
  end
end

---@param buf? number
---@return "changes" | "file"
function M.mode(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  local gmode = (vim.g.formatmode == nil and "file") or vim.g.formatmode
  local bmode = vim.b[buf].formatmode
  if bmode == nil then
    return gmode
  end
  return bmode
end
