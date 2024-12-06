local wez = require "wezterm"

local M = {}

M.apply_to_config = function(c)
  c.color_scheme = "rose-pine-moon"
  local scheme = wez.color.get_builtin_schemes()[c.color_scheme]

  -- swap green and blue to match correct theme
  local ansi = scheme.ansi
  ansi[3] = "#3e8fb0"
  ansi[5] = "#9ccfd8"

  local brights = scheme.brights
  brights[3] = "#3e8fb0"
  brights[5] = "#9ccfd8"

  c.colors = {
    tab_bar = {
      active_tab = {
        fg_color = ansi[4],
        bg_color = "#2a273f",
      },
      inactive_tab = {
        fg_color = ansi[6],
        bg_color = "#2a273f",
      },
    },
    cursor_bg = "#56526e",
    cursor_border = "#56526e",
    cursor_fg = scheme.foreground,
    selection_bg = "#44415a",
    split = scheme.ansi[7],
    ansi = ansi,
    brights = brights,
    compose_cursor = scheme.ansi[2]
  }
  c.command_palette_bg_color = "#393552"
  c.command_palette_fg_color = scheme.foreground
  c.inactive_pane_hsb = { brightness = 0.9 }
  c.window_padding = { left = "1cell", right = "1cell", top = 0, bottom = 0 }
  c.window_decorations = "RESIZE"
  c.show_new_tab_button_in_tab_bar = false
end

return M
