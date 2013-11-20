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
