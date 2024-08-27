return {
  {
    'akinsho/git-conflict.nvim',
    version = "2.0.0",
    config = true,
  },
  {
    'yorickpeterse/nvim-pqf',
    version = "*",
    config = function ()
      local pqf = require("pqf")
      pqf.setup()
    end
  }
}
