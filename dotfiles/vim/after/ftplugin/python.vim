set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4



""" Folding
set foldmethod=indent
set foldlevel=1
function! PythonFolds()
    let thisline = getline(v:lnum)
"      if match(thisline,'^[\ ]*\(subroutine\|module\|function\|program\)') >=0
"     if match(thisline,'^[\ ]*\(def\|function\)') >=0
    if match(thisline,'^\(def\|function\)') >=0
        return ">1"
"      elseif match(thisline,'') >=0
"          return ">1"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=PythonFolds()
