#!/bin/bash
SANJ0ZSHRC="sanj0zshrc.sh"
SANJ0BCRC="bcrc.bc"
SANJ0VIM="sanj0.vim"
INSTALLED_SZSHRC="$HOME/.sanj0zshrc"
INSTALLED_SVIM="$HOME/.sanj0.vim"
INSTALLED_BCRC="$HOME/.bcrc.bc"
ZSHRC="$HOME/.zshrc"
VIMRC="$HOME/.vimrc"
SOURCE_LINE="source $INSTALLED_SZSHRC"
SOURCE_LINE_VIMRC="so $INSTALLED_SVIM"

echo copying files to home dir...
# copy sanj0zshrc to home dir
cp $SANJ0ZSHRC $INSTALLED_SZSHRC
cp $SANJ0VIM $INSTALLED_SVIM
echo "do you wish to overwrite ~/.bcrc.bc?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) cp $SANJ0BCRC $INSTALLED_BCRC;
            echo "overwrote ~/.bcrc.bc"; break;;
        No ) echo "didn't overwrite ~/.bcrc.bc";;
    esac
done

echo installing to .zshrc
if ! grep -q "^$SOURCE_LINE" "$ZSHRC"; then
    echo $SOURCE_LINE >> $ZSHRC
    source $ZSHRC
fi

echo installing to .vimrc
if ! grep -q "^$SOURCE_LINEVIMRC" "$VIMRC"; then
    echo $SOURCE_LINE_VIMRC >> $VIMRC
fi
echo done!
