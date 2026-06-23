return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local state = require('telescope.state')
        local action_state = require('telescope.actions.state')

        local slow_scroll = function(prompt_bufnr, direction)
            local previewer = action_state.get_current_picker(prompt_bufnr).previewer
            local status = state.get_status(prompt_bufnr)

            if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
                return
            end

            previewer:scroll_fn(1* direction)
        end

        require('telescope').setup({
            defaults = {
                border = true,
                borderchars = {
                    prompt  = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        prompt_position = "top",
                        preview_height = 0.5,
                        results_height = 0.5,
                        width = 0.99,
                        height = 0.99,
                        mirror = false
                    }
                },

                sorting_strategy = "ascending",

                mappings = {
                    i = {
                        ["<S-Up>"] = function(bufnr) slow_scroll(bufnr, -1) end,
                        ["<S-Down>"] = function(bufnr) slow_scroll(bufnr, 1) end,
                    },
                },
            },
        })

        vim.keymap.set('n', '<C-p>', builtin.find_files, {desc = "telescope find files"})
        vim.keymap.set('n', '<leader>fb', builtin.find_files, {desc = "telescope buffers"})
    end
}
