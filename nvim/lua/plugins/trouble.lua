return {
  'folke/trouble.nvim',
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
 --  config = function()
 --    require('trouble').setup {
 --      icons = false,
 --      -- your configuration comes here
 --      -- or leave it empty to use the default settings
 --      -- refer to the configuration section below
 --    }

 --    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
 --      { silent = true, noremap = true }
 --    )
 --  end
}
