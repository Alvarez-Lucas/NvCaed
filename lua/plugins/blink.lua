return {
  version = 'v0.*', -- use a release tag to download pre-built binaries
  'saghen/blink.cmp',
  -- lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  -- dependencies = 'rafamadriz/friendly-snippets',
  event = { "InsertEnter" },
  dependencies = {
    'garymjr/nvim-snippets',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = { create_cmp_source = false, friendly_snippets = true },
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = 'normal',                    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    accept = { auto_brackets = { enabled = true } }, -- experimental auto-brackets support
    trigger = {                                      -- experimental signature help support
      completion = {
        blocked_trigger_characters = { ' ', '\n', '\t', "{", "," }
      },
      signature_help = { enabled = true } -- TODO: Find better plugin for this?
    },
    keymap = {
      show = '<C-@>', -- Windows Terminal binding for control space
      hide = '<C-e>',
      accept = '<enter>',
      select_prev = { '<Up>', '<C-p>' },
      select_next = { '<Down>', '<C-n>' },

      show_documentation = '<C-@>',
      hide_documentation = '<C-@>',
      scroll_documentation_up = '<C-b>',
      scroll_documentation_down = '<C-f>',

      snippet_forward = '<Tab>',
      snippet_backward = '<S-Tab>',
    },
  }
}
