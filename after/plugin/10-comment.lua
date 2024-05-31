local comment = require('Comment')

comment.setup({
  padding = true,
  mappings = {
    basic = true,
    extended = true,
  },
  toggler = {
    line = 'gcc',
    block = 'gbc',
  },
  opleader = {
    line = 'gc',
    block = 'gb'
  }
})
