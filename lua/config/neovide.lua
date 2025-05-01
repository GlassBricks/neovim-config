vim.opt.guifont = "JetBrainsMono Nerd Font:h13"

vim.g.neovide_title_background_color = "#303446"

vim.g.neovide_opacity = 0.85
vim.g.neovide_normal_opacity = 0.85

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_detatch_on_quit = "always_quit"
vim.g.neovide_remember_window_size = true

vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_vfx_mode = "torpedo"

vim.o.title = true
local hostname = vim.fn.hostname()
local host = hostname:gsub("^benjamin%-ye%-", ""):match("^[^%.]+")
vim.o.titlestring = "Neovide: " .. host
