-- Pull in the wezterm API
local wezterm = require 'wezterm'

local dark_mode = true
local font = wezterm.font_with_fallback{ 'Inconsolata', 'LXGW WenKai' }

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = font

if dark_mode then
else
   config.color_scheme = 'Pro Light'
end

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.use_fancy_tab_bar = true
-- config.enable_wayland = true

return config
