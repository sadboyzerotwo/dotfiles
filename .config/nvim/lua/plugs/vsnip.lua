return function()
    vim.g.vsnip_snippet_dir = vim.fn.stdpath('config')..'/snippets'  

    --vim.cmd('inoremap <expr> <Tab>   pumvisible() ? \"\\<C-n>" : \"\\<Tab>\"')
    --vim.cmd('inoremap <expr> <S-Tab> pumvisible() ? \"\\<C-p>" : \"\\<S-Tab>"')

    --vim.cmd('imap <expr> <Tab> vsnip#expandable() ? \"<Plug>(vsnip-expand)\" : \"<C-j>\"')
    --vim.cmd('smap <expr> <Tab> vsnip#expandable()  ? \"<Plug>(vsnip-expand)\" : \"<C-j>\"')

    --Expand or jump
    vim.cmd('imap <expr> <C-l> vsnip#available(1) ? \"<Plug>(vsnip-expand-or-jump)\" : \"<C-l>\"')
    vim.cmd('smap <expr> <C-l> vsnip#available(1) ? \"<Plug>(vsnip-expand-or-jump)\" : \"<C-l>\"')

    --Jump forward or backward
    --vim.cmd('imap <expr> <C-j> vsnip#jumpable(1) ? \"<Plug>(vsnip-jump-next)\" : \"<Tab>\"')
    --vim.cmd('smap <expr> <C-j> vsnip#jumpable(1)  ? \"<Plug>(vsnip-jump-next)\" : \"<Tab>\"')
    --vim.cmd('imap <expr> <C-k> vsnip#jumpable(-1) ? \"<Plug>(vsnip-jump-prev)\" : \"<S-Tab>\"')
    --vim.cmd('smap <expr> <C-k> vsnip#jumpable(-1) ? \"<Plug>(vsnip-jump-prev)\" : \"<S-Tab>\"')

    --Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
    --See https://github.com/hrsh7th/vim-vsnip/pull/50
    vim.cmd('nmap <leader>s <Plug>(vsnip-select-text)')
    vim.cmd('xmap <leader>s <Plug>(vsnip-select-text')
    vim.cmd('nmap <leader>S <Plug>(vsnip-cut-text)')
    vim.cmd('xmap <leader>S <Plug>(vsnip-cut-text)')
end



