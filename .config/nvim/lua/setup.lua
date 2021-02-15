local cmd = vim.cmd

local function set(scope, key, value)
	local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
	scopes['o'][key] = value
	scopes[scope][key] = value
end

cmd('filetype plugin on')

cmd('colo gruvbox-material')
cmd("let g:gruvbox_material_background = 'hard'")
cmd('let g:gruvbox_material_enable_italic = 1')
cmd('let g:gruvbox_material_transparent_background = 1')
cmd('let g:lightline = { "colorscheme" : "gruvbox_material"}')

--[[cmd('colo serenade')
cmd('let g:serenade_enable_italic = 1')
cmd('let g:serenade_transparent_background = 1')
cmd('let g:lightline = { "colorscheme" : "serenade"}')]]--
--set('o', 'background','light')
set('o', 'errorbells', false)
set('o', 'smartcase', true)
set('o', 'incsearch', true)
set('o', 'undofile', true)
set('o', 'undodir', '/home/sadboy/.vim/undodir')
set('o', 'hidden', true)
set('o', 'updatetime', 300)
set('o', 'backup', false)
set('o', 'writebackup', false)
set('o','completeopt','menuone,noinsert')
set('o', 'termguicolors', true)

local indent = 4
set('b', 'swapfile', false)
set('b', 'smartindent', true)
set('b', 'expandtab', true)
set('b', 'shiftwidth', indent)
set('b', 'autoindent', true)
set('b', 'softtabstop', indent)

set('w', 'wrap', false)
set('w', 'signcolumn', 'yes')

set('w', 'relativenumber', true)
set('w', 'wrap', false)

vim.o.shortmess = vim.o.shortmess .. 'c'

--TODO: Dispatch mvn exec:java -Dexec.mainClass=""
function mvncompile()
    vim.cmd('Dispatch mvn clean compile')
end



