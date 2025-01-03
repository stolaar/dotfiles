-- return {
--   'projekt0n/github-nvim-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     vim.cmd('colorscheme github_dark_default')
--   end,
-- }
--
--
local themes = {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        dark_variant = "main",
        variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,        -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          transparency = true,
        },

      })

      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 1000,

    config = function()
      require('github-theme').setup({})
      vim.cmd('colorscheme github_dark_default')
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load({
        cursorline = {
          theme = "dark",
        },
        telescope = {
          style = "classic",
        },
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "mocha",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false,   -- shows the '~' characters after the end of buffers
        term_colors = false,          -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = true,            -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.25,          -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,            -- Force no italic
        no_bold = false,              -- Force no bold
        no_underline = false,         -- Force no underline
        styles = {                    -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },    -- Change the style of comments
          conditionals = { "italic" },
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          mason = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          alpha = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      vim.cmd('colorscheme catppuccin')
    end,
    priority = 1000
  }
}
return themes[5]
