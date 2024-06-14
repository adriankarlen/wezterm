local wez = require("wezterm")
local utils = require("lua.utils")

local appearance = require("lua.appearance")
local bar = wez.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local mappings = require("lua.mappings")

local c = {}

if wez.config_builder then
  c = wez.config_builder()
end

-- General configurations
c.font = wez.font("Cartograph CF")
c.font_rules = {
  {
    italic = true,
    intensity = "Half",
    font = wez.font("Cartograph CF", { weight = "Regular", italic = true }),
  },
}
c.font_size = 12
c.default_prog = utils.is_windows and { "pwsh", "-NoLogo" } or "zsh"
c.adjust_window_size_when_changing_font_size = false
c.audible_bell = "Disabled"
c.scrollback_lines = 3000
c.default_workspace = "main"
c.status_update_interval = 2000

-- appearance
appearance.apply_to_config(c)

-- keys
mappings.apply_to_config(c)

-- bar
bar.apply_to_config(c, { enabled_modules = { hostname = false } })

return c
