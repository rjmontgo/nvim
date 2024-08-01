--
local ls = require('luasnip')
local map = vim.keymap.set

map({ 'i', 's' }, '<C-S>', function() ls.jump(1) end, {silent = true})
map({ 'i', 's' }, '<C-D>', function() ls.jump(-1) end, {silent = true})

require('luasnip.loaders.from_snipmate').load({ paths = { "~/.config/nvim/snippets" }})
