

# Requires
# -----------------------------
Router = require("./router")
Flux = require("./flux")

# App
# ---------------------------
app = window.app = {}



# google analytics
require("./ga")
# slicknav
require("./modules/slicknav")
app.flux = new Flux()
app.router = new Router()