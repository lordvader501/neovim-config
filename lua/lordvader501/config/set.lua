-- set line numbers
vim.opt.number = true

-- set relative line number
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "\\.nvim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.guifont =
"Dank\\ Mono,CaskaydiaCove\\ NF,Cascadia\\ Code\\ NF,Cascadia\\ Code\\ PL,Symbols\\ Nerd\\ Font,CaskaydiaCove\\ Nerd\\ Font:h14"


-- vim.opt.colorcolumn = "140"
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- Set Neovide transparency
if vim.g.neovide then
    vim.opt.pumblend = 120
    vim.opt.winblend = 180
    vim.cmd [[
        highlight Normal guibg=none ctermbg=none
        highlight NormalFloat guibg=none ctermbg=none
        highlight NonText guibg=none ctermbg=none
    ]]
    vim.g.neovide_window_blurred = true
    vim.g.neovide_transparency = 0.8
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#013f03ff"

    vim.g.neovide_floating_blur_amount_x = 1000
    vim.g.neovide_floating_blur_amount_y = 1000
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 100
    vim.g.neovide_light_angle_degrees = 80
    vim.g.neovide_light_radius = 125
end
