" Text syntax file
" Language:	Text
" Maintainer:	E. Branlard
" Last Change:	2016
" Version:	0
" URL:		
" Notes: 


" if exists("b:current_syntax")
"   finish
" endif

" Keywords
" syn keyword Keyword begin end nextgroup=hIdentifier
" syn keyword Keyword #
syn match Keyword "#.*$" 
" syn keyword Identifier simulation 
syn match Identifier "^.*:" 


" syn keyword celTodo contained TODO FIXME XXX NOTE HACK
" syn keyword Todo TODO FIXME XXX NOTE HACK
" syn match Comment ";S*$" contains=hTodo
" 
" syn match EmptyLines /^$/
" syn match EmptyLines /^\s*$/ 
" 
" " Regular int like number with space or tab in front
syn match Number '[\t\ ]\d\+' 
" Regular int like number with - + or nothing in front
syn match Number '[-+\ ]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match Number '[-+\ ]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match Number '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match Number '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
" 
" " syn region celString start='"' end='"' contained
" syn region String start='./' end=';'  contains=masterReplace


let b:current_syntax = "text"

" hi def link masterReplace  Constant
" hi def link hNumber         Number
" hi def link EmptyLines      Error


" Cleanup: 
" unlet s:extfname
" let   b:current_syntax = "tex"
" let &cpo               = s:keepcpo
" unlet s:keepcpo
" vim: ts=8 fdm=marker
