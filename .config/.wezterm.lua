-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Banana Blueberry'
-- config.color_scheme = 'Belge (terminal.sexy)'

-- Fonts
config.font = wezterm.font_with_fallback {
     {
    family = 'Berkeley Mono',
    weight = 'Medium',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  {
    family = 'JetBrains Mono',
    weight = 'Medium',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  { family = 'Terminus', weight = 'Bold' },
  'Noto Color Emoji',
}

--[[ config.font = wezterm.font_with_fallback {
    'Berkeley Mono', 'JetBrains Mono', 'Noto Color Emoji'
} ]]

-- and finally, return the configuration to wezterm
return config
