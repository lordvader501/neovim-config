return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                padded_slant = true,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or ""
                    return " " .. icon .. " " .. count
                end,
                style_preset = bufferline.style_preset.minimal,
                indicator = {
                    icon = ' ',
                    -- icon = '▎i󰤃',
                    style = 'icon',
                },
                -- seperator_style = 'slant',
            }
        })
        vim.cmd([[
            autocmd ColorScheme * highlight BufferLineFill guibg=none
            autocmd ColorScheme * highlight BufferLineBackground guifg=none
            autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white gui=none
     ]])
    end
}
