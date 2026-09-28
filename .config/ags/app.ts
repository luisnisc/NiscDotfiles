import app from "ags/gtk4/app"
import style from "./style.scss"
import PowerMenu from "./widget/PowerMenu"


app.start({
  css: style,
  main() {
    app.get_monitors().map((monitor) => {
      PowerMenu(monitor) // Tu menú de apagado existente

    })
  },
})
