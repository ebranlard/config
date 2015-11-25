" Color highlighting theme, 
" vim: tw=0 ts=4 sw=4
" Maintainer: E. Branlard.	
" Last Change:	2011
" Remember that cterm should be put after ctermfg or ctermbg
" Look at help hi and the 16/8 colors. It is likely that I have a 8 color term...

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "ManuWhiteOld"

" Background and menu colors
hi Normal       guifg=#000000 guibg=#F0F0F0 gui=none           ctermfg=0    ctermbg=253 cterm=none
hi Cursor       guifg=#000000 guibg=#909090 ctermfg=0          ctermbg=240  cterm=none

hi Visual       guibg=#D0D0D0 ctermbg=240   cterm=reverse
hi MatchParen   guifg=#7b0000 guibg=#c5d2fc gui=bold,underline   

hi LineNr       guifg=#000000 guibg=#d6d3d6 ctermfg=0          ctermbg=gray cterm=bold
hi SignColumn   guifg=#000000 guibg=#d6d3d6 ctermfg=0          ctermbg=gray cterm=bold
hi StatusLine   guibg=#293531 guifg=#ffffff gui=bold
hi StatusLineNC guibg=#293531 guifg=#b0b0b0 gui=none
hi VertSplit    guibg=#293531 guifg=#f0f0f0 gui=none
" 
highlight FoldColumn  gui=bold    guifg=grey65     guibg=#d6d3d6
highlight Folded      gui=bold,italic  guifg=#218a21      guibg=Grey90

" Light Green
hi Comment          term=NONE guifg=#218a21 ctermfg=green cterm=none
" 
" " Dark blue bold
hi Statement        term=bold guifg=#00007b gui=bold ctermfg=blue cterm=bold
" hi texSection       guifg=#00007b gui=bold cterm=bold ctermfg=17 
" 
" " Dark blue
hi Underlined        guifg=#00007b gui=underline ctermfg=blue term=underline
hi Identifier        guifg=#00007b gui=none ctermfg=blue term=none
"--------------------------------------------------------------------------------
"--- Dark red
"--------------------------------------------------------------------------------
hi Number           guifg=#7b0000 gui=bold ctermfg=red cterm=bold 
hi Preproc          guifg=#7b0000 gui=bold cterm=bold ctermfg=red

" Dark bold
hi Function         guifg=#151515 gui=bold ctermfg=brown cterm=bold
" 
" " Dark green
hi Special          guifg=#00300e gui=bold ctermfg=green cterm=bold
" 
" " Blue weird
hi Keyword          guifg=#00407b gui=bold ctermfg=lightblue cterm=none
" 
" " Light Purple
hi String           guifg=#a520f7 gui=none ctermfg=lightmagenta cterm=none
" 
" " Dark purple
hi Type             guifg=#5c095c gui=bold ctermfg=3 cterm=none
" 
" " Pink 
hi Constant	     guifg=darkmagenta ctermfg=magenta
" 
" 


" --------------------------------------------------------------------------------
" --- Links 
" --------------------------------------------------------------------------------
hi link texError    Error
hi link texMathError Error
hi link texBadMath   Error
hi link texOnlyMath Normal
hi link texMathDelimBad Error



" hi texMathDelim     guifg=#7b0000 gui=none cterm=bold ctermfg=red
" " left right
" hi texMathOper      guifg=#7b0000 gui=none cterm=bold ctermfg=red                 
" hi texNewCmd        guifg=#7b0000 gui=bold cterm=bold ctermfg=red 
" " 
" hi texNewEnv        guifg=#7b0000 gui=bold cterm=bold ctermfg=red
" frac, gamma, begin, sin
" hi texStatement     guifg=#7b0000 gui=bold cterm=bold ctermfg=red
" hi texSpaceCode     guifg=#7b0000 gui=bold cterm=bold ctermfg=red
" hi texStyleStatement   guifg=#7b0000 gui=bold cterm=bold ctermfg=red

