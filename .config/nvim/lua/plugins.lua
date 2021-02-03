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
                use { 'norcalli/nvim-colorizer.lua' , config = function()
                        require'colorizer'.setup()
                    end
                }
                use { 'hrsh7th/vim-vsnip' ,
                   after = { 'completion-nvim' },
                    config = require('plugs.vsnip')
                }
                use { 'hrsh7th/vim-vsnip-integ' ,
                    after = { 'completion-nvim' ,'vim-vsnip' },
                }
                use { 'NLKNguyen/papercolor-theme' }
                use { 'mfussenegger/nvim-jdtls', 
                    ft = { "java" },
                    config = function()
                        local completion = require('completion')

                        local on_attach = function(client, bfnr)
                           completion.on_attach(client,bfnr) 

                           vim.api.nvim_buf_set_keymap(0,'n','<leader>,', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<leader>;', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','gI', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','g0', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<c-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<leader>lR', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<leader>lF', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<leader>lf', '<Cmd>lua vim.lsp.buf.formatting()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<leader>a', '<Cmd>lua require("jdtls").code_action()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'n','<leader>el', '<Cmd>lua vim.lsp.buf.set_loclist()<CR>', { noremap=true })

                           vim.api.nvim_buf_set_keymap(0,'v','<leader>lF', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', { noremap=true })
                           vim.api.nvim_buf_set_keymap(0,'i','<c-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap=true })

                        end
                        require('jdtls').start_or_attach( {
                            cmd = {'java-lsp.sh'},
                            on_attach = on_attach,
                            root_dir = require('jdtls.setup').find_root({'pom.xml'})})
                    end

                }
                use { 'dracula/vim', as = 'dracula' }
                use { 'rakr/vim-one' }
                --use { '~/Lab/nvim-plugins/whid' }
	end
)

