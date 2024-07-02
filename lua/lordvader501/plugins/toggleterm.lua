return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "ColorScheme",
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        vim.api.nvim_set_hl(0, 'TermBorder', { fg = '#bea2eb', bg = 'none' })
        highlights.FloatBorder.link = 'TermBorder'
        require("toggleterm").setup({
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
            --            on_create = fun(t: Terminal), -- function to run when the terminal is first created
            --            on_open = fun(t: Terminal), -- function to run when the terminal opens
            --            on_close = fun(t: Terminal), -- function to run when the terminal closes
            --            on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
            --            on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
            hide_numbers = true,    -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            autochdir = false,      -- when neovim changes it current directory the terminal will change it's own when next it's opened
            highlights = highlights,
            shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            --            shading_factor = '<number>', -- the percentage by which to lighten dark terminal background, default: -30
            --            shading_ratio = '<number>', -- the ratio of shading factor for light/dark terminal background, default: -3
            start_in_insert = true,
            insert_mappings = true,   -- whether or not the open mapping applies in insert mode
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
            persist_size = true,
            persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
            direction = 'float',
            close_on_exit = true,     -- close the terminal window when the process exits
            -- Change the default shell. Can be a string or a function returning a string
            shell = "pwsh.exe",
            auto_scroll = true, -- automatically scroll to the bottom on terminal output
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'curved',
                -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
                width = 120,
                winblend = vim.g.neovide and 180 or 0,
                zindex = 1,
                title_pos = 'left',
            },
            winbar = {
                enabled = true,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            },
        })
        -- Function to list all toggleterm instances
        _G.list_toggleterms = function()
            local all_terminals = require("toggleterm.terminal").get_all()
            for _, term in pairs(all_terminals) do
                print(string.format("Terminal ID: %d, Name: %s, Is Open: %s",
                    term.id, term.display_name or term.name, tostring(term:is_open())))
            end
        end
        -- Create a key mapping to list all toggleterm instances
        vim.api.nvim_set_keymap('n', '<leader>lt', ':lua list_toggleterms()<CR>', { noremap = true, silent = true })
    end
}
