return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        local function remove_tildes_from_window()
            vim.api.nvim_win_set_option(0, 'fillchars', 'eob: ')
        end

        -- Apply the function to the current window
        remove_tildes_from_window()
    end,
}
