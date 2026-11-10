local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { { src = gh 'olimorris/codecompanion.nvim', version = vim.version.range '19.*' } }
require('codecompanion').setup {
  opts = {
    interactions = {
      chat = {
        adapter = {
          name = 'ollama',
          model = 'gemma4:12b ',
        },
      },
      inline = {
        adapter = {
          name = 'ollama',
          model = 'gemma4:12b',
        },
      },
      tools = { opts = { default_tools = { 'files' } } },
    },
    http = {
      ollama = function()
        local ollama = require 'codecompanion.adapters.http.ollama'
        local adapter_utils = require 'codecompanion.adapters.utils'

        return require('codecompanion.adapters').extend('ollama', {
          handlers = {
            form_messages = function(self, messages) return ollama.handlers.form_messages(self, adapter_utils.merge_system_messages(messages)) end,
          },
          schema = {
            num_ctx = {
              default = 32768,
            },
            think = {
              default = true,
            },
            keep_alive = {
              default = '30m',
            },
          },
        })
      end,
    },
  },
}
