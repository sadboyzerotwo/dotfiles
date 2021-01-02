return function()
    print('nvim-jdtls')
    local utils = require('plugs.utils')
    local utils = require('completion-nvim')
    local  java_lsp_map = {
        n = {
            ["l."]  = "code_action()",
            ["ljr"] = "code_action(false,'refactor')"
        },
        v = {
            ["l."]  = "code_action()",
            ["ljr"] = "code_action(false,'refactor')"
        }
    }

    local function java_lsp_attach(client)
        AttachFunctionsLSP(client)
        utils.set_buf_keymap(
            java_lsp_map,
            utils.leader_key_mapper,
            function(value)
                return "<Cmd>lua require'jdtls'." .. value
            end
            )
        require("jdtls.setup").add_commands()
    end

    local function get_config()
        local document_config = require "lspconfig".jdtls.document_config
        local config = document_config.default_config
        print(config)
        document_config.on_new_config(config)
        return { cmd =  config.cmd, on_attach = java_lsp_attach }
    end

    function JavaLspSetup()
        local config = get_config()
        require "jdtls".start_or_attach(config)
    end

    JavaLspSetup()

    vim.cmd [[augroup lsp_java]]
    vim.cmd [[autocmd!]]
    vim.cmd [[autocmd FileType java call v:lua.JavaLspSetup()]]
    vim.cmd [[augroup end]]

    print('end-nvim-jdtls')
end
