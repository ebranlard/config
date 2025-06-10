
set shiftwidth=2 " number of characters for indenting

" call IMAP('`w', 'YIHA', 'tex')
" call IMAP('EAL', "\\begin{align}\<CR><++>&=<++>\\\\ \<CR><++>&=<++>\<CR>\\end{align}\<CR><++>", 'tex')    

" --- Useful mappings from vim-latex:
" \ls : forward search
" \ll : compile 

" map <f2> :w<cr><leader>ll
" imap <f2> <C-o>:w<cr><ESC><leader>ll
" map <f2> :w<cr>:~make<cr><cr>
" imap <f2> <C-o>:w<cr><ESC>:make<cr><cr>
" nnoremap <f5> :w<cr><leader>v<cr><cr>
" vnoremap <f5> :w<cr><leader>v<cr><cr>
" inoremap <f5> <C-o>:w<cr><ESC><leader>v<cr><cr>

" set makeprg=make
" let &makeprg = 'smartmake '
" map ,m :w<cr>\ll
" Below we rely on vim-dispatch plugin
map ,m :w<cr>:Make<CR><CR>

" Clearing the registers used by vimlatex I believe
let @+=''
let @*=''


if has("win32") || has("win16")
    set noshellslash " >>>> COMMENTED BY EMMANUEL FOR FILE PATH COMPLETION
"     function! Tex_ForwardSearchLaTeX()
"     let s:target = 'pdf'
"     "let execString .= Tex_Stringformat('start %s %s -forward-search %s %s', viewer, target_file, sourcefileFull, linenr)
" " 	let mainfnameRoot = shellescape(fnamemodify(Tex_GetMainFileName(), ':t:r'), 1)
" " 	let mainfnameFull = Tex_GetMainFileName(':p:r')
" " 	let target_file = shellescape(mainfnameFull . "." . s:target, 1)
" " 	let sourcefileFull = shellescape(expand('%:p'), 1)
" " 	let linenr = line('.')
" "     echo 
" 
" 	let viewer = Tex_GetVarValue('Tex_ViewRule_'.s:target)
" 
" 	let mainfnameRoot = shellescape(fnamemodify(Tex_GetMainFileName(), ':t:r'), 1)
" 	let mainfnameFull = Tex_GetMainFileName(':p:r')
" 	let target_file = shellescape(mainfnameFull . "." . s:target, 1)
" 	let sourcefile = shellescape(expand('%'), 1)
" 	let sourcefileFull = expand("%:p")
"     echo sourcefileFull
" 	let sourcefileFull = shellescape(expand("%:p"), 1)
"     echo sourcefileFull
" 	let linenr = line('.')
" 	" cd to the location of the file to avoid problems with directory name
" 	" containing spaces.
" 	call Tex_CD(Tex_GetMainFileName(':p:h'))
" 
" 	" inverse search tips taken from Dimitri Antoniou's tip and Benji Fisher's
" 	" tips on vim.sf.net (vim.sf.net tip #225)
" 	let execString = 'silent! !'
" 	" Forward search in sumatra has these arguments (-reuse-instance is optional):
" 	" SumatraPDF -reuse-instance "pdfPath" -forward-search "texPath" lineNumber
" 	"let execString .= Tex_Stringformat('start %s %s -forward-search "%s" %s', viewer, target_file, sourcefileFull, linenr)
" 	"let execString .= Tex_Stringformat('start %s %s', viewer, target_file)
" 	let execString .= 'start '.viewer.' '.target_file.' -forward-search "'.sourcefileFull.'" '.linenr
"     "echo execString
"     endfunction

else
    function! Tex_ForwardSearchLaTeX()
      let cmd = 'evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")
    "   let cmd
"       echo cmd
      let output = system(cmd)
    endfunction
endif

" Forcing spell check
set spell

" Got annoyed by latex folding lately
set nofoldenable
set foldmethod=marker
set foldtext=MyFoldText() " Otherwise overwritten by tex pluggin

"if exists("did_load_tex_local_after")
       "finish
"endif
"let did_load_tex_local_after=1


" --------------------------------------------------------------------------------
" --- Align 
" --------------------------------------------------------------------------------
" if !hasmapto('<Plug>AM_tsp')	|map <unique> <Leader>tsp	<Plug>AM_tsp|endif
" if !hasmapto('<Plug>AM_tsq')	|map <unique> <Leader>tsq	<Plug>AM_tsq|endif
" if !hasmapto('<Plug>AM_tt')		|map <unique> <Leader>tt	<Plug>AM_tt|endif

vmap ,a& :Align! =Ip1P0 &<CR>     
vmap ,a<space>  <Plug>AM_tsp
vmap ,a\ :Align! =Ip0P0 \\<CR>     
