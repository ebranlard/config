""" Indent
" set smartindent
set autoindent
" set indentexpr

""" Aligns
" These might be overriden in after/ftplugin
" Remeber there is \tt for latex latbles and \tsp for spaces
vmap ,af :Align Ip0p1= = ( ) ! ,<CR>
vmap ,ad :Align Ip0p1= :: !<<CR>     
vmap ,av :Align Ip0p1= :: !<CR>     
vmap ,aa :Align Ip0p1= = !<CR>
vmap ,ae :Align Ip0p0= = !<CR>
vmap ,ac :Align Ip0p0= !<CR>

""" Misc
" Don't higlight fortran tabs
hi link fortranTab NONE

" to avoid line return
set textwidth=0

""" Folding
function! FortranFolds()
    let thisline = getline(v:lnum)
"      if match(thisline,'^[\ ]*\(subroutine\|module\|function\|program\)') >=0
    if match(thisline,'^[\ ]*\(integer(.*) function\|integer function\|logical function\|subroutine\|function\|program\)') >=0
        return ">1"
    elseif match(thisline,'end module') >=0
         return "0"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=FortranFolds()
"  setlocal foldtext=FortranFoldText()

let s:extfname = expand("%:e")
if s:extfname ==? "f90"
    let fortran_free_source=1
    unlet! fortran_fixed_source
    let g:fortran_have_tabs=1 
    let g:fortran_more_precise=1 
    let b:fortran_fixed_source=0 
    let b:fortran_dialect="f90" 
    let b:fortran_do_enddo=1 
else
    let fortran_fixed_source=1
    unlet! fortran_free_source
endif
set cc=132
set textwidth=132

" gfotran: suitable error format for quickfix window
"  set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#,%W%f:%l.%c:,%W%f:%l:,%C,%C%p%*[0123456789^],%ZWarning:\ %m,%C%.%#
"  set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%W%f:%l.%c:,%I%f:%l:,%C,%C%p%*[0123456789^],%ZWarning:\ %m,%C%.%#
"  set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%ZWarning:\ %m,%C%.%#
"  set efm=%I%.%#In\ function%m,%I%.%#undefined\ reference\ to%m,%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%ZWarning:\ %m,%C%.%#
"  set efm=%I%.%#In\ function%m,%I%.%#undefined\ reference\ to%m,%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZFatal\ Error:\ %m,%ZError:\ %m,%ZWarning:\ %m,%C%.%#

" Ifort
" set efm=%f(%l):%m,%-G$.%#
" 
" " Gfortran
" set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#

" command! Ifort set efm=%f(%l):%m,%-G$.%#
" command! Gfortran set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
command! Ifort compiler ifort
command! Gfortran compiler gfortran
" ifort: suitable error format for quickfix window
" set efm=%E%.%#rror:\ %f\\,\ line\ %l:\ %m,\%-C%.%#,\%-Z\%p^
" let isf="@,48-57,/,.,-,_,+,#,^,,$,%,~,="
" set efm=%f(%l):%m,%C\ %.%#,%-Z\-%#%p^
" set efm=%f(%l):%m,%-G$.%#


let g:syntastic_fortran_flags=' -I /work/lib/OmniVor_lib/fortran/_build/linux-ia32/ -J/work/lib/OmniVor_lib/fortran/_build/linux-ia32/'
let g:syntastic_fortran_include_dirs = ['/work/lib/OmniVor_lib/fortran/_build/linux-ia32/']
compiler! gfortran
