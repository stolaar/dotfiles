return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        local dashboard = require('alpha.themes.dashboard')
        local alpha = require("alpha")
        dashboard.section.header.val = require("utils.alpha-header")

        alpha.setup(dashboard.config)
      end
}
