local g =  vim.g
g.mapleader = ' '
g.syntax_on = true

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then for k, v in pairs(opts) do options[k] = v end end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--window navigation
map('n', '<leader>wl','<cmd>wincmd l<CR>')
map('n', '<leader>wj','<cmd>wincmd j<CR>')
map('n', '<leader>wk','<cmd>wincmd k<CR>')
map('n', '<leader>wh','<cmd>wincmd h<CR>')

--saving file
map('n', '<leader>sf', '<cmd>w<cr>')
map('n', '<leader>sa', '<cmd>wa<cr>')

--buffers
map('n', '<leader>bl', '<cmd>Buffers<cr>')

map('n', '<leader>oc', '<cmd>e $MYVIMRC<cr>')

--[[
    vim.fn.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>ge", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<a-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
--]]

--lsp
map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

map('n', '<a-.>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<leader>ge', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

--TODO declaration-
--TODO implementation
--TODO signature help
--TODO type definition
--TODO workspace_symbol
--TODO omni funct


map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')



