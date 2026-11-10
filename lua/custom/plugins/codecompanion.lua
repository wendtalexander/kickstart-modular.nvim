return {
  'olimorris/codecompanion.nvim',
  version = '^19.0.0',
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
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
