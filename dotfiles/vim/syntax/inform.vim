" Vim syntax file
" Language:     inf
" Maintainer:   Stephen Thomas (stephen@gowarthomas.com)
" URL:		http://www.gowarthomas.com/infvim
" Last Change:  2006 April 20

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword Todo TODO FIXME XXX NOTE HACK
" Integer numbers: decimal, hexadecimal and binary.
syn match Number "\<\d\+\>"
syn match Number "\<\$\x\+\>"
syn match Number "\<\$\$[01]\+\>"
" Floating point number with decimal no E or e (+,-)
syn match Number '[-+]*\d\+\.\d*[Ee+-]*\d*' 

" Comments
syn match Comment "^*.*" contains=Todo
syn match Identifier "^#.*" contains=Todo

" syn region String start=''' end='''  contains=masterReplace
syn region String start='\'' end='\'' 

" Identifier 
syn match String '^.*\.fnd' 
syn match String '^.*\.app' 
syn match String '^.*\.twr' 
syn match String '^.*\.int\ ' 
syn match String '^.*\.wko' 
syn match String '^.*\.gen' 
syn match String '^.*\.brk' 
syn match String '^.*\.pit' 
syn match String '^.*\.yaw' 
syn match String '^.*\.con' 
syn match String '^.*\.bld' 

"
syn keyword Keyword Nogust Noquake


let b:current_syntax = "inf"

" vim: ts=8
