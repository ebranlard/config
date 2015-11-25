" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file inspired by koehler
" Maintainer: E. B.	
" Last Change:	2011

hi clear
set background=dark   
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "ManuGreen"
hi Normal         guifg=green  guibg=black ctermfg=green ctermbg=black cterm=none
hi SpecialKey	  term=bold   ctermfg=darkred  ctermbg=black  cterm=bold
hi NonText		  term=bold  ctermfg=darkred   ctermbg=black cterm=bold
hi ErrorMsg		  term=standout  ctermfg=white  ctermbg=red cterm=bold
hi Directory	  term=bold  ctermfg=brown   ctermbg=black cterm=bold  
hi Search		  term=reverse  ctermfg=white  ctermbg=red 
hi MoreMsg		  term=bold  ctermfg=darkgreen ctermbg=black cterm=bold  
hi ModeMsg		  term=bold  cterm=bold  gui=bold  
hi LineNr		  term=underline   ctermfg=darkcyan guifg=cyan ctermbg=black cterm=bold 
hi Question		  term=standout  ctermfg=darkgreen	cterm=bold  
hi StatusLine	  term=bold,reverse  ctermfg=black ctermbg=lightgreen cterm=bold 
hi StatusLineNC   term=reverse ctermfg=black ctermbg=lightgreen cterm=bold 
hi Title		  term=bold  ctermfg=darkmagenta  ctermbg=black cterm=bold  
hi Visual		  term=reverse	cterm=reverse  guifg=black guibg=green
" hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  ctermfg=darkred cterm=bold  
hi Cursor		  ctermbg=green guifg=bg	guibg=Green
hi Comment		  term=italic  ctermfg=cyan ctermbg=black cterm=bold
hi Folded		  term=bold  ctermfg=darkmagenta gui=bold guibg=black guifg=green cterm=bold 
hi FoldColumn      term=bold  ctermfg=darkmagenta cterm=bold 
hi PreProc		  term=underline  ctermfg=magenta cterm=bold 
hi Statement		  term=bold   ctermfg=yellow cterm=bold
hi Identifier	  term=underline   ctermfg=brown guifg=brown 
hi Special	  term=bold ctermfg=blue guifg=lightblue  cterm=bold 
hi Constant		  term=underline  ctermfg=darkmagenta  ctermbg=black
hi Type			  term=underline  ctermfg=lightgreen  ctermbg=black cterm=none 
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black cterm=none guifg=darkcyan guibg=black 
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  
hi CursorLine	  term=underline  guibg=#555555 cterm=underline
hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue
hi TabLine              term=bold,reverse   ctermfg=black ctermbg=green cterm=bold
hi TabLineFill	  term=bold,reverse   ctermfg=black ctermbg=green cterm=bold
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue




hi link texMathDelim Statement
hi link texMathOper Statement
hi link texNewCmd Statement
hi link texNewEnv Statement
hi link texStatement Statement
hi link texSpaceCode Statement
hi link texStyleStatement Statement
hi link texMathDelimKey Statement
hi link texMathDelimSet Statement
hi link texMathDelimSet Statement
hi link texCmdName Statement
hi link texDocType Statement
hi link texSectionMarker Statement
hi link texDef Statement
hi link texDefCmd Statement

"hi texMathDelim  ctermfg=yellow  cterm=bold 
"hi texMathOper  term=bold  cterm=bold ctermfg=yellow  cterm=bold 
"hi texNewCmd   term=bold  ctermfg=yellow  cterm=bold 
"hi texNewEnv   term=bold  ctermfg=yellow  cterm=bold 
"hi texStatement   term=bold  ctermfg=yellow  cterm=bold 
"hi texSpaceCode   term=bold  ctermfg=yellow  cterm=bold 
"hi texStyleStatement   term=bold  ctermfg=yellow  cterm=bold 
"hi texMathDelimKey  term=bold  ctermfg=yellow  cterm=bold 
"hi texMathDelimSet1  term=bold  ctermfg=yellow  cterm=bold 
"hi texMathDelimSet2  term=bold  ctermfg=yellow  cterm=bold 
"hi texCmdName   term=bold  ctermfg=yellow  cterm=bold 
"hi texDocType   term=bold  ctermfg=yellow  cterm=bold 
"hi texSectionMarker term=bold  ctermfg=yellow  cterm=bold 
"hi texDef  term=bold  ctermfg=yellow  cterm=bold 
"hi texDefCmd   term=bold  ctermfg=yellow  cterm=bold 

"hi texSection       guifg=magenta gui=none ctermfg=magenta
"hi texSection       guifg=magenta gui=none 
hi link texSection PreProc


hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special



hi link texError    Error
hi link texMathError Error
hi link texBadMath   Error
hi link texOnlyMath Normal
hi link texMathDelimBad Error
