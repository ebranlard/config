#!/bin/bash
mkdir -p tmp
mkdir -p bundle
cd bundle

git clone https://github.com/kien/ctrlp.vim/
# git clone https://github.com/kien/rainbow_parentheses.vim
git clone https://github.com/vim-scripts/Align
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-markdown.git
git clone https://github.com/vim-latex/vim-latex.git
git clone https://github.com/d11wtq/ctrlp_bdelete.vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-dispath.git
git clone https://github.com/vim-scripts/LargeFile
# Airline and requirements
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/bling/vim-airline
# SnipMate and requirements
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git 
git clone https://github.com/garbas/vim-snipmate.git
# git clone https://github.com/honza/vim-snippets.git # Snippets stored in my vim/snippet directory directly
#
git clone https://github.com/ebranlard/vim-matlab-behave
git clone https://github.com/ebranlard/vim-simple-comment
git clone https://github.com/ebranlard/vim-simple-compile
git clone https://github.com/ebranlard/vim-tagbar-manu


if [ $HOSTNAME == 'work' ]
then
    echo "Work"
    #git clone https://github.com/majutsushi/tagbar
    # syntastic/
    # tlib_vim/
    # vim-addon-mw-utils/
    # vim-easymotion/
    # vim-markdown-folding/
    # vim-markdown/
    # vim-snipmate/
fi
if [ $HOSTNAME == 'olympe' ]
then
    echo "Olympe"
fi
