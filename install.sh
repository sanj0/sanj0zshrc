#!/bin/bash
SANJ0ZSHRC="sanj0zshrc"
INSTALLED_SZSHRC="$HOME/.sanj0zshrc"
ZSHRC="$HOME/.zshrc"
SOURCE_LINE="source $INSTALLED_SZSHRC"

# copy sanj0zshrc to home dir
cp $SANJ0ZSHRC $INSTALLED_SZSHRC

if ! grep -q "^$SOURCE_LINE" "$ZSHRC"; then
    echo $SOURCE_LINE >> $ZSHRC
    source $ZSHRC
fi
