" Vim syntax file for DEFlex inf file
" Language:     inf
" Maintainer:   E. Branlard

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword Todo TODO todo FIXME XXX NOTE HACK
" Integer numbers: decimal, hexadecimal and binary.
syn match Number "\<\d\+\>"
syn match Number "\<\$\x\+\>"
syn match Number "\<\$\$[01]\+\>"

" Floating point number with decimal no E or e (+,-)
syn match Number '[-+]*\d\+\.\d*[Ee+-]*\d*' 

" Comments
syn match Comment "^*.*" contains=Todo
syn match Comment "^*.*" contains=Todo
syn match Comment ";.*" contains=Todo

" String
syn region String start='\'' end='\'' 
syn match String '^.*\.fnd' 
syn match String '^.*\.app' 
syn match String '^.*\.twr' 
syn match String '^.*\.int\ ' 
syn match String '^.*\.bwc' 
syn match String '^.*\.wko' 
syn match String '^.*\.gen' 
syn match String '^.*\.brk' 
syn match String '^.*\.pit' 
syn match String '^.*\.yaw' 
syn match String '^.*\.con' 
syn match String '^.*\.bld' 
syn match String '^.*\.gst' 
syn match String '^.*\.init' 
syn match String '[a-zA-Z_\-0-9]*\.gfi' 


" Identifiers
syn match Identifier "^-[a-zA-Z0-9_./\\-]*" 

" Keywords
syn match Keyword "#[a-zA-Z0-9_]*" contains=Number

"
let b:current_syntax = "deflex_inf"
