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
        separator_style = "slant",
        color_icons = true,
        diagnostics = "nvim_lsp",
        custom_filter = function(buff)
          local filetype = vim.bo[buff].filetype
          return filetype ~= "" and filetype ~= "qf"
        end
      }
    })
  end,

}
