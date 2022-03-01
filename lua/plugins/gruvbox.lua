vim.o.background = 'dark'
vim.g.gruvbox_sign_column = 'bg0'
vim.g.gruvbox_contrast_dark = 'hard'
vim.opt.termguicolors = true

vim.cmd([[
colorscheme gruvbox

" Show operators (+, -, =, etc.) in blue for easier reading.
hi link Operator GruvboxBlue

" Show selected tab in darker color.
hi TabLineSel guibg=GruvboxBg0

" Change color of nvim-tree.
hi! link NvimTreeEmptyFolderName GruvboxAqua
hi! link NvimTreeFolderName GruvboxAqua
hi! link NvimTreeOpenedFolderName GruvboxAqua
hi! link NvimTreeRootFolder GruvboxGreen
hi! link NvimTreeGitDirty GruvboxOrange
hi! link NvimTreeExecFile GruvboxGreen
]])
