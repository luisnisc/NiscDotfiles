import App from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"

function PowerButton({ name, icon, command }: { name: string, icon: string, command: string }) {
    return (
        <button
            class="power-btn"
            onClicked={() => execAsync(command).catch(console.error)}
        >
            <box orientation={Gtk.Orientation.VERTICAL} spacing={12} halign={Gtk.Align.CENTER}>
                <image iconName={icon} pixelSize={48} />
                <label label={name} />
            </box>
        </button>
    )
}

export default function PowerMenu(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor

    return (
        <window
            name="powermenu"
            class="powermenu-overlay"
            gdkmonitor={gdkmonitor}
            visible={false}
            exclusivity={Astal.Exclusivity.IGNORE}
            keymode={Astal.Keymode.EXCLUSIVE}
            anchor={TOP | LEFT | RIGHT | BOTTOM}
            application={App}
        >
            <button
                class="powermenu-bg-click"
                onClicked={(self) => {
                    const win = self.get_root() as Gtk.Window
                    win.visible = false
                }}
            >
                <box
                    class="powermenu-container"
                    halign={Gtk.Align.CENTER}
                    valign={Gtk.Align.CENTER}
                    spacing={24}
                    canTarget={false}
                >
                    <PowerButton name="Apagar" icon="system-shutdown-symbolic" command="systemctl poweroff" />
                    <PowerButton name="Reiniciar" icon="system-reboot-symbolic" command="systemctl reboot" />
                    <PowerButton name="Salir" icon="system-log-out-symbolic" command="hyprctl dispatch exit" />
                    <PowerButton name="Cancelar" icon ="system-cancel-symbolic" command=" ags toggle powermenu"/>
                </box>
            </button>
        </window>
    )
}
