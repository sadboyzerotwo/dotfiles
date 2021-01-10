" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["completion-nvim"] = {
    after = { "vim-vsnip", "vim-vsnip-integ" },
    only_config = true,
    only_sequence = true
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/sadboy/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["vim-vsnip"] = {
    after = { "vim-vsnip-integ" },
    config = { "\27LJ\2\ng\0\0\4\0\a\0\v6\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0K\0\1\0\14/snippets\vconfig\fstdpath\afn\22vsnip_snippet_dir\6g\bvim\0" },
    load_after = {},
    loaded = false,
    only_sequence = true,
    only_setup = false,
    path = "/home/sadboy/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    load_after = {},
    loaded = false,
    only_sequence = true,
    only_setup = false,
    path = "/home/sadboy/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\n!\0\1\3\0\1\0\4'\1\0\0\18\2\0\0&\1\2\1L\1\2\0\14<Cmd>lua '\0\1\3\0\1\0\4'\1\0\0\18\2\0\0&\1\2\1L\1\2\0\20<Cmd>Telescope ›\b\1\2\n\2\20\0&-\2\0\0009\2\0\2\18\4\0\0\18\5\1\0B\2\3\0015\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\0025\3\6\0=\3\a\2-\3\1\0009\3\b\3\18\5\2\0+\6\0\0003\a\t\0B\3\4\0016\3\n\0009\3\v\0039\3\f\3)\5\0\0'\6\3\0'\a\r\0'\b\14\0005\t\15\0B\3\6\0015\3\17\0005\4\16\0=\4\3\3-\4\1\0009\4\b\4\18\6\3\0-\a\1\0009\a\18\a3\b\19\0B\4\4\1K\0\1\0\0À\2À\0\22leader_key_mapper\1\0\0\1\0\5\alW\26lsp_workspace_symbols\alt\15treesitter\alw\25lsp_document_symbols\alr\19lsp_references\al.\21lsp_code_actions\1\0\1\fnoremap\2+<Cmd>lua vim.lsp.buf.code_action()<CR>\14<leader>a\24nvim_buf_set_keymap\bapi\bvim\0\19set_buf_keymap\6i\1\0\1\n<c-k>!vim.lsp.buf.signature_help()\6v\1\0\1\15<leader>lf#vim.lsp.buf.range_formatting()\6n\1\0\0\1\0\16\agW#vim.lsp.buf.workspace_symbol()\agi!vim.lsp.buf.implementation()\6K\24vim.lsp.buf.hover()\agD\30vim.lsp.buf.declaration()\n<c-k>!vim.lsp.buf.signature_help()\agd\29vim.lsp.buf.definition()\15<leader>lR\25vim.lsp.buf.rename()\14<leader>;#vim.lsp.diagnostic.goto_next()\15<leader>lf#vim.lsp.buf.range_formatting()\14<leader>,#vim.lsp.diagnostic.goto_prev()\15<leader>lF\"vim.lsp.buf.code_formatting()\ag0\"vim.lsp.buf.document_symbol()\15<leader>l.\30vim.lsp.buf.code_action()\agr\29vim.lsp.buf.references()\15<leader>el%vim.lsp.diagnostic.set_loclist()\agI\"vim.lsp.buf.type_definition()\14on_attachü\1\1\0\n\0\17\0\0266\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0023\3\4\0009\4\5\0019\4\6\0045\6\b\0005\a\a\0=\a\t\6=\3\n\0065\a\v\0=\a\f\0069\a\r\0019\a\14\a'\t\15\0B\a\2\2=\a\16\6B\4\2\0012\0\0€K\0\1\0\rroot_dir\fpom.xml\17root_pattern\tutil\14filetypes\1\2\0\0\tjava\14on_attach\bcmd\1\0\0\1\2\0\0\16java-lsp.sh\nsetup\njdtls\0\16plugs.utils\14lspconfig\15completion\frequire\0")()
-- Config for: vim-sneak
loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26let g:sneak#label = 1\bcmd\bvim\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\nŠ\2\0\0\4\0\v\0\0216\0\0\0009\0\1\0004\1\4\0005\2\4\0005\3\3\0=\3\5\2>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\1=\1\2\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0K\0\1\0$completion_matching_ignore_case\14vim-vsnip\30completion_enable_snippet\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\4\0\0\blsp\fsnippet\fbuffers#completion_chain_complete_list\6g\bvim\0")()
-- Config for: nvim-web-devicons
loadstring("\27LJ\2\nO\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Config for: vimwiki
loadstring("\27LJ\2\n»\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0‰\2            let wiki = {}\n            let wiki.path = '~/.vimwiki'\n            let wiki.nested_syntaxes = {'javascript': 'javascript', 'typescript':'typescript', 'python': 'python', 'c++': 'cpp', 'java': 'java'}\n            let g:vimwiki_list = [wiki]\n        \14nvim_exec\bapi\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\n½\t\0\0\a\0,\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\15\4=\4\19\3=\3\20\0025\3\21\0005\4\22\0005\5\23\0005\6\24\0=\6\25\5=\5\15\4=\4\26\0035\4\27\0005\5\28\0=\5\29\0045\5\30\0=\5\31\4=\4 \0035\4!\0005\5\"\0=\5#\0045\5$\0=\5%\0045\5&\0=\5'\0045\5(\0=\5)\4=\4*\3=\3+\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\1\venable\2\tswap\18swap_previous\1\0\1\15<leader>ah\21@parameter.inner\14swap_next\1\0\1\15<leader>al\21@parameter.inner\1\0\1\venable\2\vselect\aiF\1\0\4\tjava#(method_declaration) @function\vpython$(function_definition) @function\6c$(function_definition) @function\bcpp$(function_definition) @function\1\0\4\aaf\20@function.outer\aic\17@class.inner\aac\17@class.outer\aif\20@function.inner\1\0\1\venable\2\1\0\1\venable\2\rrefactor\15navigation\1\0\5\25list_definitions_toc\agO\24goto_previous_usage\n<a-#>\21list_definitions\15<leader>tD\20goto_definition\15<leader>td\20goto_next_usage\n<a-*>\1\0\1\venable\2\17smart_rename\fkeymaps\1\0\1\17smart_rename\15<leader>tr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\1\venable\2\26incremental_selection\1\0\1\venable\2\14highlight\1\0\1\21ensure_installed\ball\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
vim.cmd [[ packadd vim-vsnip ]]

-- Config for: vim-vsnip
loadstring("\27LJ\2\ng\0\0\4\0\a\0\v6\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0K\0\1\0\14/snippets\vconfig\fstdpath\afn\22vsnip_snippet_dir\6g\bvim\0")()

vim.cmd [[ packadd vim-vsnip-integ ]]
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
augroup END
