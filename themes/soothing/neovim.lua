return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    opts = {
      style = "night",
      on_colors = function(colors)
        colors.bg = "#0d0b0f"
        colors.bg_dark = "#0d0b0f"
        colors.bg_float = "#0d0b0f"
        colors.bg_sidebar = "#0d0b0f"
        colors.fg = "#82a7b8"
        colors.fg_dark = "#626f7d"
        colors.red = "#b16e6c"
        colors.orange = "#daa28a"
        colors.yellow = "#e8b89e"
        colors.green = "#7f9097"
        colors.cyan = "#82a7b8"
        colors.blue = "#3e7494"
        colors.magenta = "#c98a88"
        colors.purple = "#ad8280"
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
