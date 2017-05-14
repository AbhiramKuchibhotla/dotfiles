" Basics

syntax on                     " Enable syntax highlighting
filetype off                  " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
highlight LineNr ctermfg=grey

set number
set nowrap
set nocompatible              " We're running Vim, not Vi!
set hidden
set laststatus=2
set tabstop=4                 " A tab is 8 spaces
set expandtab                 " Always uses spaces instead of tabs
set softtabstop=4             " Insert 4 spaces when tab is pressed
set shiftwidth=4              " An indent is 4 spaces
set shiftround                " Round indent to nearest shiftwidth multiple
set clipboard=unnamedplus
set splitright
set encoding=utf-8
set autowrite

" Shortcuts
nnoremap <C-g> :NERDTreeToggle<CR>
" Ctrl+c Ctrl+v support
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
map <C-n> :NERDTreeToggle<CR>

" Airline theme
let g:airline_theme="nord"
let g:airline_powerline_fonts = 1

" Trigger Configs for Snippets
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

call vundle#begin()
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'docker/docker'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
Plugin 'valloric/youcompleteme'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'raimondi/delimitmate'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'npacker/vim-css3complete'

call vundle#end() 

colorscheme nord
