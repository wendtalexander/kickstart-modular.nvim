local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { { src = gh 'alexghergh/nvim-tmux-navigation' } }
require('nvim-tmux-navigation').setup {
  disable_when_zoomed = true, -- defaults to false
  keybindings = {
    left = '<C-h>',
    down = '<C-j>',
    up = '<C-k>',
    right = '<C-l>',
    last_active = '<C-\\>',
    next = '<C-Space>',
  },
}
