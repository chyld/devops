local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 12
config.color_scheme = "cyberpunk"
config.default_prog = { "bash" }
config.window_decorations = "RESIZE"
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- New tab (spawns in the default domain)
	{ key = "n", mods = "LEADER", action = wezterm.action.SpawnTab("DefaultDomain") },
	-- Previous tab
	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	-- Next tab
	{ key = "]", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	-- Split pane horizontally (default uses CurrentPaneDomain, so {} is fine)
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitHorizontal({}) },
	-- Split pane vertically (default uses CurrentPaneDomain, so {} is fine)
	{ key = "|", mods = "LEADER|SHIFT", action = wezterm.action.SplitVertical({}) },
}
return config
