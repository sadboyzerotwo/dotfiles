lua require 'init'
set shortmess+=c
"set mouse=a "enables mouse

inoremap fd <ESC>
"let mapleader=" "

lang en_US.UTF-8

call plug#begin(stdpath('data').'/plugged')
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf' , { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/completion-nvim'
"Plug 'ryanoasis/vim-devicons'
call plug#end()


let wiki = {}
let wiki.path = '~/.vimwiki'
let wiki.nested_syntaxes = {'javascript': 'javascript', 'typescript':'typescript', 'python': 'python', 'c++': 'cpp', 'java': 'java'}

let g:vimwiki_list = [wiki]


colorscheme purify
set background=dark

"fzf
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg 



"source $HOME/.config/nvim/mycocconf.vim

lua <<EOF
require'lspconfig'.jdtls.setup{
	on_attach=require'completion'.on_attach,
	filetypes = { "java" },
	init_options= {
	jvm_args = {
		"-javaagent:/home/sadboy/.install/lombok/lombok.jar"	
	}
	}
}
EOF

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect

"let g:completion_confirm_key = "\<C-y>"
let g:completion_matching_stategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_timer_cycle = 80

"nnoremap <space>, <cmd>lua vim.lsp.diagnostic.goto_prev()<CR> 
"nnoremap <space>; <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <space>d' <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <space>f' <cmd>lua vim.lsp.buf.formatting()<CR>
"nnoremap <space>h' <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <space>m' <cmd>lua vim.lsp.buf.rename()<CR>
"nnoremap <space>r' <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <space>s' <cmd>lua vim.lsp.buf.document_symbol()<CR>


