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

" functions {{{
" returns an approximate grey index for the given grey level
fun! <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun! <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun! <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun! <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun! <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun! <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun! <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=#".a:bg." ctermbg=".<SID>rgb(a:bg)
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
" hi Normal       guifg=#000000 guibg=#F0F0F0 gui=none           ctermfg=0    ctermbg=253 cterm=none
call <SID>X("Normal",		"000000",	"F0F0F0",	"none")
" hi Cursor       guifg=#000000 guibg=#909090 ctermfg=0          ctermbg=240  cterm=none
call <SID>X("Cursor",		"000000",	"909090",	"none")

" hi Visual       guibg=#D0D0D0 ctermbg=240   cterm=reverse
call <SID>X("Visual",		"",     "D0D0D0",	"none")
" hi MatchParen   guifg=#7b0000 guibg=#c5d2fc gui=bold,underline   
call <SID>X("MatchParen",		"7b0000",	"c5d2fc",	"bold,underline")

" hi LineNr       guifg=#000000 guibg=#d6d3d6 ctermfg=0          ctermbg=gray cterm=bold
call <SID>X("LineNr",		"000000",	"d6d3d6",	"none")
" hi SignColumn   guifg=#000000 guibg=#d6d3d6 ctermfg=0          ctermbg=gray cterm=bold
call <SID>X("SignColumn",		"000000",	"d6d3d6",	"none")
" hi StatusLine   guibg=#293531 guifg=#ffffff gui=bold
call <SID>X("StatusLine",		"ffffff",	"293531",	"bold")
" hi StatusLineNC guibg=#293531 guifg=#b0b0b0 gui=none
call <SID>X("StatusLineNC",		"b0b0b0",	"293531",	"none")
" hi VertSplit    guibg=#293531 guifg=#f0f0f0 gui=none
call <SID>X("VertSplit",		"f0f0f0",	"293531",	"none")
" 
" highlight FoldColumn  gui=bold    guifg=grey65     guibg=#d6d3d6
call <SID>X("FoldColumn",		"a6a6a6",	"d6d3d6",	"bold")
" highlight Folded      gui=bold,italic  guifg=#218a21      guibg=Grey90
call <SID>X("Folded",		"218a21",	"e5e5e5",	"bold,italic")


" hi PmenuSel 	guifg=#ffffff guibg=#b0b0b0
call <SID>X("PmenuSel",		"ffffff",	"293531",	"none")
" hi Pmenu 		guifg=#f6f3e8 guibg=#293531
call <SID>X("Pmenu",		"000000",	"b0b0b0",	"none")

" --------------------------------------------------------------------------------
" ---  Light Green
" --------------------------------------------------------------------------------
" hi Comment          term=NONE guifg=#218a21 ctermfg=green cterm=none
call <SID>X("Comment",		"218a21",	"",	"none")
" 
" --------------------------------------------------------------------------------
" ---  Dark blue 
" --------------------------------------------------------------------------------
" hi Statement        term=bold guifg=#00007b gui=bold ctermfg=blue cterm=bold
call <SID>X("Statement",		"00007b",	"",	"bold")
" 
" hi Underlined        guifg=#00007b gui=underline ctermfg=blue term=underline
call <SID>X("Underlined",		"00007b",	"",	"underline")
" hi Identifier        guifg=#00007b gui=none ctermfg=blue term=none
call <SID>X("Itentifier",		"00007b",	"",	"none")



"--------------------------------------------------------------------------------
"--- Dark red
"--------------------------------------------------------------------------------
" hi Number           guifg=#7b0000 gui=bold ctermfg=red cterm=bold 
call <SID>X("Number",		"7b0000",	"",	"bold")
" hi Preproc          guifg=#7b0000 gui=bold cterm=bold ctermfg=red
call <SID>X("Preproc",		"7b0000",	"",	"bold")


"--------------------------------------------------------------------------------
"--- Other 
"--------------------------------------------------------------------------------
""" Dark bold
" hi Function         guifg=#151515 gui=bold ctermfg=brown cterm=bold
call <SID>X("Function",		"151515",	"",	"bold")
" 
""" Dark green
" hi Special          guifg=#00300e gui=bold ctermfg=green cterm=bold
call <SID>X("Special",		"00300e",	"",	"bold")
" 
""" Blue weird
" hi Keyword          guifg=#00407b gui=bold ctermfg=lightblue cterm=none
call <SID>X("Keyword",		"00407b",	"",	"bold")
" 
""" Light Purple
" hi String           guifg=#a520f7 gui=none ctermfg=lightmagenta cterm=none
call <SID>X("String",		"a520f7",	"",	"none")
" 
""" Dark purple
" hi Type             guifg=#5c095c gui=bold ctermfg=3 cterm=none
call <SID>X("Type",		"5c095c",	"",	"bold")
" 
""" Pink 
" hi Constant	     guifg=darkmagenta ctermfg=magenta
call <SID>X("Constant",		"8c038c",	"",	"none")
" 
" --------------------------------------------------------------------------------
" ---  Diff
" --------------------------------------------------------------------------------
call <SID>X("DiffAdd",	    	"",	"cffdd0",	"bold")
call <SID>X("DiffDelete",		"",	"fdc3c3",	"bold")
call <SID>X("DiffChange",		"",	"e4e9f0",	"none")
call <SID>X("DiffText",		    "", "c0d0f0",	"none")

" call <SID>X("GitGutterAdd",	    		"218a21",   "d6d3d6",	"none")
" call <SID>X("GitGutterChange",			"00407b",   "d6d3d6",	"bold")
" call <SID>X("GitGutterDelete",			"7b0000",   "d6d3d6",	"bold")
" " call <SID>X("GitGutterChangeDeleteLine",		    "", "c0d0f0",	"none")
 
" hi GitGutterAddLine	     guifg=darkmagenta ctermfg=magenta
" hi GitGutterChangeLine	     guifg=darkmagenta ctermfg=magenta
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
