local vars = require("variables")

local mainMod = vars.mainMod
local browser = vars.browser

-- ==========================================================
-- 1. CONFIGURACIÓN DEL LAYOUT SCROLLING (Solo Workspace 2)
-- ==========================================================
hl.workspace_rule({ workspace = "2", layout = "scrolling", layout_opts = { direction = "right" } })

hl.config({
	scrolling = {
		column_width = 0.5,
		focus_fit_method = 0,
		follow_focus = true,
		follow_min_visible = 0.4,
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
		wrap_focus = true,
		wrap_swapcol = true,
	},
})

hl.bind("ALT + S", hl.dsp.submap("scroll"))

hl.define_submap("scroll", function()
	-- 1. Navegar por la cinta (Mover el layout entero)
	hl.bind("right", hl.dsp.layout("move +col"), { repeating = true })
	hl.bind("left", hl.dsp.layout("move -col"), { repeating = true })

	-- 2. Intercambiar columnas de lugar (Swap)
	hl.bind("SHIFT + right", hl.dsp.layout("swapcol r"))
	hl.bind("SHIFT + left", hl.dsp.layout("swapcol l"))

	-- 3. Redimensionar usando tus 'explicit_column_widths' (0.333, 0.5, 0.667, 1.0)
	hl.bind("up", hl.dsp.layout("colresize +conf"))
	hl.bind("down", hl.dsp.layout("colresize -conf"))

	-- Si prefieres redimensionado libre relativo en lugar de predefinido:
	hl.bind("SHIFT + up", hl.dsp.layout("colresize +0.1"), { repeating = true })
	hl.bind("SHIFT + down", hl.dsp.layout("colresize -0.1"), { repeating = true })

	-- 4. Gestión de Ventanas en las Columnas (Potencial real del layout)
	-- 'consume': Mete la ventana actual en la columna de la ventana anterior (hace un split vertical)
	hl.bind("I", hl.dsp.layout("consume"))
	-- 'expel': Saca la ventana de la columna compartida y le crea su propia columna nueva
	hl.bind("O", hl.dsp.layout("expel"))

	-- 5. Control de la vista
	-- 'center': Centra la columna enfocada en medio de la pantalla
	hl.bind("C", hl.dsp.layout("center"))
	-- 'fit_into_view': Ajusta la columna para que se vea perfectamente en el monitor
	hl.bind("F", hl.dsp.layout("fit_into_view"))

	-- 6. Bloqueo del Scroll (Inhibit)
	-- Útil si tienes varias columnas pero no quieres que la vista se deslice automáticamente
	-- al cambiar el foco temporalmente.
	hl.bind("B", hl.dsp.layout("inhibit_scroll"))

	-- Salir del modo scroll
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)
-- ==========================================================
-- 2. TUS KEYBINDS ORIGINALES (Intactos)
-- ==========================================================
hl.bind(mainMod .. "+ RETURN", hl.dsp.exec_cmd(vars.terminal), { submap_universal = true })
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + ALT + RETURN", hl.dsp.exec_cmd(vars.menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + LEFT", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.workspace.move({ monitor = "r" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. "+ CTRL + SHIFT + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+ CTRL + SHIFT + left", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(vars.mainMod .. "+ W", hl.dsp.exec_cmd("waypaper"))
hl.bind(vars.mainMod .. "+ SHIFT + W", hl.dsp.exec_cmd("waypaper --random"))
hl.bind(vars.kbBrowser, hl.dsp.exec_cmd(vars.browser))
hl.bind(vars.kbCrunchyroll, hl.dsp.exec_cmd(vars.crunchyroll))
hl.bind(vars.kbYoutube, hl.dsp.exec_cmd(vars.youtube))

hl.bind(vars.kbDiscord, hl.dsp.exec_cmd("discord"))
hl.bind(vars.kbSpecialMusic, hl.dsp.exec_cmd("spotifast"))
hl.bind(mainMod .. "+ C", hl.dsp.exec_cmd("kitty --class nvim -e nvim &"))
hl.bind(vars.kbNotes, hl.dsp.exec_cmd(vars.notes))

hl.bind(vars.kbScreenshot, hl.dsp.exec_cmd("./.local/bin/hyprshot-menu"))

hl.bind(vars.kbSpecialCode, hl.dsp.workspace.toggle_special("code"))
hl.bind(vars.kbSpecialMusic, hl.dsp.workspace.toggle_special("music"))
hl.bind(vars.kbSpecialNotes, hl.dsp.workspace.toggle_special("notes"))
hl.bind(vars.kbSpecialMedia, hl.dsp.workspace.toggle_special("media"))
hl.bind(vars.kbSpecialAnime, hl.dsp.workspace.toggle_special("anime"))
hl.bind(vars.kbSpecialSocial, hl.dsp.workspace.toggle_special("social"))
hl.bind(vars.kbSpecialVirtualMachine, hl.dsp.workspace.toggle_special("virtualMachine"))

hl.bind(vars.kbNextSong, hl.dsp.exec_cmd("playerctl next"))
hl.bind(vars.kbPreviousSong, hl.dsp.exec_cmd("playerctl previous"))
hl.bind(vars.kbToggleSong, hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind(vars.kbToggleFullScreen, hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(vars.kbHyprLock, hl.dsp.exec_cmd("hyprlock"))

hl.bind(vars.powerMenu, hl.dsp.exec_cmd("ags toggle powermenu"))

hl.bind(mainMod .. "+ PERIOD", hl.dsp.exec_cmd(vars.emojiPicker))
hl.bind(mainMod .. "+ SHIFT + C", hl.dsp.exec_cmd(vars.colorPicker))
hl.bind(mainMod .. "+ ALT + V", hl.dsp.exec_cmd(vars.clipboardHistory))

hl.bind("SUPER + TAB", hl.plugin.gloview.toggle)
hl.bind("SUPER + SHIFT + TAB", hl.plugin.gloview.desktop)
hl.bind("SUPER + CTRL + TAB", hl.plugin.gloview.allworkspaces)

hl.bind("SUPER + bracketright", hl.plugin.gloview.next)
hl.bind("SUPER + bracketleft", hl.plugin.gloview.prev)
hl.bind("SUPER + 2", function()
	hl.plugin.gloview.setworkspace(2)
end)

hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd("./.local/bin/tmux-rofi.sh"))

hl.bind(mainMod .. "+ U", hl.dsp.exec_cmd("./.local/bin/diskman"))
hl.bind(mainMod .. "+ ALT + U", hl.dsp.exec_cmd("nautilus --new-window /run/media/$USER/"))
