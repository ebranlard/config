" Vim syntax file
" Language:	Master file for flex
" Maintainer:	E. Branlard
" Last Change:	
" URL:
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

"Todo
syn keyword masterTodo TODO FIXME XXX NOTE HACK todo Todo

"Todo
syn match masterKeyword "^-\a*\s"

" Preproc
syn match   masterPreproc	"^#.*"  contains=masterTodo
" Comment
syn match   masterComment	"^\*.*" contains=masterTodo
syn match   masterComment	"^\a.*"  contains=masterTodo
syn region masterUnit start='(' end=')'

" Replace
syn region masterReplace start='{' end='}'


" Regular int like number with - + or nothing in front
syn match masterNumber '\d\+' 
" Regular int like number with - + or nothing in front
syn match masterNumber '[-+]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match masterNumber '[-+]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match masterNumber '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match masterNumber '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" syn match hComment ";.*$"
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_master_syntax_inits")
  if version < 508
    let did_master_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink masterKeyword Keyword
  HiLink masterPreproc Preproc
  HiLink masterComment Comment
  HiLink masterUnit Comment
  HiLink masterReplace  Constant
  HiLink masterString  String
  HiLink masterTodo    Todo
  HiLink masterNumber    Number

  delcommand HiLink
endif

let b:current_syntax = "deflex_basic"

" vim: ts=8
