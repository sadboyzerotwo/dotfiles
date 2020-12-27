local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim.git '..install_path)
	execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
vim.cmd [[ autocmd BufWritePost packed.lua PackerCompile ]]

return require('packer').startup(
	function()
		use { 'wbthomason/packer.nvim' , opt = true }
		use { 'morhetz/gruvbox' }
		use { 'justinmk/vim-sneak' }
		use { 'unblevable/quick-scope' }
		--use { 'junegunn/fzf' }
		--use { 'junegunn/fzf.vim' }
		use { 'tpope/vim-dispatch' }
		use { 'tpope/vim-fugitive' }
		use { 'tpope/vim-surround' }
		use { 'jremmen/vim-ripgrep' }
		--use { 'uiiaoo/java-syntax.vim' )}
		--use { 'flazz/vim-colorschemes' }
                use { 'whatyouhide/vim-gotham' } 
		use { 'arcticicestudio/nord-vim' }
		use { 'cocopon/iceberg.vim' }
                use { 'dracula/vim', as = 'dracula' }
                --use { 'ryanoasis/vim-devicons' }
                use { 'kyazdani42/nvim-web-devicons', config = require('plugs.nvim-web-devicons') }
		use { 'vim-airline/vim-airline' }
		use { 'vim-airline/vim-airline-themes' }
		use { 'vimwiki/vimwiki' }
		use { 'kyoz/purify',  rtp = 'vim' }
		use { 'neovim/nvim-lspconfig', config = require('plugs.lsp')}
		use { 'nvim-lua/completion-nvim', config = require('plugs.completion-nvim')}
		use { 'nvim-treesitter/nvim-treesitter-textobjects'}
		use { 'nvim-treesitter/nvim-treesitter-refactor'}
		use { 'nvim-treesitter/nvim-treesitter', config = require('plugs.nvim-treesitter') }
		use { 'nvim-telescope/telescope.nvim', 
			requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/plenary.nvim'}}
		}
                --use { '~/Lab/nvim-plugins/whid' }
	end
)

