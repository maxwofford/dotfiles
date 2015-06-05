execute pathogen#infect()

filetype plugin on

" Set line numbers on the left
set relativenumber
set number
syntax on

" command Ya :w! ~/.vbuf<CR>
" command Pa :r ~/.vbuf<CR>
" map <*y> :w! ~/.vbuf<CR>
" map <*p> :r ~/.vbuf<CR>

" Indentation is 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Charecters over the 80 char ruler are highlighted red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Highlight search matches
set hlsearch

" Set colors to 256
" set t_Co=256
" let g:base16_shell_path="$HOME/.config/base16-shell"
" let base16colorspace=256 " Access colors present in 256 colorspace. Must be before colorscheme declaration
" set background=dark
" colorscheme base16-default
" Unsetting this to disable Background Color Erase for tmux
" (https://superuser.com/questions/678905/vim-colorscheme-weirdness-for-background-not-non-text-area)
" set t_ut= 
