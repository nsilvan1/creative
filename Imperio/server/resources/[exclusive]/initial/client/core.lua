-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("initial")
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITIAL:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("initial:Open")
AddEventHandler("initial:Open", function()
	if vSERVER.Check() then
		SetNuiFocus(true, true)
		SendNUIMessage({ name = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Save", function(Data, Callback)
	SetNuiFocus(false, false)
	vSERVER.Save(Data["name"])
	TriggerEvent("hud:Active", true)

	Callback("Save")
end)