-- Map K to split line.
utils.map { 'n', 'K', 'i<CR><Esc>==' }

-- Alignment extension.
utils.map { 'x', 'ga', '<Plug>(EasyAlign)' }
utils.map { 'n', 'ga', '<Plug>(EasyAlign)' }

-- Allow pasting multiple times without yanking the replaced text.
utils.map { 'x', 'p', 'pgvy' }

vim.cmd([[
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])
