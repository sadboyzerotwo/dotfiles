return function()
    vim.api.nvim_exec(
        [[
            let wiki = {}
            let wiki.path = '~/.vimwiki'
            let wiki.nested_syntaxes = {'javascript': 'javascript', 'typescript':'typescript', 'python': 'python', 'c++': 'cpp', 'java': 'java'}
            let wiki.syntax = 'markdown'
            let wiki.ext = '.md'
            let g:vimwiki_list = [wiki]
        ]],true
    )
end

