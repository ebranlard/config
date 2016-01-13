set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4



""" Folding
set foldmethod=indent
set foldlevel=1
function! PythonFolds()
    let prevline = getline(v:lnum-1)
    let thisline = getline(v:lnum)
    let nextline = getline(v:lnum+1)
"      if match(thisline,'^[\ ]*\(subroutine\|module\|function\|program\)') >=0
    if match(nextline,'^[\ ]*\(class\)') >=0
        return "<1"
    elseif match(nextline,'^\(def\|function\)') >=0
        return "<1"
    elseif match(nextline,'^[\ ]*\(def\|function\)') >=0
        return "<2"
    elseif match(prevline,'^[\ ]*\(class\)') >=0
        return ">1"
    elseif match(prevline,'^\(def\|function\)') >=0
        return ">1"
    elseif match(prevline,'^[\ ]*\(def\|function\)') >=0
        return ">2"
    else
        return "="
    endif
"     if match(thisline,'^[\ ]*\(class\)') >=0
"         return ">1"
"     elseif match(thisline,'^\(def\|function\)') >=0
"         return ">1"
"     elseif match(thisline,'^[\ ]*\(def\|function\)') >=0
"         return ">2"
"     else
"         return "="
"     endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=PythonFolds()

function! MyFoldTextPython()
    let foldsize = (v:foldend-v:foldstart)
    return '          ('.foldsize.'lines)'
endfunction
set foldtext=MyFoldTextPython()  " can be customized later


" --------------------------------------------------------------------------------
" --- Aligns 
" --------------------------------------------------------------------------------
vmap ,ac :Align! =Ip1P1 # <CR>



" --------------------------------------------------------------------------------
" --- Plugins 
" --------------------------------------------------------------------------------
" let g:pymode_warnings = 0
" let g:pymode_trim_whitespaces = 0
" let g:pymode_options = 0
" let g:pymode_folding = 0
" let g:pymode_doc = 0
" let g:pymode_virtualenv = 0
" 
" let g:pymode_lint = 0
" let g:pymode_lint_message = 0
" let g:pymode_rope = 0
" let g:pymode_syntax = 0
" 
" " Turn on the run code script                                     *'g:pymode_run'*
" let g:pymode_run = 1
" let g:pymode_run_bind = '<leader>r'
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_bind = '<leader>b'
" " let g:pymode_breakpoint_cmd = ''
