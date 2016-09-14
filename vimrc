filetype plugin indent on

" Set line numbers on the left
set relativenumber
set number

" Indentation is 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Charecters over the 80 char ruler are highlighted red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Highlight search matches
set hlsearch

syntax enable
set background=dark

" map CTRL-E to end-of-line

map <C-e> <esc>$i<right>

" map CRTL-A to start-of-line

map <C-a> <esc>0