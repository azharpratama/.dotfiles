-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'Catppuccin Macchiato'
config.enable_tab_bar = false
config.font_size = 14
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.macos_window_background_blur = 20
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.front_end = 'OpenGL'
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.cell_width = 0.9
config.freetype_load_flags = 'NO_HINTING'

-- and finally, return the configuration to wezterm
return config
