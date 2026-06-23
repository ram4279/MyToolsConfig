vim.opt.winborder = 'rounded'
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.syntax = 'enable'
vim.opt.cursorline = true

vim.cmd 'set noswapfile'
vim.cmd 'set mouse='

vim.cmd 'set signcolumn=no'


vim.keymap.set('n', '<C-X>', ':bd<CR>', {desc = "CTRL + X to close the buffer"})
vim.keymap.set('n', '<Tab>', ':bnext<CR>', {desc = "Next tab"})
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', {desc = "Previous tab"})
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {desc = "Git blame"})
vim.keymap.set('n', '<leader><leader>t', ':Telescope live_grep<CR>', {desc = "Live Grep in all files", noremap = true})
vim.keymap.set('n', '<leader><leader>=b', ':Telescope buffers<CR>', {desc = "List buffers", noremap = true})

local opts = { noremap = true, silent = true }

vim.api.nvim_buf_set_keymap(0, "n", "gd", "<mcd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "K", "<mcd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "gi", "<mcd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "<C-k>", "<mcd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "gr", "<mcd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "ga", "<mcd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "rn", "<mcd>lua vim.lsp.buf.rename()<CR>", opts)

-- Find references actual places where the symbol is used
vim.api.nvim_set_keymap('n', 'fr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)

-- Remember last line number when the file was opened
local lastplace = vim.api.nvim_create_augroup("LatPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "Remember last cursorline",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})


-- Show violet borders for Telescope Results
vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { fg = "#9d7cd8", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#9d7cd8", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#9d7cd8", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle",   { fg = "#ffffff", bg = "#9d7cd8" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle",  { fg = "#ffffff", bg = "#9d7cd8" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle",  { fg = "#ffffff", bg = "#9d7cd8" })




-- Make all backgrounds transparent so terminal image shows through
vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr",       { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "none" })
