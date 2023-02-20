if exists("b:current_syntax")
	finish
endif

syn match grootboekLineStart "^" nextgroup=grootboekComment,grootboekDate,grootboekAmountPos,grootboekAmountNeg,grootboekLabel skipwhite

syn match grootboekLabel "\S.\{-}:\@=" contained nextgroup=grootboekLabelSep skipwhite
syn match grootboekLabelSep ":" contained nextgroup=grootboekLabelValue skipwhite
syn match grootboekLabelValue "\S.*" contained

syn match grootboekDate "\d\d\d\d-\d\d\?-\d\d\?" contained nextgroup=grootboekDateSep skipwhite
syn match grootboekDateSep ":" contained nextgroup=grootboekDescription skipwhite
syn match grootboekDescription "\S.*" contained

syn match grootboekAmountPos "+\d\+.\d\d" contained nextgroup=grootboekAccount skipwhite
syn match grootboekAmountNeg "-\d\+\.\d\d" contained nextgroup=grootboekAccount skipwhite
syn match grootboekAccount "\S.*" contained

syn match grootboekComment "#.*" contained contains=grootboekTodo
syn keyword grootboekTodo TODO contained

hi def link grootboekComment Comment
hi def link grootboekTodo Todo

hi def link grootboekDate Statement
hi def link grootboekDateSep Special
hi def grootboekDescription cterm=bold gui=bold
hi def link grootboekLabel PreProc
hi def link grootboekLabelSep Special
hi def link grootboekLabelValue String

hi def grootboekAmountPos cterm=bold ctermfg=red   gui=bold guifg=#008800
hi def grootboekAmountNeg cterm=bold ctermfg=green gui=bold guifg=#bb0000
hi def link grootboekAccount Identifier

let b:current_syntax = "grootboek"