" hi texMathDelimKey   guifg=#7b0000 gui=none
" hi texMathDelimSet1   guifg=#7b0000 gui=none
" hi texMathDelimSet2   guifg=#7b0000 gui=none
" hi texCmdName   guifg=#7b0000 gui=bold
" hi texDocType   guifg=#7b0000 gui=bold
" hi texSectionMarker   guifg=#7b0000 gui=bold
" hi texDef   guifg=#7b0000 gui=bold
" hi texDefCmd   guifg=#7b0000 gui=bold
" 
" hi NonText          guifg=#000000 guibg=#E6EEF0 gui=none ctermfg=16 ctermbg=255 cterm=none
" hi VertSplit        guifg=#000000 guibg=#DCE4E6 gui=none ctermfg=16 ctermbg=254 cterm=none
" hi Title            guifg=#995D44 guibg=NONE	gui=bold ctermfg=95 ctermbg=NONE cterm=bold
" hi SpecialKey       guifg=#C33700 guibg=#E6EEF0 gui=none ctermfg=130 ctermbg=255 cterm=none
"hi DiffChange       guibg=#F8FDB2 gui=none ctermbg=229 cterm=none
"hi DiffAdd          guibg=#D1D6FF gui=none ctermbg=189 cterm=none
"hi DiffText         guibg=#F9C9FF gui=none ctermbg=225 cterm=none
"hi DiffDelete       guibg=#F7BDBF gui=none ctermbg=217 cterm=none
"  hi Pmenu        ctermfg=0   guifg=#000000 ctermbg=250 guibg=#bcbcbc
"  hi PmenuSel     ctermfg=255 guifg=#eeeeee ctermbg=243 guibg=#767676
"  hi PmenuSbar                              ctermbg=252 guibg=#d0d0d0
"  hi PmenuThumb   ctermfg=243 guifg=#767676

" 
" hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  
" hi NonText		  term=bold  cterm=bold  ctermfg=darkred  
" hi Directory	  term=bold  cterm=bold  ctermfg=brown  
" hi ErrorMsg		  term=standout  cterm=bold  ctermfg=white  ctermbg=red 
" hi Search		  term=reverse  ctermfg=white  ctermbg=red  
" hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	
" hi ModeMsg		  term=bold  cterm=bold  gui=bold  
" hi LineNr		  term=underline  cterm=bold  ctermfg=darkcyan guifg=cyan
" hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	
" hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=black ctermbg=lightgreen 
" hi StatusLineNC   term=reverse cterm=bold ctermfg=black ctermbg=lightgreen
" hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta 
" hi Visual		  term=reverse	cterm=reverse  gui=reverse
" hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkred 
" hi Cursor		  ctermbg=green guifg=bg	guibg=Green
" hi Comment		  term=bold  cterm=bold ctermfg=cyan 
" hi PreProc		  term=underline  cterm=bold ctermfg=magenta 
" hi Statement	  term=bold  cterm=bold ctermfg=yellow 
" hi Identifier	  term=underline   ctermfg=brown guifg=brown 
" hi Special	  term=bold  cterm=bold ctermfg=blue guifg=lightblue
" hi Constant		  term=underline  ctermfg=darkmagenta
" hi Type			  term=underline  cterm=bold ctermfg=lightgreen  
" hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black guifg=darkcyan guibg=black 
" hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  
" hi CursorLine	  term=underline  guibg=#555555 cterm=underline
" hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
" hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue
" hi TabLine              term=bold,reverse  cterm=bold ctermfg=black ctermbg=green 
" hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=black ctermbg=green 
" hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue
" hi link IncSearch		Visual
" hi link String			Constant
" hi link Character		Constant
" hi link Number			Constant
" hi link Boolean			Constant
" hi link Float			Number
" hi link Function		Identifier
" hi link Conditional		Statement
" hi link Repeat			Statement
" hi link Label			Statement
" hi link Operator		Statement
" hi link Keyword			Statement
" hi link Exception		Statement
" hi link Include			PreProc
" hi link Define			PreProc
" hi link Macro			PreProc
" hi link PreCondit		PreProc
" hi link StorageClass	Type
" hi link Structure		Type
" hi link Typedef			Type
" hi link Tag				Special
" hi link SpecialChar		Special
" hi link Delimiter		Special
" hi link SpecialComment	Special
" hi link Debug			Special
"
