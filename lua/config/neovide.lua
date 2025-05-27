vim.opt.guifont = "JetBrainsMono Nerd Font:h12"

vim.g.neovide_title_background_color = "#303446"

vim.g.neovide_opacity = 0.85
vim.g.neovide_normal_opacity = 0.85

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_detatch_on_quit = "always_quit"
vim.g.neovide_remember_window_size = true

vim.g.neovide_scroll_animation_length = 0.05
vim.g.neovide_cursor_vfx_mode = "torpedo"

vim.o.title = true

local function set_titlestring()
  local prefix = vim.g.neovide and "Neovide: " or "nvim: "
  local is_wsl = vim.fn.filereadable("/proc/sys/fs/binfmt_misc/WSLInterop") == 1
  local host = is_wsl and "WSL" or vim.fn.hostname():gsub("^benjamin%-ye%-", ""):match("^[^%.]+")
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
  vim.o.titlestring = prefix .. host .. " " .. cwd
end

set_titlestring()
vim.api.nvim_create_autocmd({ "DirChanged" }, { callback = set_titlestring })
