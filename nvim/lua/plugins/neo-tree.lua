return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    default_component_configs = {
      indent = {
        indent_marker = "|",
        indent_size = 2,
        padding = 0,
      }
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
    window = {
      mappings = {
        ["c"] = {
          "copy",
          config = {
            show_path = "relative" -- "none", "relative", "absolute"
          }
        }
      }
    }
  }
}
