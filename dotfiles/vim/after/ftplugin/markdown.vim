
" --- Folding: 
" NOTE: this is copy-pasted from my vimrc
set foldmethod=marker    "indent " fold indented regions
set foldminlines=1
set foldnestmax=2
set nofoldenable
set foldlevel=1     " fold from the beginning
set foldmarker=--{,--} " foldmarker
" set foldmarker={{{,}}} " foldmarker
function! MyFoldText()
    let thisline = getline(v:lnum)
    let foldsize = (v:foldend-v:foldstart)
    return getline(v:foldstart).'    ('.foldsize.' lines)'
endfunction
"set foldtext=getline(v:foldstart)
set foldtext=MyFoldText()  " can be customized later
