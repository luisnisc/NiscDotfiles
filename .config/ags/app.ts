import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widget/Bar"
import PowerMenu from "./widget/PowerMenu"
app.start({
  css: style,
  main() {
    app.get_monitors().map(PowerMenu)
  },
})
