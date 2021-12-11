vim.opt.expandtab              = false            -- Use tabs for indentation.
vim.opt.tabstop                = 4                -- Tabs are 4 spaces.
vim.opt.shiftwidth             = 4                -- Number of spaces to insert when pressing TAB.
vim.opt.copyindent             = true             -- Use the indentation from the previous line.
vim.opt.mouse                  = 'a'              -- Enable mouse mode.
vim.opt.number                 = true             -- Set line numbers at the left.
vim.opt.list                   = true             -- Show tab and trailing spaces.
vim.opt.listchars              = 'tab:›─,trail:␣' -- Show tabs and trailing whitespaces.
vim.opt.wrap                   = false            -- Disable wrapping of lines.
vim.opt.nrformats              = 'bin,hex,alpha'  -- Also consider the alphabet when incrementing/decrementing.
vim.opt.updatetime             = 500              -- Reduce the time before a backup is saved to disk.
vim.opt.undofile               = true             -- Remain persistent undo file between vim sessions.
vim.opt.splitbelow             = true             -- Split files below current open file.
vim.opt.splitright             = true             -- Split files right of current open file.
vim.opt.signcolumn             = 'yes'            -- Always show the sign column (GitGutter / Coc).
vim.opt.showmode               = false            -- Don't show the mode (like `-- INSERT --`), because this is shown in lualine.
vim.opt.cursorline             = true             -- Highlight the line the cursor is on.
vim.opt.fillchars:append { eob = " " }            -- Hide the '~' on empty lines.
vim.g.python_recommended_style = 0                -- Don't use PEP8 (forces spaces).
vim.g.rust_recommended_style   = 0                -- Don't use Rust style (forces spaces).

-- Highlight yanked text.
vim.cmd([[
augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])
