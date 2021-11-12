" {{{ Change default vim settings.

lua <<EOF
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
vim.opt.showmode               = false            -- Don't show the mode (like `-- INSERT --`), because this is shown in lightline.
vim.opt.cursorline             = true             -- Highlight the line the cursor is on.
vim.g.python_recommended_style = 0                -- Don't use PEP8 (forces spaces).
vim.g.rust_recommended_style   = 0                -- Don't use Rust style (forces spaces).
EOF

" }}}

" {{{ Install extensions.

lua <<EOF
-- Install Paq if it is not installed already.
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
	-- Let Paq manage itself.
	"savq/paq-nvim";

	-- Common LUA plugin requirement.
	'nvim-lua/plenary.nvim';

	-- Code completion.
	{'neoclide/coc.nvim', branch = 'release'};
	{'neoclide/coc-vimtex', run = 'yarn install --frozen-lockfile'};
	{'fannheyward/coc-rust-analyzer', run = 'yarn install --frozen-lockfile'};
	{'fannheyward/coc-pyright', run = 'yarn install --frozen-lockfile'};
	{'neoclide/coc-snippets', run = 'yarn install --frozen-lockfile'};
	{'clangd/coc-clangd', run = 'yarn install --frozen-lockfile'};
	{'neoclide/coc-json', run = 'yarn install --frozen-lockfile'};

	-- Fuzzy finding.
	'nvim-telescope/telescope.nvim';

	-- Theme (gruvbox).
	'rktjmp/lush.nvim';
	'ellisonleao/gruvbox.nvim';

	-- Git gutter.
	'lewis6991/gitsigns.nvim';

	-- File tree viewer.
	'kyazdani42/nvim-web-devicons';
	'kyazdani42/nvim-tree.lua';

	-- Status line (lualine).
	'nvim-lualine/lualine.nvim';

	'junegunn/vim-easy-align';        -- Alignment around operator
	'tpope/vim-commentary';           -- Comment code.
	'tpope/vim-surround';             -- Extension for changing surroundings.
	'tpope/vim-repeat';               -- Allow repeating of commands like change surroundings.
	'tpope/vim-sleuth';               -- Automatically find the indentation given the file and neighbouring files.
	'tpope/vim-fugitive';             -- Git support inside vim.
	'cespare/vim-toml';               -- Formatting for (Cargo).toml files.
	'rust-lang/rust.vim';             -- Formatting for rust files.
	'PeterRincker/vim-argumentative'; -- Adds functionality to work with arguments.
	'godlygeek/tabular';              -- Tabularizes blocks of texts according to a pattern.
	'mg979/vim-visual-multi';         -- Edit multiple locations simultaneously.
	'editorconfig/editorconfig-vim';  -- Read .editorconfig files to adjust formatting.
}
EOF

" }}}

" {{{ Navigational key mappings.

" Remap Ctrl+w, <hjkl> to Ctrl+<hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Map Ctrl+<hjkl> to exit insert mode and move window.
tnoremap <c-h> <C-\><C-n><c-w>h
tnoremap <c-j> <C-\><C-n><c-w>j
tnoremap <c-k> <C-\><C-n><c-w>k
tnoremap <c-l> <C-\><C-n><c-w>l

" }}}

" {{{ Edit related key mappings.

" Map K to split line.
nnoremap K i<Cr><Esc>
nnoremap <c-j> i<Cr><Esc>

" Alignment extension.
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Allow pasting multiple times without yanking the replaced text.
xnoremap p pgvy

" }}}

" {{{ Terminal related settings.

augroup TerminalNoSignColumn
	au!
	autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
augroup END

" Add SplitTerminal to open a new split terminal.
command! SplitTerminal 10split | :term
autocmd BufEnter term://* startinsert

" Map Esc or Ctrl-d to exit terminal insert mode.
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <C-d> <C-\><C-n>

" }}}

" {{{ Color scheme.

lua <<EOF
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox-custom]])
vim.opt.termguicolors = true
EOF

" }}}

" {{{ Gitsigns settings.

lua << EOF
require('gitsigns').setup {
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '▌', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '▌', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '▌', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
}
EOF

" }}}

" {{{ Code completion (coc) settings.

" Ctrl+Space to trigger Coc.
inoremap <silent><expr> <c-space> coc#refresh()

" Tab to cycle through options, enter to select.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ? to show documentation in preview window.
nnoremap <silent> ? :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Highlight variable on cursor hold.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use CTRL-S CTRL-S for codeAction
nmap <silent> <C-s><C-s> <Plug>(coc-codeaction-cursor)
xmap <silent> <C-s><C-s> <Plug>(coc-codeaction-selected)

" }}}

" {{{ File tree viewer.

" Disable icons.
let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 1,
	\ 'files': 1,
	\ 'folder_arrows': 0,
	\ }
let g:nvim_tree_icons = {
	\ 'git': {
	\   'unstaged': "",
	\   'staged': "",
	\   'unmerged': "",
	\   'renamed': "➜",
	\   'untracked': "",
	\   'deleted': "",
	\   'ignored': "◌"
	\   }
	\ }

lua << EOF
require('nvim-tree').setup {
	filters = {
		dotfiles = true,
	},
}
EOF

nnoremap <silent> <Leader>n :NvimTreeToggle<CR>
nnoremap <silent> ` :NvimTreeToggle<CR>
nnoremap <silent> <Leader>` :NvimTreeFindFile<Cr>

" }}}

" {{{ Status line settings.

lua << EOF
require('lualine').setup {
	options = {
		theme = 'auto',
		icons_enabled = false,
	},
}
EOF

" }}}

" {{{ Telescope settings.

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" }}}

" vim: foldmethod=marker
