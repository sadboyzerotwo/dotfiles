local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim.git '..install_path)
	execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(
	function()
                use { 'wbthomason/packer.nvim' , opt = true }
		use { 'morhetz/gruvbox' }
                --use { 'preservim/nerdtree' }
                use { 'kyazdani42/nvim-tree.lua' }
		use { 'justinmk/vim-sneak' , config = function ()
                        vim.cmd([[let g:sneak#label = 1]])
                    end
                }
		use { 'neovim/nvim-lspconfig',
                    config = require('plugs.lsp')
                }
		use { 'nvim-lua/completion-nvim', config = require('plugs.completion-nvim')}
		use { 'tpope/vim-dispatch' }
		use { 'tpope/vim-fugitive' }
		use { 'tpope/vim-surround' }
		use { 'jremmen/vim-ripgrep' }
                use { 'whatyouhide/vim-gotham' }
                use { 'kyazdani42/nvim-web-devicons', config = require('plugs.nvim-web-devicons') }
		use { 'vim-airline/vim-airline' }
		use { 'vim-airline/vim-airline-themes' }
		use { 'vimwiki/vimwiki', config = require('vimwiki') }
		use { 'nvim-treesitter/nvim-treesitter-textobjects'}
		use { 'nvim-treesitter/nvim-treesitter-refactor'}
		use { 'nvim-treesitter/nvim-treesitter', config = require('plugs.nvim-treesitter') }
		use { 'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/plenary.nvim'}}
		}
                use { 'hrsh7th/vim-vsnip' ,
                   after = { 'completion-nvim' },
                    config = function()
                      vim.g.vsnip_snippet_dir = vim.fn.stdpath('config')..'/snippets'  
                    end
                }
                use { 'hrsh7th/vim-vsnip-integ' ,
                    after = { 'completion-nvim' ,'vim-vsnip' },
                }
                use { 'NLKNguyen/papercolor-theme' }
                --use { '~/Lab/nvim-plugins/whid' }
	end
)

