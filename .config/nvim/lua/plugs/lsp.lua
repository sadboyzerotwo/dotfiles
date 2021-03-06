return function()
	local completion = require('completion')
	local nvim_lsp = require('lspconfig')

        local utils = require('plugs.utils')
        

        local on_attach = function(client, bufnr)

            completion.on_attach(client,bufnr)

            local lsp_keymap = {
               n = {
                ["<leader>,"] = "vim.lsp.diagnostic.goto_prev()",
                ["<leader>;"] = "vim.lsp.diagnostic.goto_next()",
                ["gd"] = "vim.lsp.buf.definition()",
                ["gD"] = "vim.lsp.buf.declaration()",
                ["gi"] = "vim.lsp.buf.implementation()",
                ["gI"] = "vim.lsp.buf.type_definition()",
                ["gr"] = "vim.lsp.buf.references()",
                ["g0"] = "vim.lsp.buf.document_symbol()",
                ["gW"] = "vim.lsp.buf.workspace_symbol()",
                ["K"] = "vim.lsp.buf.hover()",
                ["<c-k>"] = "vim.lsp.buf.signature_help()",
                ["<leader>lR"] = "vim.lsp.buf.rename()",
                ["<leader>lF"] = "vim.lsp.buf.range_formatting()",
                ["<leader>lf"] = "vim.lsp.buf.formatting()",
                ["<leader>l."] = "vim.lsp.buf.code_action()",
                ["<leader>el"] = "vim.lsp.diagnostic.set_loclist()",
               },
               v = {
                ["<leader>lF"] = "vim.lsp.buf.range_formatting()",
               },
               i = {
                ["<c-k>"] = "vim.lsp.buf.signature_help()",
               }
            }

            utils.set_buf_keymap(
                lsp_keymap,
                nil,
                function (value)
                    return "<Cmd>lua " .. value
                end
            )

            vim.api.nvim_buf_set_keymap(0,'n','<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', {noremap=true});
            --vim.api.nvim_buf_set_keymap(0,'i','<leader>nl', '<Esc>o', {noremap=true});


            local telescope_keymap = {
                n = {
                    ["lw"] = "lsp_document_symbols",
                    ["lW"] = "lsp_workspace_symbols",
                    ["l."] = "lsp_code_actions",
                    ["lr"] = "lsp_references",
                    ["lt"] = "treesitter",
                }
            }
            utils.set_buf_keymap(
                telescope_keymap,
                utils.leader_key_mapper,
                function(value)
                    return "<Cmd>Telescope " .. value
                end
            )
        end

--[[
	nvim_lsp.tsserver.setup{
		on_attach = on_attach,
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
	}


	nvim_lsp.jsonls.setup{
		on_attach = on_attach,
		filetypes = { "json" }
	}

	nvim_lsp.html.setup{}


        nvim_lsp.sumneko_lua.setup{
            on_attach = on_attach,
            filetypes = { "lua" },
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = {'vim', 'use'}
                    },
                    workspace = {
                        --Make server aware of Neovim runtime files
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] =true,
                        }
                    }
                }
            }
        }
        ]]--
        --[[
	nvim_lsp.jdtls.setup{
                cmd = { 'java-lsp.sh' },
		on_attach = on_attach,
		filetypes = { "java" },
                root_dir = nvim_lsp.util.root_pattern('pom.xml')
	}]]--


        nvim_lsp.tsserver.setup{
            on_attach = on_attach
        }
        
end
