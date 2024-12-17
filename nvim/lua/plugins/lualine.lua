return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- Define the colors
      local colors = {
        blue = "#80a0ff",
        violet = "#d183e8",
        black = "#080808",
        white = "#c6c6c6",
        grey = "#303030",
      }

      -- Define the Arch Linux icon
      local arch_icon = ""

      -- Define the custom theme
      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.white },
        },
        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.white },
        },
      }

      -- Helper function to display branch or fallback text
      local function branch_or_placeholder()
        -- First, try to use gitsigns (if available)
        local branch = vim.b.gitsigns_head
        -- If not available, fallback to using system Git
        if not branch or branch == "" then
          local git_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null")
          branch = vim.trim(git_branch) ~= "" and vim.trim(git_branch) or nil
        end
        -- If still no branch, fallback to "No Repo"
        return branch and branch ~= "" and branch or "No Repo"
      end

      -- Helper function to hide filename for NeoTree buffers
      local function hide_filename_if_neo_tree()
        local bufname = vim.api.nvim_buf_get_name(0)
        local ft = vim.bo.filetype
        if ft == "neo-tree" or bufname:find("neo%-tree") then
          return ""
        end
        return vim.fn.expand("%:t") -- Return the filename (only the tail)
      end

      -- Setup lualine
      return {
        options = {
          theme = bubbles_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
          always_divide_middle = true,
        },
        sections = {
          -- Left section: Mode
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },

          -- Left middle: Git branch or placeholder
          lualine_b = { { branch_or_placeholder, icon = "" } },

          -- Center: File name (filtered for NeoTree)
          lualine_c = {
            {
              hide_filename_if_neo_tree,
              path = 0, -- Only show filename (no path)
              symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]" },
            },
          },

          lualine_x = {
            {
              function()
                return arch_icon
              end,
              color = { fg = colors.blue }, -- Set the icon color to blue
              padding = { right = 2 }, -- Add some padding around the icon
            },
          },

          -- Right section: Progress and location
          lualine_y = { "progress" },
          lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
        },
        inactive_sections = {
          -- Only show the file name in inactive mode
          lualine_a = {},
          lualine_b = {},
          lualine_c = { hide_filename_if_neo_tree },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
