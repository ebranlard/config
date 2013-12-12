" Vim syntax file
" Language: hawc2 input file
" Maintainer: 
" Latest Revision: December 2012
" Installation:
" - Put this file in ~./vim/syntax/
" - Either: 
"   -  Create/edit the file ~./vim/filetype.vim  with the following content:
"        if exists("did_load_filetypes")
"          finish
"        endif
"        augroup filetypedetect
"          au! BufNewFile,BufRead *.htc setf htc
"        augroup END
"  - or but the au command in ftdetect/something.vim 


if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword hKeyword begin end nextgroup=hIdentifier
syn keyword hIdentifier aero simulation wind dll output mann aerodrag aerodrag_element tower_shadom_potential newmark actions hawc_dll c2_def blade_c2_def structure timoschenko_input main_body orientation base relative constraint bearing1 bearing2 fix1 fix2 


" syn keyword celTodo contained TODO FIXME XXX NOTE HACK
syn keyword hTodo TODO FIXME XXX NOTE HACK
syn match hComment ";.*$" contains=hTodo

syn match EmptyLines /^$/
syn match EmptyLines /^\s*$/ 

" Regular int like number with - + or nothing in front
syn match hNumber '[-+\ ]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match hNumber '[-+\ ]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match hNumber '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match hNumber '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" syn region celString start='"' end='"' contained
syn region masterReplace start='\[' end='\]'
syn region hString start='./' end=';'  contains=masterReplace



let b:current_syntax = "htc"

hi def link hTodo        Todo
hi def link hComment     Comment
hi def link hKeyword     Keyword
hi def link hIdentifier  Identifier
hi def link hString      String
hi def link masterReplace  Constant
hi def link hNumber      Number
hi def link EmptyLines  Error
