local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { gh 'danymat/neogen' }
require('neogen').setup {
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup {
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = 'numpydoc',
            },
          },
        },
      }
    end,
  },
}
