opt = vim.opt

-- Sane line numbering.
opt.nu = true
opt.relativenumber = true

-- If we need to wrap, the line is too long already.
opt.wrap = false

-- Aware of long lines
opt.colorcolumn = "80"

-- Don't get too close the edges.
opt.scrolloff = 8

-- Sane colors.
opt.termguicolors = true

-- 2 space tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
