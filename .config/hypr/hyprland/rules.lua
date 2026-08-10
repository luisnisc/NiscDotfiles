local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    match       = { class = "org.gnome.Calendar" },
    opacity     = "override 0.85 override 0.85 override",
    float       = true,
    center      = true,
    animation   = "slide",
    move        = { "(monitor_w * 0.5) - (window_w * 0.5)", "(monitor_h * 0.025) + 20" },
    workspace   = "special:calendar",
})

hl.window_rule({
    match       = { class = "org.pulseaudio.pavucontrol" },
    opacity     = "override 0.85 override 0.85 override",
    float       = true,
    animation   = "slidevert 100%",
    move        = { "1400", "40" },
    workspace   = "special:pulseaudio",
})
---
--- GAMING
---
hl.window_rule({ match = { class = "cs2" }, immediate = true })

---
---
---
hl.window_rule({ match = { focus = false }, opacity = 0.9 })

hl.window_rule({ match = { class = "waypaper" }, float = true, opacity = 1 })


hl.window_rule({ match = { class = "blueman-manager" }, float = true, opacity = 0.8 })


hl.window_rule({ match = { class = "dev.zed.Zed" }, workspace = "special:code" })

hl.window_rule({ match = { class = "Spotify" }, workspace = "special:music" })

hl.window_rule({ match = { class = "obsidian" }, workspace = "special:notes" })

hl.window_rule({ match = { class = "chrome-crunchyroll.com__-Default" }, workspace = "special:anime" })

hl.window_rule({ match = { class = "chrome-youtube.com__-Default" }, workspace = "special:media" })


hl.window_rule({ match = { class = "steam_app_2483190" }, opaque = true })

hl.window_rule({ match = { class = "steam_app_2483190" }, immediate = true })

hl.window_rule({ match = { fullscreen = true }, opaque = true })
hl.window_rule({ match = { float = true }, opaque = true })

hl.window_rule({ match = { class = "cs2" }, immediate = true })

hl.window_rule({ match = { title = "btop"}, float= true})


------
--- Layer Rules
------

hl.layer_rule({
    match        = { namespace = "swaync-control-center" },
    blur         = true,
    ignore_alpha = 0.5
})

-- Reglas para las ventanas emergentes de notificación de SwayNC
hl.layer_rule({
    match        = { namespace = "swaync-notification-window" },
    blur         = true,
    ignore_alpha = 0.5
})
