local wez = require "wezterm"
local utils = require "lua.utils"
local appearance = require "lua.appearance"
local mappings = require "lua.mappings"
local bar = wez.plugin.require "https://github.com/adriankarlen/bar.wezterm"

local platform = utils.platform()
local c = {}

if wez.config_builder then
  c = wez.config_builder()
end

-- General configurations
c.font = wez.font("SF Mono", { weight = "Medium" })
c.font_rules = {
  {
    italic = true,
    font = wez.font("SF Mono", { weight = "Medium", italic = true }),
  },
}
c.font_size = 13
c.command_palette_font_size = 13
c.command_palette_rows = 15
c.default_prog = platform.is_win and { "pwsh", "-NoLogo" } or "zsh"
c.adjust_window_size_when_changing_font_size = false
c.audible_bell = "Disabled"
c.scrollback_lines = 3000
c.default_workspace = "main"
c.max_fps = 240

-- appearance
appearance.apply_to_config(c)

-- keys
mappings.apply_to_config(c)

-- bar
bar.apply_to_config(c, {
  modules = {
    clock = {
      enabled = false,
    },
    username = {
      icon = "",
    },
    spotify = {
      enabled = true,
    },
  },
})

return c
