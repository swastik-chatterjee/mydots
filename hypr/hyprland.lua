
------------------------------------------------------------------------------
-- 1. PROGRAMS
------------------------------------------------------------------------------
local mainMod = "SUPER"
local terminal = "ghostty"
local fileManager = "qtfm"
local launcher = "hyprlauncher"     -- replaces fuzzel
local locker = "hyprlock"           -- replaces gtklock
local netGui = "nmgui"
local powermenu = "wlogout"

------------------------------------------------------------------------------
-- 2. AUTOSTART & SERVICES
------------------------------------------------------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    -- badged is our polkit authentication agent (NOT hyprpolkitagent, which is
    -- also installed as part of the ecosystem but intentionally left unused
    -- here so we keep the same agent as the previous niri setup).
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("mako")             -- notification daemon
    hl.exec_cmd("waybar")           -- status bar
    hl.exec_cmd("hyprpaper")        -- wallpaper daemon, see hyprpaper.conf
    hl.exec_cmd("hypridle") 
end)

------------------------------------------------------------------------------
-- 3. ENVIRONMENT VARIABLES
------------------------------------------------------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "future-cyan-hyprcursor")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")       -- picked up by hyprland-qt-support

------------------------------------------------------------------------------
-- 4. INPUT
------------------------------------------------------------------------------
hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0.0,      -- mouse; matches niri's mouse accel-speed 0.0
        repeat_rate = 50,
        repeat_delay = 300,
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Rough analogue of niri's touchpad accel-speed 0.2 (per-device tuning may need
-- adjusting for your actual touchpad name -- see `hyprctl devices`).
hl.device({
    name = "touchpad",
    sensitivity = 0.2,
})

------------------------------------------------------------------------------
-- 5. LOOK & FEEL (gaps, border/focus-ring, 0.8 global opacity, rounding)
------------------------------------------------------------------------------
hl.config({
    general = {
        gaps_in = 12,
        gaps_out = 12,
        border_size = 2,
        col = {
            active_border = "rgba(00f5d4ff)",
            inactive_border = "rgba(1f1a24aa)",
        },
        layout = "dwindle",
        resize_on_border = false,
        allow_tearing = false,
    },
    decoration = {
        rounding = 12,
        rounding_power = 2,
        active_opacity = 0.8,     -- matches niri's global window-rule opacity 0.8
        inactive_opacity = 0.8,
        blur = {
            enabled = true,
            size = 4,
            passes = 1,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
})

------------------------------------------------------------------------------
-- 6. ANIMATIONS (spring curves, tuned to feel like niri's fast springs)
------------------------------------------------------------------------------
-- Hyprland springs are { mass, stiffness, dampening } rather than niri's
-- { damping-ratio, stiffness, epsilon }. Approximate conversion used here:
--   dampening ~= 2 * damping_ratio * sqrt(stiffness * mass)
hl.curve("niriStd",   { type = "spring", mass = 1, stiffness = 800,  dampening = 45 })  -- ratio 0.8
hl.curve("niriOpen",  { type = "spring", mass = 1, stiffness = 600,  dampening = 34 })  -- ratio 0.7
hl.curve("niriClose", { type = "spring", mass = 1, stiffness = 1000, dampening = 57 })  -- ratio 0.9
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })

hl.animation({ leaf = "workspaces",  enabled = true, speed = 4, spring = "niriStd" })
hl.animation({ leaf = "windows",     enabled = true, speed = 4, spring = "niriStd" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4, spring = "niriOpen" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3, spring = "niriClose" })
hl.animation({ leaf = "border",      enabled = true, speed = 4, spring = "niriStd" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3, bezier = "linear" })
hl.animation({ leaf = "layers",      enabled = true, speed = 4, spring = "niriStd" })

------------------------------------------------------------------------------
-- 7. GESTURES
------------------------------------------------------------------------------
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

------------------------------------------------------------------------------
-- 8. KEYBINDINGS
------------------------------------------------------------------------------
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- System launchers & utilities
hl.bind(mainMod .. " + SPACE",       hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + E",           hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + L",   hl.dsp.exec_cmd(locker))
hl.bind(mainMod .. " + N",           hl.dsp.exec_cmd(netGui))
hl.bind(mainMod .. " + ESCAPE",      hl.dsp.exec_cmd(powermenu))

-- Navigation (vim-style & arrows)
hl.bind(mainMod .. " + H",    hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L",    hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J",    hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Window movement / shifting
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Workspaces (1 - 5)
for i = 1, 5 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Sizing
hl.bind(mainMod .. " + R", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.center())

-- Floating & layout
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

-- Audio & media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })

-- Compositor commands
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + P", function()
    hl.timer(function()
        hl.dispatch(hl.dsp.dpms({ action = "off" }))
    end, { timeout = 0, type = "oneshot" })
end)

------------------------------------------------------------------------------
-- 9. RECENT WINDOWS (Alt+Tab)
------------------------------------------------------------------------------
hl.bind("ALT + Tab",         hl.dsp.window.cycle_next({}))
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ previous = true }))
