vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Config paths
_G.conf_path = ((vim.fn.has("win32") == 1 or vim.fn.has("win64")) and '~\\AppData\\Local\\nvim' or '~/.config/nvim')
local edit_path = conf_path ..
    ((vim.fn.has("win32") == 1 or vim.fn.has("win64")) and '\\lua\\lordvader501' or '/lua/lordvader501')

-- Removes '~' from the window
_G.remove_tildes_from_window = function()
    vim.api.nvim_win_set_option(0, 'fillchars', 'eob: ')
end

local autocmd = vim.api.nvim_create_autocmd

-- Auto formats code on write
autocmd('BufWritePre', {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end
})

autocmd({ "WinEnter", "BufEnter" }, {
    pattern = "*",
    callback = function()
        remove_tildes_from_window()
    end,
})

-- Map to edit config any time
vim.keymap.set('n', '<leader>ecf', '<cmd>e ' .. edit_path .. '<CR>')
-- Format the buffer indetation
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { silent = true })
-- View file explorer
vim.keymap.set("n", "<leader>vf", vim.cmd.Ex)
-- Deleting the buffer
vim.keymap.set("n", "<leader>bdf", "<cmd>bd!<CR>")
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
-- Buffer movements
vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bp", ":bp<CR>")
-- Escape from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- Toggle Nvim Tree
vim.keymap.set("n", "<leader>tf", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>fd", ":NvimTreeFocus<CR>")
