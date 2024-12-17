return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  cmd = "Leet",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration goes here
    lang = "golang",
    description = {
      position = "right", ---@type lc.position

      width = "40%", ---@type lc.size

      show_stats = true, ---@type boolean
    },
    plugins = {
      non_standalone = true,
    },
    storage = {
      home = "~/codes/leetcode/",
      cache = "~/codes/leetcode/.cache/",
    },
    ---@type boolean
    image_support = true,
  },
}
