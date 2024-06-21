return {
  "giusgad/pets.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
  config = function ()
    local pets = require("pets")
    pets.setup({})

  end
}
