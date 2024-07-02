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

vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-x>', '"+d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', '"+dd', { noremap = true, silent = true })

-- Paste from clipboard using Ctrl+V
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<C-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-v>', '<C-R>+', { noremap = true, silent = true })
if vim.g.neovide then
    -- Allow clipboard copy paste in neovim
    -- vim.g.neovide_input_use_logo = 1
    -- vim.api.nvim_set_keymap('', '<C-v>', '+p<CR>', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('!', '<C-v>', '<C-R>+', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('t', '<C-v>', '<C-R>+', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('v', '<C-v>', '<C-R>+', { noremap = true, silent = true })
end
