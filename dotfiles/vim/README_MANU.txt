#Installed
OmniCppComplete
Align.vba.gz



#Modified
vimfiles/plugins/MyImaps.vim
vimfiles/indent/matlab.vim   #Remove function for indent

ftplugins/latex-suite/folding.vim 
    I replaced : 
    call AddSyntaxFoldItem(s, endpat, 0, -1)   
    by
    call AddSyntaxFoldItem(s, endpat, 1, -1)   
    for folding after the section line


after/ftplugin/tex.vim # that's where I put the Imaps and some shortcuts for tex only. On windows, though, I put them in a file MyImpas.vim in the folder plugin


### New files
syntax/tex.vim  #overrides /usr/share/vim/vim72/syntax/tex.vim 
# Underlines sections
# Switch off spell check in comments



# important files
vimfiles/ftplugins/matlab.vim
vimfiles/syntax/matlab.vim
compiler/mlint

