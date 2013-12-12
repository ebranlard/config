#!/bin/bash
mkdir -p bundle
cd bundle

git clone https://github.com/kien/ctrlp.vim/
git clone https://github.com/elmanuelito/vim-simple-compile
git clone https://github.com/elmanuelito/vim-simple-comment
git clone https://github.com/kien/rainbow_parentheses.vim
git clone https://github.com/vim-scripts/Align
git clone https://github.com/bling/vim-airline
git clone https://github.com/tpope/vim-fugitive.git
# git clone https://github.com/scrooloose/syntastic.git
if [ $HOSTNAME == 'work' ]
then
    echo "Work"

# syntastic/
# tlib_vim/
# vim-addon-mw-utils/
# vim-easymotion/
# vim-markdown-folding/
# vim-markdown/
# vim-snipmate/
# vim-surround/

# elif [ $HOSTNAME == 'g-000.risoe.dk' ]
# then
#     echo "gorm"
# else
#     echo "Unknown host."
fi
