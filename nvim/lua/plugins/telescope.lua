return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { {
    "isak102/telescope-git-file-history.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tpope/vim-fugitive"
    }
  }, { 'nvim-lua/plenary.nvim', 'tpope/vim-fugitive' } },
  config = function()
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
      },
    })
    require("telescope").load_extension("git_file_history")

    vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', "<leader>pa", builtin.live_grep, {})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    vim.keymap.set('n', '<S-x>', "<cmd>Telescope commands<CR>")
  end
}
