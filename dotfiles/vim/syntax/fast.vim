" Vim syntax file
" Language:	Typical input file for fast
" Maintainer:	E. Branlard
" Last Change:	Sept 2018
" Installation: 
"   Put the following 3 lines in a file called custom.vim in
"   the folder ftdetect of the vim config directory
"   au! BufNewFile,BufRead *.fst setf fast
"   au! BufNewFile,BufRead *.dat setf fast
"   au! BufNewFile,BufRead *.sum setf fast
" URL:

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

"Todos keywords
syn keyword fastTodo TODO Todo todo FIXME FixMe XXX NOTE Note HACK Hack hack
"Author !XXXXX
syn match fastAUTHOR "\v![a-zA-Z]+"
"Keywords
syn keyword fastKeyword True False true false TRUE FALSE FATAL default END
" Preproc (NOT USED YET)
syn match   fastPreproc	"^#.*"  contains=fastTodo
" Comment
syn match   fastComment	"^--.*" contains=fastTodo
syn match   fastComment	"^==.*"  contains=fastTodo
syn match   fastComment	"^![\ \.].*" 
" Units
syn region fastUnit start='(' end=')'
" Replace
syn region fastReplace start='{' end='}'
" String
syn match  fastString	"\"[a-zA-Z0-9\-\/\_\.]*\""
" Regular int like number with - + or nothing in front
syn match fastNumber '\d\+' 
" Regular int like number with - + or nothing in front
syn match fastNumber '[-+]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match fastNumber '[-+]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match fastNumber '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match fastNumber '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_fast_syntax_inits")
  if version < 508
    let did_fast_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink fastKeyword Keyword
  HiLink fastPreproc Preproc
  HiLink fastComment Comment
  HiLink fastUnit Comment
  HiLink fastReplace  Constant
  HiLink fastString  String
  HiLink fastTodo    Todo
  HiLink fastAUTHOR    Todo
  HiLink fastNumber    Number

  delcommand HiLink
endif
let b:current_syntax = "fast"
