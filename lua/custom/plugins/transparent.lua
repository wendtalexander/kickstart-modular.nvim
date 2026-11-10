local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { { src = gh 'xiyaowong/transparent.nvim' } }
require('transparent').setup {}
