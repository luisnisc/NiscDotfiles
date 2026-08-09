local vars = require("variables")

hl.on("hyprland.start", function ()
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("waybar & waypaper --restore")
  hl.exec_cmd("ags run")

  hl.exec_cmd("fcitx5 -d")


 end)


------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@240",
    position = "1921x0",
    scale    = "auto",
})

hl.monitor({
    output   = "HDMI-A-1",
    mode   = "1920x1080@60",
    position = "0x0",
    scale   = "auto"
})

hl.monitor({
    output = "DP-3",
    mode   = "1920x1080@144",
    position = "auto",
    scale   = "auto"

})

hl.monitor({
    output = "eDP-1",
    mode   = "1920x1200@60",
    position = "auto",
    scale = "1"
})





-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")



-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful




--Configs

require('hyprland.keybinds')
require('hyprland.animations')
require('hyprland.decorations')
require('hyprland.env')
require('hyprland.execs')
require('hyprland.functions')
require('hyprland.general')
require('hyprland.group')
require('hyprland.input')
require('hyprland.misc')
require('hyprland.rules')
