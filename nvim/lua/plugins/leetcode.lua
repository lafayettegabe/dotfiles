return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    lang = "golang",
    description = {
      position = "right", ---@type lc.position

      width = "40%", ---@type lc.size

      wrap_text = true, -- Ensure text wraps within the given width
      show_stats = true, ---@type boolean
    },
    plugins = {
      non_standalone = true,
    },
    storage = {
      home = "/home/gabe/Documents/codes/study/leetcode",
      cache = "/home/gabe/Documents/codes/study/leetcode/.cache/",
    },
    ---@type boolean
    --- image_support = true,
  },
}
