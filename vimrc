" Relative line numbers
set relativenumber
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8

" Indentation
set expandtab tabstop=2 shiftwidth=2


" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'wakatime/vim-wakatime'"

call vundle#end()            " required
filetype plugin indent on    " required
Plugin 'wakatime/vim-wakatime'
