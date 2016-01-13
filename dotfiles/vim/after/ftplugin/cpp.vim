""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" OmniCpp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" omnicppcomplete options

" --- OmniCppComplete ---
" -- required by OmniCPP and Align--
" set nocp " non vi compatible mode
" filetype plugin on " enable plugins
" 
" " -- configs --
" let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
" let OmniCpp_MayCompleteDot = 1 " autocomplete with .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
" let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
" let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces

" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview

" auto close options when exiting insert mode or moving away
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" set completeopt=menu,menuone

" Setup the tab key to do autocompletion
" function! CompleteTab()
"     let prec = strpart( getline('.'), 0, col('.')-1 )
"     if prec =~ '^\s*$' || prec =~ '\s$'
"         return "\<tab>"
"     else
"         return "\<c-x>\<c-o>"
"     endif
" endfunction
" inoremap <tab> <c-r>=CompleteTab()<cr>

