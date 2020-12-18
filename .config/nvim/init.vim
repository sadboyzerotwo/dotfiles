syntax on
set relativenumber 
set noerrorbells
set smartcase
set updatetime=300
set incsearch
set smartindent
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set hidden
set shortmess+=c
"set mouse=a "enables mouse

filetype plugin on

inoremap fd <ESC>
let mapleader=" "

lang en_US.UTF-8

call plug#begin(stdpath('data').'/plugged')
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf' , { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'ryanoasis/vim-devicons'
call plug#end()


let wiki = {}
let wiki.path = '~/.vimwiki'
let wiki.nested_syntaxes = {'javascript': 'javascript', 'typescript':'typescript', 'python': 'python', 'c++': 'cpp', 'java': 'java'}

let g:vimwiki_list = [wiki]

"move between splits
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wh :wincmd h<CR>

"paste from clipboard
"nnoremap <Leader>pg "*p !NOT WORKING
nnoremap <Leader>yg "+Y

"saving
nnoremap <Leader>sf :w<CR>
nnoremap <Leader>sa :wa<CR>

"buffers
nnoremap <Leader>bl buffers<CR>:buffer<SPACE>

colorscheme purify
set background=dark


source $HOME/.config/nvim/mycocconf.vim
