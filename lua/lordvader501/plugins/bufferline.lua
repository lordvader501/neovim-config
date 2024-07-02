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
                    return " " .. icon .. count
                end,
                style_preset = bufferline.style_preset.minimal,
                indicator = {
                    icon = '▎',
                    style = 'icon',
                },
                seperator_style = 'slant',
            }
        })
        vim.cmd([[
            autocmd ColorScheme * highlight BufferLineFill guibg=#332323
            autocmd ColorScheme * highlight BufferLineBackground guifg=#7a7c9e
            autocmd ColorScheme * highlight BufferLineBufferSelected guibg=#332332 guifg=white gui=none
     ]])
    end
}
