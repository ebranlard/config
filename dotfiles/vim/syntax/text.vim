" Vim syntax file for text files
" Language: Text file
" Maintainer: Emmanuel Branlard
" Latest Revision: October 2015
" Installation:
" - Put this file in ~./vim/syntax/

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif




" Keywords
" syn keyword tKeyword '^-'
" syn keyword tKeyword '^>'
syn match tKeyword '^-' 
syn match tIdentifier '^>' 
syn match tIdentifier '^>>' 

syn match tKeyword "#.*$" 
syn match tIdentifier "^.*:" 

" syn keyword oIdentifier pDevice pIO 

" syn keyword celTodo contained TODO FIXME XXX NOTE HACK
syn keyword tTodo TODO FIXME XXX NOTE HACK todo
" syn keyword oBool true false T F

" syn match oParam '^[\ a-zA-Z0-9]*'
syn match tComment "^#.*$" contains=hTodo


" syn match EmptyLines /^$/
" syn match EmptyLines /^\s*$/ 
" 
" Regular int like number with - + or nothing in front
syn match tNumber '\d\+' 
" Regular int like number with - + or nothing in front
syn match tNumber '[-+]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match tNumber '[-+]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match tNumber '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match tNumber '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" syn region celString start='"' end='"' contained
" syn region all start='\&' end='\/' contains=oString oKeyword
" syn region oString start='\'' end='\''  
syn region tString  start=+"+ end=+"+	


" syn match oEqual '[=]'


let b:current_syntax = "text"

hi def link tTodo        Todo
hi def link tComment     Comment
hi def link tKeyword     Preproc
hi def link tIdentifier  Type
" hi def link oEqual  Statement
hi def link tNumber      Number
" hi def link oBool      Number
hi def link tString      String
" hi def link all  Constant
