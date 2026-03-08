return {
  "milanglacier/minuet-ai.nvim",
  config = function()
    require('minuet').setup {
      virtualtext = {
        keymap = {
          accept = "<C-l>",
          prev = "<A-[>",
          next = "<A-]>",
        },
      },
      provider = "openai_compatible",
      request_timeout = 2.5,
      throttle = 1500,
      debounce = 600,
      provider_options = {
        openai_compatible = {
          api_key = 'OPENROUTER_API_KEY',
          end_point = 'https://openrouter.ai/api/v1/chat/completions',
          model = 'moonshotai/kimi-k2',
          name = 'Openrouter',
          optional = {
            max_tokens = 56,
            top_p = 0.9,
            provider = {
              sort = 'throughput',
            },
          },
        },
      },
    }
  end,
}
