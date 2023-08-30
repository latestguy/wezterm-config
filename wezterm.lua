-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local dimmer = { brightness = 0.1 }

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
config.colors = {
  scrollbar_thumb = 'white',
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.color_scheme = "cyberpunk"

-- config.font = wezterm.font("JetBrains Mono")
config.font =  wezterm.font_with_fallback({
        "JetBrains Mono",
        "DroidSansMono Nerd Font",
        "FiraCode Nerd Font",
        "Noto Sans CJK SC",
        "DejaVu Sans Mono",
        "Noto Sans Symbols2",
        "Noto Serif Grantha",
        "Noto Sans Gujarati UI",
})
warn_about_missing_glyphs = false

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.scrollback_lines = 100000

config.keys = {
	{
		key = "LeftArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "W",
		mods = "CTRL|SHIFT",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "LeftArrow",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Left", 2 }),
	},
	{
		key = "RightArrow",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Right", 2 }),
	},
	{
		key = "UpArrow",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Up", 2 }),
	},
	{
		key = "DownArrow",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Down", 2 }),
	},
	{ key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
}

-- CTRL+ALT + number to activate that tab
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab
	--	table.insert(config.keys, {
	--		key = "F" .. tostring(i),
	--		action = act.ActivateTab(i - 1),
	--	})
end

-- config.background = {
--   -- This is the deepest/back-most layer. It will be rendered first
--   {
--     source = {
--       File = '/home/public/opt/Alien_Ship_bg_vert_images/Backgrounds/spaceship_bg_2.png',
--     },
--     -- The texture tiles vertically but not horizontally.
--     -- When we repeat it, mirror it so that it appears "more seamless".
--     -- An alternative to this is to set `width = "100%"` and have
--     -- it stretch across the display
--     repeat_x = 'Mirror',
--     hsb = dimmer,
--     -- When the viewport scrolls, move this layer 10% of the number of
--     -- pixels moved by the main viewport. This makes it appear to be
--     -- further behind the text.
--     attachment = { Parallax = 0.1 },
--   },
--   -- Subsequent layers are rendered over the top of each other
--   {
--     source = {
--       File = '/home/public/opt/Alien_Ship_bg_vert_images/Overlays/overlay_1_spines@2x.png',
--     },
--     width = '100%',
--     repeat_x = 'NoRepeat',

--     -- position the spins starting at the bottom, and repeating every
--     -- two screens.
--     vertical_align = 'Bottom',
--     repeat_y_size = '200%',
--     hsb = dimmer,

--     -- The parallax factor is higher than the background layer, so this
--     -- one will appear to be closer when we scroll
--     attachment = { Parallax = 0.2 },
--   },
--   {
--     source = {
--       File = '/home/public/opt/Alien_Ship_bg_vert_images/Overlays/overlay_2_alienball@2x.png',
--     },
--     width = '100%',
--     repeat_x = 'NoRepeat',

--     -- start at 10% of the screen and repeat every 2 screens
--     vertical_offset = '10%',
--     repeat_y_size = '200%',
--     hsb = dimmer,
--     attachment = { Parallax = 0.3 },
--   },
--   {
--     source = {
--       File = '/home/public/opt/Alien_Ship_bg_vert_images/Overlays/overlay_3_lobster@2x.png',
--     },
--     width = '100%',
--     repeat_x = 'NoRepeat',

--     vertical_offset = '30%',
--     repeat_y_size = '200%',
--     hsb = dimmer,
--     attachment = { Parallax = 0.4 },
--   },
--   {
--     source = {
--       File = '/home/public/opt/Alien_Ship_bg_vert_images/Overlays/overlay_4_spiderlegs@2x.png',
--     },
--     width = '100%',
--     repeat_x = 'NoRepeat',

--     vertical_offset = '50%',
--     repeat_y_size = '150%',
--     hsb = dimmer,
--     attachment = { Parallax = 0.5 },
--   },
-- }

-- and finally, return the configuration to wezterm
return config
