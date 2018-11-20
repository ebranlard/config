call IMAP('`w', 'YIHA', 'tex')
call IMAP('EAL', "\\begin{align}\<CR><++>&=<++>\\\\ \<CR><++>&=<++>\<CR>\\end{align}\<CR><++>", 'tex')    
call IMAP('TAB', "\\begin{tabcol}{<++>}{<++>}\<CR>\\begin{tabular}{<++>}\<CR><++>\<CR>\\end{tabular}\<CR>\\end{tabcol}\<CR><++>", 'tex')    
call IMAP('IMG', "\\imageb{<++>}{<++>}{<++>}{<++>}\<CR><++>", 'tex')    
call IMAP('BII', "\\biimages{<++>}{<++>}{<++>}{0.49}{0.49}{<++>}\<CR><++>", 'tex')    



" map <f2> :w<cr><leader>ll
" imap <f2> <C-o>:w<cr><ESC><leader>ll

" map <f2> :w<cr>:~make<cr><cr>
" imap <f2> <C-o>:w<cr><ESC>:make<cr><cr>

nnoremap <f5> :w<cr><leader>v<cr><cr>
vnoremap <f5> :w<cr><leader>v<cr><cr>
inoremap <f5> <C-o>:w<cr><ESC><leader>v<cr><cr>

" set makeprg=make
let &makeprg = 'smartmake '
map ,m :w<cr>\ll


" CLearing the registers used by vimlatex I believe
let @+=''
let @*=''

if has("win32") || has("win16")

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

"if exists("did_load_tex_local_after")
       "finish
"endif
"let did_load_tex_local_after=1



