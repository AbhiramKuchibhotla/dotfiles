" plugin system
call plug#begin('~/.local/share/nvim/plugged')
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/deoplete.nvim'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/echodoc.vim'
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" Enable deoplete autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/user/rust/src'
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/"

" Set command bar height for echodoc completion
" Must be set before echodoc is enabled
set cmdheight=2

" Enable echodoc
let g:echodoc#enable_at_startup = 1

" Set tab width
set tabstop=4
set shiftwidth=4
set expandtab

" Emmet.io Stuff
let g:user_emmet_install_global = 1

" Airline Stuff
let g:airline_theme="nord"
let g:airline_powerline_fonts = 1

" Enable line numbers
set number
