" Vim filetype plugin file
" Language:	hawc2
" Maintainer:	E. Branlard
" Last Changed: December 2012
" Instalation: Put this file in ~/.vim/ftplugin/ , it requires matchit.vim


if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal comments=:;

if exists("loaded_matchit")
  let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
  let b:match_words = 'begin:' . s:conditionalEnd
endif

let b:undo_ftplugin = "unlet! b:match_words"

" These might be overriden in after/ftplugin
" Remeber there is \tt for latex latbles and \tsp for spaces
vmap \af :Align Ip0p1= = ( ) ; ! ,<CR>
vmap \aa :Align Ip0p1= = ; !<CR>
vmap \ae :Align Ip0p1= = ; !<CR>
