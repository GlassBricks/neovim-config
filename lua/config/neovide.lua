vim.opt.guifont = "JetBrainsMono Nerd Font:h13"

vim.g.neovide_title_background_color = "#303446"

vim.g.neovide_opacity = 0.7
vim.g.neovide_normal_opacity = 0.8

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_detatch_on_quit = "prompt"
vim.g.neovide_remember_window_size = true

vim.g.neovide_cursor_vfx_mode = "torpedo"

vim.o.title = true
local hostname = vim.fn.hostname()
local host = hostname:gsub("^benjamin%-ye%-", ""):match("^[^%.]+")
vim.o.titlestring = "Neovide: " .. host
