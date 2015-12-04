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
let g:colors_name = "ManuGreenOld"
hi Normal          guifg=green  guibg=black
hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  
hi NonText		  term=bold  cterm=bold  ctermfg=darkred  
hi Directory	  term=bold  cterm=bold  ctermfg=brown  
hi ErrorMsg		  term=standout  cterm=bold  ctermfg=white  ctermbg=red 
hi Search		  term=reverse  ctermfg=white  ctermbg=red  
hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	
hi ModeMsg		  term=bold  cterm=bold  gui=bold  
hi LineNr		  term=underline  cterm=bold  ctermfg=darkcyan guifg=cyan
hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=black ctermbg=lightgreen 
hi StatusLineNC   term=reverse cterm=bold ctermfg=black ctermbg=lightgreen
hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta 
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkred 
hi Cursor		  ctermbg=green guifg=bg	guibg=Green
hi Comment		  term=bold  cterm=bold ctermfg=cyan 
hi PreProc		  term=underline  cterm=bold ctermfg=magenta 
hi Statement		  term=bold  cterm=bold ctermfg=yellow 
hi Identifier	  term=underline   ctermfg=brown guifg=brown 
hi Special	  term=bold  cterm=bold ctermfg=blue guifg=lightblue
hi Constant		  term=underline  ctermfg=darkmagenta
hi Type			  term=underline  cterm=bold ctermfg=lightgreen  
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black guifg=darkcyan guibg=black 
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  
hi CursorLine	  term=underline  guibg=#555555 cterm=underline
hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue
hi TabLine              term=bold,reverse  cterm=bold ctermfg=black ctermbg=green 
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=black ctermbg=green 
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue
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
