-- Map K to split line.
utils.map { 'n', 'K', 'i<CR><Esc>==' }

-- Alignment extension.
utils.map { 'x', 'ga', '<Plug>(EasyAlign)' }
utils.map { 'n', 'ga', '<Plug>(EasyAlign)' }

-- Allow pasting multiple times without yanking the replaced text.
utils.map { 'x', 'p', 'pgvy' }

-- Remap Ctrl+w, <hjkl> to Ctrl+<hjkl>
utils.map { 'n', '<c-h>', '<c-w>h' }
utils.map { 'n', '<c-j>', '<c-w>j' }
utils.map { 'n', '<c-k>', '<c-w>k' }
utils.map { 'n', '<c-l>', '<c-w>l' }
