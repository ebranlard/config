#!/bin/bash
mkdir -p bundle
cd bundle

git clone https://github.com/kien/ctrlp.vim/
git clone https://github.com/elmanuelito/vim-simple-compile
git clone https://github.com/elmanuelito/vim-simple-comment
git clone https://github.com/kien/rainbow_parentheses.vim
git clone https://github.com/vim-scripts/Align
if [ $HOSTNAME == 'work' ]
then
    echo "Work"
# syntastic/
# tlib_vim/
# vim-addon-mw-utils/
# vim-airline/
# vim-easymotion/
# vim-fugitive/
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
