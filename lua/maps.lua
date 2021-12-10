-- Map K to split line.
utils.map { 'n', 'K', 'i<CR><Esc>==' }

-- Alignment extension.
utils.map { 'x', 'ga', '<Plug>(EasyAlign)' }
utils.map { 'n', 'ga', '<Plug>(EasyAlign)' }

-- Allow pasting multiple times without yanking the replaced text.
utils.map { 'x', 'p', 'pgvy' }
