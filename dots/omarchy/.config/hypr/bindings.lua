-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Vista plugin
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + SHIFT + TAB")
o.bind("SUPER + TAB", "Vista: next workspace", hl.dsp.global("chyld-vista:next"), { repeating = true })
o.bind("SUPER + SHIFT + TAB", "Vista: previous workspace", hl.dsp.global("chyld-vista:prev"), { repeating = true })
hl.layer_rule({ match = { namespace = "chyld-vista" }, no_anim = true })

-- Lock screen
hl.unbind("SUPER + SHIFT + L")
o.bind("SUPER + SHIFT + L", "Lock screen explorer", "omarchy-shell lock explore")

-- Open a new Void directory in a kitty window.
hl.unbind("SUPER + SHIFT + RETURN")
o.bind("SUPER + SHIFT + RETURN", "Kitty in new Void directory", "~/Scripts/kitty-void")

-- Open a new Void directory in a Herdr session
hl.unbind("SUPER + RETURN")
o.bind("SUPER + RETURN", "Herdr in new Void directory", "kitty --title herdr -e ~/Scripts/herdr-void")

