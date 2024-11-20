-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Imperio = {}
Tunnel.bindInterface("survival", Imperio)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Death = false
local DeathTimer = TimeConfig
local Cooldown = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999

		if LocalPlayer["state"]["Active"] then
			local Ped = PlayerPedId()
			if GetEntityHealth(Ped) <= 100 then
				if not Death then
					Death = true

					local Coords = GetEntityCoords(Ped)
					NetworkResurrectLocalPlayer(Coords, 0.0)

					SetFacialIdleAnimOverride(Ped, "mood_sleeping_1", 0)
					LocalPlayer["state"]:set("Blastoise", true, false)
					NetworkSetFriendlyFireOption(false)
					SetEntityHealth(Ped, 100)

					if LocalPlayer["state"]["Route"] < 900000 then
						DeathTimer = TimeConfig

						TriggerEvent("hud:RemoveHood")
						TriggerEvent("hud:ScubaRemove")
						TriggerEvent("hud:Active", false)
						TriggerEvent("radio:RadioClean")
						TriggerEvent("inventory:Cancel")
						TriggerEvent("inventory:CleanWeapons")
						TriggerServerEvent("paramedic:bloodDeath")
						SendNUIMessage({ name = "Open", payload = true })

						exports["pma-voice"]:Mute(true)
					else
						DeathTimer = 5
					end

					TriggerEvent("inventory:preventWeapon", false)
					vRP.PlayAnim(false, { "dead", "dead_a" }, true)
					TriggerEvent("inventory:Close")
				else
					TimeDistance = 1
					SetEntityHealth(Ped, 100)

					DisableControlAction(0, 18, true)
					DisableControlAction(0, 22, true)
					DisableControlAction(0, 24, true)
					DisableControlAction(0, 25, true)
					DisableControlAction(0, 68, true)
					DisableControlAction(0, 70, true)
					DisableControlAction(0, 91, true)
					DisableControlAction(0, 69, true)
					DisableControlAction(0, 75, true)
					DisableControlAction(0, 140, true)
					DisableControlAction(0, 142, true)
					DisableControlAction(0, 257, true)
					DisablePlayerFiring(Ped, true)

					if GetGameTimer() >= Cooldown then
						Cooldown = GetGameTimer() + 1000

						if DeathTimer > 0 then
							DeathTimer = DeathTimer - 1
							SendNUIMessage({ name = "Update", payload = DeathTimer })
						end
					end

					if not IsEntityPlayingAnim(Ped, "dead", "dead_a", 3) and not IsPedInAnyVehicle(Ped) then
						TaskPlayAnim(Ped, "dead", "dead_a", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
					end

					if IsPedInAnyVehicle(Ped) then
						local Vehicle = GetVehiclePedIsUsing(Ped)
						if GetPedInVehicleSeat(Vehicle, -1) == Ped then
							SetVehicleEngineOn(Vehicle, false, true, true)
						end
					end

					if LocalPlayer["state"]["Route"] > 900000 and Death then
						TriggerEvent("arena:ResetStreek")
						TriggerEvent("arena:Respawn")

						Death = false
						DeathTimer = TimeConfig

						ClearPedTasks(Ped)
						NetworkSetFriendlyFireOption(true)

						if LocalPlayer["state"]["Route"] < 900000 then
							exports["pma-voice"]:Mute(false)
						end
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.CheckDeath()
	if Death and DeathTimer <= 0 then
		return true
	end

	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DEATHTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.DeathTimer()
	return DeathTimer
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- RESPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Respawn()
	Death = false
	DeathTimer = TimeConfig

	ClearPedTasks(PlayerPedId())
	NetworkSetFriendlyFireOption(true)
	ClearPedBloodDamage(PlayerPedId())
	SetEntityHealth(PlayerPedId(), 200)
	ClearFacialIdleAnimOverride(PlayerPedId())
	LocalPlayer["state"]:set("Blastoise", false, false)

	TriggerEvent("hud:Active", true)
	TriggerEvent("paramedic:Reset")
	TriggerEvent("inventory:CleanWeapons")
	LocalPlayer["state"]:set("Handcuff", false, true)
	exports["pma-voice"]:Mute(false)

	DoScreenFadeOut(0)
	TriggerEvent("hud:Active", true)
	SetEntityHeading(PlayerPedId(), 272.13)
	SendNUIMessage({ name = "Open", payload = false })
	SetEntityCoords(PlayerPedId(), 1135.1, -1519.6, 40.24)

	SetTimeout(1000, function()
		DoScreenFadeIn(1000)
	end)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Revive", function(Health, Arena)
	local Ped = PlayerPedId()

	SetEntityHealth(Ped, Health)
	LocalPlayer["state"]:set("Blastoise", false, false)

	if Arena then
		SetPedArmour(Ped, 99)
	end

	if Death then
		Death = false
		DeathTimer = TimeConfig

		ClearPedTasks(Ped)
		ClearFacialIdleAnimOverride(Ped)
		NetworkSetFriendlyFireOption(true)

		TriggerEvent("hud:Active", true)
		SendNUIMessage({ name = "Open", payload = false })

		exports["pma-voice"]:Mute(false)
		TriggerEvent("paramedic:Reset")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Revive(Health, Arena)
	exports["survival"]:Revive(Health, Arena)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SURVIVAL:DEATHLOGIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("survival:DeathLogin")
AddEventHandler("survival:DeathLogin", function()
	DeathTimer = 240
end)
