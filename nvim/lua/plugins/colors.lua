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
          percentage = 0.35,          -- percentage of the shade to apply to the inactive window
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          mason = true,
          dashboard = true,
          neotree = true,
          treesitter = true,
          telescope = true,
          harpoon = true,
          alpha = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      vim.cmd('colorscheme catppuccin-mocha')
    end,
    priority = 1000
  }
}

return themes[5]
