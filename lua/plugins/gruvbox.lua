vim.o.background = 'dark'
vim.g.gruvbox_sign_column = 'bg0'
vim.g.gruvbox_contrast_dark = 'hard'
vim.opt.termguicolors = true

vim.cmd([[
colorscheme gruvbox

" Set white text color to be a bit brighter.
hi Normal guifg=#ede7d8
hi GruvboxFg1 guifg=#ede7d8

" Show operators (+, -, =, etc.) in blue for easier reading.
hi link Operator GruvboxBlue

" Show selected tab in darker color.
hi TabLineSel guibg=GruvboxBg0

" Change color of directories.
hi link NvimTreeFolderName GruvboxAqua
hi link NvimTreeEmptyFolderName GruvboxAqua
hi link NvimTreeOpenedFolderName GruvboxAqua
]])
