fx_version "bodacious"
game "gta5"
lua54 "yes"

ui_page "web/index.html"

client_scripts {
	"@vrp/config/Vehicle.lua",
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	"shared/shared.lua",
	"client/*"
}

server_scripts {
	"@vrp/config/Vehicle.lua",
	"@vrp/lib/Utils.lua",
	"server/*"
}

files {
	"web/*",
	"web/**/*"
}