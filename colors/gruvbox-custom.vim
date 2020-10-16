runtime colors/gruvbox.vim

let g:colors_name = "gruvbox-custom"

" Use highlighting to show errors, not underlining.
hi CocErrorHighlight   cterm=none ctermbg=88 gui=none guibg=#883322
hi CocWarningHighlight cterm=none ctermbg=94 gui=none guibg=#9a4d00
hi CocInfoHighlight    cterm=none ctermbg=58 gui=none guibg=#7b632f
hi CocHintHighlight    cterm=none ctermbg=60 gui=none guibg=#4e6e62

hi SpellCap   cterm=none ctermbg=88 gui=italic guibg=#883322
hi SpellBad   cterm=none ctermbg=88 gui=italic guibg=#883322
hi SpellLocal cterm=none ctermbg=88 gui=italic guibg=#883322
hi SpellRare  cterm=none ctermbg=88 gui=italic guibg=#883322

" Set white text color to be a bit brighter.
hi Normal guifg=#ede7d8

" Set sign column to the same color as the line numbers column.
hi SignColumn guibg=#1d2021

" Show operators (+, -, =, etc.) in blue for easier reading.
hi link Operator GruvboxBlue
