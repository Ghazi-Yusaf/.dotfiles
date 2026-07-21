-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Set initial window size
config.initial_cols = 232
config.initial_rows = 66

-- Set window padding (scrollbar size will be equal to right padding)
config.window_padding = {
  left = '0.5cell',
  right = '1.5cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

-- Set color scheme
config.color_scheme = 'Catppuccin Frappe'

-- Set font
config.font = wezterm.font 'JuliaMono Nerd Font'

-- Remove title bar but keep integrated buttons and resize border
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

-- Enable scroll bar
config.enable_scroll_bar = true

-- Number of lines to keep in scrollback buffer
config.scrollback_lines = 10000

-- Set cursor style to blinking bar
config.default_cursor_style = 'BlinkingBar'

-- Set cursor thickness
config.cursor_thickness = 2

-- Set default working directory for new tabs and windows
config.default_cwd = wezterm.home_dir .. '/Developer'

-- Never show the pop-up to confirm closing windows
config.window_close_confirmation = 'NeverPrompt'

-- Keybindings
config.keys = {
  -- ⌘← (Command + Left): Send ^A (Ctrl+A) (Move to beginning of line)
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.SendKey{ key = "a", mods = "CTRL" },
  },
  -- ⌘→ (Command + Right): Send ^E (Ctrl+E) (Move to end of line)
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.SendKey{ key = "e", mods = "CTRL" },
  },
  -- ⌥← (Option + Left): Send ^[ b (ESC b) (Move to previous word)
  {
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action.SendKey{ key = "b", mods = "ALT" },
  },
  -- ⌥→ (Option + Right): Send ^[ f (ESC f) (Move to next word)
  {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action.SendKey{ key = "f", mods = "ALT" },
  },
  -- ⌘󰁮 (Command + Backspace): Send Hex Codes: 0x15 (Ctrl+U) (Delete current line)
  {
    key = "Backspace",
    mods = "CMD",
    action = wezterm.action.SendString("\x15"),
  },
  -- ⌥󰁮 (Option + Backspace): Send Hex Codes: 0x1b 0x7f (Delete last word)
  {
    key = "Backspace",
    mods = "OPT",
    action = wezterm.action.SendString("\x1b\x7f"),
  },
  -- ⌥Del (Option + Delete): Send ^[ d (ESC d) (delete next word)
  {
    key = "Delete",
    mods = "OPT",
    action = wezterm.action.SendKey{ key = "d", mods = "ALT" },
  },
}

-- Finally, return the configuration to wezterm
return config
