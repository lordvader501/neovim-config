-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_hl(0, 'LazyBorder', { fg = '#ebbcba' })
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Setup lazy.nvim

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "lordvader501.plugins" },
  },
  ui = {
    border = 'rounded', -- Choose the border style you like (e.g., 'rounded', 'single', 'double')
    border_hl = 'LazyBorder', -- Apply the custom highlight group to the border
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})


