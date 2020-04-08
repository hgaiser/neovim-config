set mouse=a                        " Enable mouse mode.
set number                         " Set line numbers at the left.
set noexpandtab                    " Use tabs for indentation.
set tabstop=4                      " Tabs are 4 spaces.
set shiftwidth=4                   " Number of spaces to insert when pressing TAB.
let g:python_recommended_style = 0 " Don't use PEP8 (forces spaces).
let g:rust_recommended_style = 0   " Don't use Rust style (forces spaces).
set list                           " Show tab and trailing spaces.
set listchars=tab:›─,trail:␣       " Show tabs and trailing whitespaces.
set nowrap                         " Disable wrapping of lines.
set nrformats=bin,hex,alpha        " Also consider the alphabet when incrementing/decrementing.
set updatetime=500                 " Reduce the time before a backup is saved to disk.
set relativenumber                 " Show relative line numbers.
set undofile                       " Remain persistent undo file between vim sessions.
set splitbelow                     " Split files below current open file.
set splitright                     " Split files right of current open file.
set signcolumn=yes                 " Always show the sign column (GitGutter / Coc).

"""""""""""" Install extensions.

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

""" Code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

Plug 'junegunn/fzf.vim'        " Fuzzy finding tools.
Plug 'junegunn/vim-easy-align' " Alignment around operator
Plug 'preservim/nerdcommenter' " Comment code
Plug 'preservim/nerdtree'      " File tree.
Plug 'tpope/vim-surround'      " Extension for changing surroundings.
Plug 'tpope/vim-repeat'        " Allow repeating of commands like change surroundings.
Plug 'lambdalisue/suda.vim'    " Write as sudo, workaround for https://github.com/neovim/neovim/issues/8527 .
Plug 'tpope/vim-fugitive'      " Git support inside vim.
Plug 'cespare/vim-toml'        " Formatting for (Cargo).toml files.
Plug 'rust-lang/rust.vim'      " Formatting for rust files.
Plug 'airblade/vim-gitgutter'  " Git gutter.

" Initialize plugin system
call plug#end()

"""""""""""" End install extensions.

" Remap Ctrl+w, <hjkl> to Ctrl+<hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Map F5 to run last external command.
nnoremap <F5> :!!<CR>

" Map Esc to exit terminal insert mode.
tnoremap <Esc> <C-\><C-n>

" Map Ctrl+<hjkl> to exit insert mode and move window.
tnoremap <c-h> <C-\><C-n><c-w>h
tnoremap <c-j> <C-\><C-n><c-w>j
tnoremap <c-k> <C-\><C-n><c-w>k
tnoremap <c-l> <C-\><C-n><c-w>l

" Add SplitTerminal to open a new split terminal.
command! SplitTerminal 10split | :term
autocmd BufEnter term://* startinsert

" Color scheme.
colorscheme custom " Colorscheme
set termguicolors

" Git gutter colors
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 1
highlight GitGutterDelete guifg=#F97CA9
highlight GitGutterAdd    guifg=#BEE275
highlight GitGutterChange guifg=#96E1EF

" Alignment extension.
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Comment code.
" Add spaces after comment delimiters by default.
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation.
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments.
let g:NERDCompactSexyComs = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not.
let g:NERDToggleCheckAllLines = 1
nmap <silent>// <leader>c<space>
vmap <silent>// <leader>c<space>

" Code completion

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" NERDTree.
map <Leader>n :NERDTreeToggle<CR>
map ` :NERDTreeToggle<CR>

" Sudo write.
cmap w!! w suda://%
