#!/bin/bash

# Check that rcup is installed
if ! command -v rcup &> /dev/null
then
    echo "rcup could not be found"
    echo "Please install rcm"
    exit
fi

rcup aliases \
     bashrc \
     bin \
     gemrc \
     gitconfig \
     gitignore_global \
     vimrc \
     zprofile