" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/sadboy/.local/share/nvim/site/pack/packer/opt/packer.nvim"
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
      local prefix = vim.v.count and vim.v.count or ''
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
vim.o.runtimepath = vim.o.runtimepath .. ",/home/sadboy/.local/share/nvim/site/pack/packer/start/purify/vim"
-- Pre-load configuration
-- Post-load configuration
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\n+\0\2\6\1\1\0\6-\2\0\0009\2\0\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\0À\14on_attachµ\3\1\0\b\0\21\0&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0019\3\5\0035\5\6\0=\2\a\0055\6\b\0=\6\t\0055\6\v\0005\a\n\0=\a\f\6=\6\r\5B\3\2\0019\3\14\0019\3\5\0035\5\15\0=\2\a\0055\6\16\0=\6\t\5B\3\2\0019\3\17\0019\3\5\0035\5\18\0=\2\a\0055\6\19\0=\6\t\5B\3\2\0019\3\20\0019\3\5\0034\5\0\0B\3\2\0012\0\0€K\0\1\0\thtml\1\2\0\0\tjson\1\0\0\vjsonls\1\a\0\0\15javascript\20javascriptreact\19javascript.jsx\15typescript\20typescriptreact\19typescript.tsx\1\0\0\rtsserver\17init_options\rjvm_args\1\0\0\1\2\0\0007-javaagent:/home/sadboy/.install/lombok/lombok.jar\14filetypes\1\2\0\0\tjava\14on_attach\1\0\0\nsetup\njdtls\0\14lspconfig\15completion\frequire\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\nÜ\3\0\0\4\0\14\0\0296\0\0\0009\0\1\0004\1\4\0005\2\4\0005\3\3\0=\3\5\2>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\1=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\1\0)\1P\0=\1\t\0006\0\0\0009\0\n\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0005\1\r\0=\1\f\0K\0\1\0\1\0\f\nClass\3\5\rConstant\3\5\15Interfaces\3\5\vMethod\3\n\14Variables\3\a\vModule\3\a\rFunction\3\a\nField\3\5\tFile\3\0\fTabNine\3\0\fBuffers\3\1\fKeyword\3\4\30completion_items_priority,let g:completion_confirm_key = \"\\<C-y>\"\bcmd\27completion_timer_cycle$completion_matching_ignore_case\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\4\0\0\blsp\fsnippet\fbuffers#completion_chain_complete_list\6g\bvim\0")()
-- Config for: nvim-web-devicons
loadstring("\27LJ\2\nO\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\nâ\t\0\0\a\0-\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\b\4=\4\17\0035\4\18\0005\5\19\0=\5\b\4=\4\20\3=\3\21\0025\3\22\0005\4\23\0005\5\24\0005\6\25\0=\6\26\5=\5\b\4=\4\27\0035\4\28\0005\5\29\0=\5\30\0045\5\31\0=\5 \4=\4!\0035\4\"\0005\5#\0=\5$\0045\5%\0=\5&\0045\5'\0=\5(\0045\5)\0=\5*\4=\4+\3=\3,\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\1\venable\2\tswap\18swap_previous\1\0\1\15<leader>ah\21@parameter.inner\14swap_next\1\0\1\15<leader>al\21@parameter.inner\1\0\1\venable\2\vselect\aiF\1\0\4\6c$(function_definition) @function\bcpp$(function_definition) @function\tjava#(method_declaration) @function\vpython$(function_definition) @function\1\0\4\aif\20@function.inner\aic\17@class.inner\aac\17@class.outer\aaf\20@function.outer\1\0\1\venable\2\1\0\1\venable\2\rrefactor\15navigation\1\0\2\20goto_definition\15<leader>td\21list_definitions\15<leader>tl\1\0\1\venable\2\17smart_rename\1\0\1\17smart_rename\15<leader>tr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\2\26highlight_definitions\1\0\0\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\v<c-i>n\22scope_incremental\v<c-i>c\19init_selection\14<c-n>c-i>\21node_decremental\v<c-i>m\1\0\1\venable\2\14highlight\1\0\1\21ensure_installed\ball\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
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
