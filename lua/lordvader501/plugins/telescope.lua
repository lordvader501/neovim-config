return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                horizontal = {
                    height = 0.9,
                    preview_cutoff = 120,
                    prompt_position = "bottom",
                    width = 0.8
                },
                layout_strategy = "horizontal",
                winblend = vim.g.neovide and 180 or 0,
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    end
}
