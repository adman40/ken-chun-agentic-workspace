local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ── Palette ─────────────────────────────────────────────
local c = {
  bg = "#171009", -- charred espresso (burnt orange, literally burnt)
  fg = "#F2E8DA", -- limestone, like the Tower
  burnt = "#BF5700", -- official UT burnt orange
  ember = "#FF8200", -- bright accent
  gold = "#E8A33D",
  dim = "#8A7462",
  cream = "#FFF6E8",
}

config.color_schemes = {
  ["Longhorn Night"] = {
    foreground = c.fg,
    background = c.bg,

    cursor_bg = c.ember,
    cursor_fg = c.bg,
    cursor_border = c.ember,

    selection_bg = c.burnt,
    selection_fg = c.cream,

    split = c.burnt,
    scrollbar_thumb = c.burnt,

    -- warm, muted palette that harmonizes instead of clashing
    ansi = {
      "#2B1D10", -- black
      "#E15F44", -- red: terracotta
      "#9DB17C", -- green: sage
      c.gold,    -- yellow: gold
      "#7E9CB9", -- blue: dusty slate
      "#C4849C", -- magenta: rose clay
      "#7FB5A5", -- cyan: patina
      "#D8C9B4", -- white: limestone
    },
    brights = {
      "#5C4936",
      "#FF7A5C",
      "#BCD39A",
      "#FFB84D",
      "#A5C6E8",
      "#E8A6BE",
      "#9FD9C6",
      c.cream,
    },

    tab_bar = {
      background = "#100B06",
      active_tab = { bg_color = c.burnt, fg_color = c.cream, intensity = "Bold" },
      inactive_tab = { bg_color = "#241708", fg_color = c.dim },
      inactive_tab_hover = { bg_color = "#3A2410", fg_color = c.fg },
      new_tab = { bg_color = "#100B06", fg_color = c.dim },
      new_tab_hover = { bg_color = c.burnt, fg_color = c.cream },
    },
  },
}
config.color_scheme = "Longhorn Night"

-- ── Layout polish ───────────────────────────────────────
config.window_background_gradient = {
  orientation = "Vertical",
  colors = { "#1C1207", "#120C06" },
}
config.window_padding = { left = 14, right = 14, top = 12, bottom = 8 }
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = { saturation = 0.85, brightness = 0.6 }

config.default_cursor_style = "SteadyBlock"

-- horns on the active tab
wezterm.on("format-tab-title", function(tab)
  local icon = tab.is_active and "\u{1F918} " or ""
  return " " .. icon .. tab.active_pane.title .. " "
end)

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.window_background_opacity = 0.9
config.macos_window_background_blur = 75
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"



return config
