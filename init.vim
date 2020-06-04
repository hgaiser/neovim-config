" {{{ Change default vim settings.

set mouse=a                        " Enable mouse mode.
set number                         " Set line numbers at the left.
set noexpandtab                    " Use tabs for indentation.
set tabstop=4                      " Tabs are 4 spaces.
set shiftwidth=4                   " Number of spaces to insert when pressing TAB.
set copyindent                     " Use the indentation from the previous line.
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
set noshowmode                     " Don't show the mode (like `-- INSERT --`), because this is shown in lightline.
set cursorline                     " Highlight the line the cursor is on.

" }}}

" {{{ Install extensions.

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'Maxattax97/coc-ccls', {'do': 'yarn install --frozen-lockfile'}

Plug 'junegunn/fzf.vim'              " Fuzzy finding tools.
Plug 'junegunn/vim-easy-align'       " Alignment around operator
Plug 'preservim/nerdtree'            " File tree.
Plug 'tpope/vim-commentary'          " Comment code.
Plug 'tpope/vim-surround'            " Extension for changing surroundings.
Plug 'tpope/vim-repeat'              " Allow repeating of commands like change surroundings.
Plug 'tpope/vim-sleuth'              " Automatically find the indentation given the file and neighbouring files.
Plug 'lambdalisue/suda.vim'          " Write as sudo, workaround for https://github.com/neovim/neovim/issues/8527 .
Plug 'tpope/vim-fugitive'            " Git support inside vim.
Plug 'cespare/vim-toml'              " Formatting for (Cargo).toml files.
Plug 'rust-lang/rust.vim'            " Formatting for rust files.
Plug 'airblade/vim-gitgutter'        " Git gutter.
Plug 'Yggdroot/indentLine'           " Line for showing indentation level.
Plug 'itchyny/lightline.vim'         " Fancy status bar.
Plug 'shinchu/lightline-gruvbox.vim' " Gruvbox theme for lightline.
Plug 'markstory/vim-zoomwin'         " Allow temporarily zooming in on a buffer.

" Initialize plugin system
call plug#end()

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

" Alignment extension.
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Allow pasting multiple times without yanking the replaced text.
xnoremap p pgvy

" }}}

" {{{ Terminal related settings.

augroup TerminalNoSignColumn
   au!
  autocmd TermOpen * setlocal signcolumn=no
augroup END

" Add SplitTerminal to open a new split terminal.
command! SplitTerminal 10split | :term
autocmd BufEnter term://* startinsert

" Map Esc or Ctrl-d to exit terminal insert mode.
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <C-d> <C-\><C-n>

" }}}

" {{{ Color scheme.

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set termguicolors

" }}}

" {{{ Git gutter settings.

let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 1

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

" }}}

" {{{ NERDTree.

map <silent> <Leader>n :NERDTreeToggle<CR>
map <silent> ` :NERDTreeToggle<CR>

" }}}

" {{{ Sudo write to file.

" Sudo write.
cmap w!! w suda://%

" }}}

" {{{ Indentation line settings.

" Show indentation line.
let g:indentLine_char = '▏'
" Disable in terminal.
let g:indentLine_bufNameExclude = ["term:.*"]
" Disable indentLine for json files as it conceals quotation marks.
autocmd Filetype json :IndentLinesDisable

" }}}

" {{{ Lightline settings.

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

" }}}

" {{{ Buffer / file searching.

nnoremap <silent> <Tab> :Buffers<CR>
nnoremap <silent> <S-Tab> :Files<CR>

" }}}

" vim: foldmethod=marker
