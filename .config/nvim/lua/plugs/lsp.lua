return function()
	local completion = require('completion')
	local nvim_lsp = require('lspconfig')

	local on_attach = function(client, bufnr)
		completion.on_attach(client, bufnr)
		
		--TODO:ADD KEY BINDINGS HERE--
	
	end

	nvim_lsp.jdtls.setup{
		on_attach = on_attach,
		filetypes = { "java" },
		init_options = {
			jvm_args = {
				"-javaagent:/home/sadboy/.install/lombok/lombok.jar"
			}
		}
	}

	nvim_lsp.tsserver.setup{
		on_attach = on_attach,
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
	}


	nvim_lsp.jsonls.setup{
		on_attach = on_attach,
		filetypes = { "json" }
	}

	nvim_lsp.html.setup{}

end
