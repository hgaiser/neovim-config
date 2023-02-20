if exists("b:current_syntax")
	finish
endif

syn match uurlogLineStart "^" nextgroup=uurlogComment,uurlogDate skipwhite

syn match uurlogDesc "\S.+" contained
syn match uurlogTag "\[.\{-}\]" nextgroup=uurlogTag,uurlogDesc skipwhite contained
syn match uurlogTimeSep "," nextgroup=uurlogTag,uurlogDesc skipwhite contained
syn match uurlogTimeEnd "" nextgroup=uurlogTimeSep skipwhite contained
syn match uurlogMinutes "\d\+m" nextgroup=uurlogTimeEnd contained
syn match uurlogHours "\d\+h" nextgroup=uurlogMinutes,uurlogTimeEnd contained
syn match uurlogDateSep "," nextgroup=uurlogHours skipwhite contained
syn match uurlogDate "^\d\d\d\d-\d\d\?-\d\d\?" nextgroup=uurlogDateSep skipwhite contained
syn match uurlogComment "#.*" contains=uurlogTodo contained
syn keyword uurlogTodo TODO contained

hi def link uurlogComment Comment
hi def link uurlogTodo Todo
hi def link uurlogDate Statement
hi def link uurlogDateSep Special
hi def link uurlogHours Number
hi def link uurlogMinutes Number
hi def link uurlogTimeSep Special
hi def link uurlogTag Type
hi def link uurlogDesc Normal


let b:current_syntax = "uurlog"
