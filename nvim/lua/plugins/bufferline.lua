return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")

    vim.opt.termguicolors = true
    bufferline.setup({
      options = {
        themable = true,
        separator_style = "thick",
        color_icons = true,
        diagnostics = "nvim_lsp",
        custom_filter = function(buff)
          local filetype = vim.bo[buff].filetype
          return filetype ~= "" and filetype ~= "qf"
        end
      }
    })
    -- local mocha = require("catppuccin.palettes").get_palette "mocha"

    -- bufferline.setup({
    --   highlights = require("catppuccin.groups.integrations.bufferline").get {
    --     styles = { "italic", "bold" },
    --     custom = {
    --       all = {
    --         fill = { bg = "#000000" },
    --       },
    --       mocha = {
    --         background = { fg = mocha.text },
    --       },
    --       latte = {
    --         background = { fg = "#000000" },
    --       },
    --     },
    --   },
    --   options = {
    --     themable = true,
    --     separator_style = "thick",
    --     color_icons = true,
    --     diagnostics = "nvim_lsp",
    --     custom_filter = function(buff)
    --       local filetype = vim.bo[buff].filetype
    --       return filetype ~= "" and filetype ~= "qf"
    --     end
    --   }
    -- })
  end,

}
