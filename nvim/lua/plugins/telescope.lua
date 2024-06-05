return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function ()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        git_files = {
          theme = "dropdown",
          previewer = false,
        },
      }
    })

    vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', "<leader>pa", builtin.live_grep, {})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

  end
}

