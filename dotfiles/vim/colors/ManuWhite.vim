" Name: ManuWhite
" Description: Color highlighting theme, with light background, ressembles the one from matlab
" Maintainer: E. Branlard  (my last name at gmail dot com)
" Created: 2011
" Revisions:
"    October 2013 : using functions from wombat256 to make it 256 compatible
" Development Note: 
"   Use plugin hexHighlight to directly visual colors in vim.
"   Remember that cterm should be put after ctermfg or ctermbg
"   Look at help hi and the 16/8 colors. It is likely that I have a 8 color term...

set background=light
let g:colors_name = "ManuWhite"

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

" sets the highlighting for the given group
fun! <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=".a:fg
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=".a:bg
	endif
	if a:attr != ""
		if a:attr == 'italic'
			exec "hi ".a:group." gui=".a:attr." cterm=none"
		else
			exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
		endif
	endif
endfun
" }}}

" --------------------------------------------------------------------------------
" ---  Background and menu colors
" --------------------------------------------------------------------------------
hi Normal       guifg=#000000 guibg=#F0F0F0 
hi Cursor       guifg=#000000 guibg=#909090
hi Visual                     guibg=#D0D0D0
hi MatchParen   guifg=#7b0000 guibg=#c5d2fc gui=bold,underline
hi LineNr       guifg=#000000 guibg=#d6d3d6 
hi SignColumn   guifg=#000000 guibg=#d6d3d6 
hi StatusLine   guifg=#000000 guibg=#b0b0b0 
hi StatusLineNC guifg=#606060 guibg=#d6d3d6 
hi VertSplit    guifg=#f0f0f0 guibg=#b0b0b0 
hi FoldColumn   guifg=#a6a6a6 guibg=#d6d3d6 gui=bold
hi Folded       guifg=#218a21 guibg=#e5e5e5 gui=bold,italic
hi PmenuSel     guifg=#ffffff guibg=#293531
hi Pmenu        guifg=#000000 guibg=#b0b0b0
hi Comment      guifg=#218a21          
hi Statement    guifg=#00007b               gui=bold
hi Underlined   guifg=#00007b               gui=underline
hi Itentifier   guifg=#00007b             
hi Number       guifg=#7b0000               gui=bold
hi Preproc      guifg=#7b0000               gui=bold
hi Function     guifg=#151515               gui=bold
hi Special      guifg=#00300e               gui=bold
hi Keyword      guifg=#00407b               gui=bold
hi String       guifg=#a520f7              
hi Type         guifg=#5c095c               gui=bold
hi Constant     guifg=#8c038c               
hi DiffAdd                    guibg=#cffdd0 gui=bold
hi DiffDelete                 guibg=#fdc3c3 gui=bold
hi DiffChange                 guibg=#e4e9f0 
hi DiffText                   guibg=#c0d0f0

" --------------------------------------------------------------------------------
" --- TODO
" --------------------------------------------------------------------------------
" hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  
" hi NonText          guifg=#000000 guibg=#E6EEF0 gui=none ctermfg=16 ctermbg=255 cterm=none
" hi Title            guifg=#995D44 guibg=NONE	gui=bold ctermfg=95 ctermbg=NONE cterm=bold
" hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black guifg=darkcyan guibg=black 
" hi Search		  term=reverse  ctermfg=white  ctermbg=red  
" hi CursorLine guibg=#2d2d2d ctermbg=236
" hi CursorColumn guibg=#2d2d2d ctermbg=236
" hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  
" hi NonText		  term=bold  cterm=bold  ctermfg=darkred  

" hi texMathDelim     guifg=#7b0000 gui=none cterm=bold ctermfg=red
" hi texSection       guifg=#00007b gui=bold cterm=bold ctermfg=17 
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
" hi PmenuSbar                              ctermbg=252 guibg=#d0d0d0
" hi PmenuThumb   ctermfg=243 guifg=#767676

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
