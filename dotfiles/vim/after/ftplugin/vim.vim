""" Folding
function! VimFolds()
    let thisline = getline(v:lnum)
    if match(thisline,'^[\ ]*\(""" \|"" \)') >=0
        return ">1"
"      elseif match(thisline,'') >=0
"          return ">1"
    else
        return "="
    endif
endfunction
"  function! VimFoldText()
"      let foldsize = (v:foldend-v:foldstart)
"      return getline(v:foldstart)
"  endfunction

setlocal foldmethod=expr
setlocal foldexpr=VimFolds()
setlocal foldtext=VimFoldText()
