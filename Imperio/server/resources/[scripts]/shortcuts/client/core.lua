-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("shortcuts")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Shortcuts = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHORTSHOW
-----------------------------------------------------------------------------------------------------------------------------------------
function Shortshow()
	if not Shortcuts and not LocalPlayer["state"]["Commands"] then
		SendNUIMessage({ name = "Open", payload = vSERVER.Shortcuts() })
		Shortcuts = true
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SHORTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function Shortclose()
	SendNUIMessage({ name = "Close" })
	Shortcuts = false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- HIDESHORTCUTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("+shortcuts", Shortshow)
RegisterCommand("-shortcuts", Shortclose)
RegisterKeyMapping("+shortcuts", "Visualizar atalhos rápidos.", "keyboard", "TAB")