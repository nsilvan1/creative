local Damaged = {}
local Bleeding = 0
local BloodTick = 0
local Injuried = GetGameTimer()
local BloodTimers = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- GAMEEVENTTRIGGERED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("gameEventTriggered", function(name, Message)
	if LocalPlayer["state"]["Active"] and name == "CEventNetworkEntityDamage" and PlayerPedId() == Message[1] then
		if (Message[7] == 126349499 or Message[7] == 1064738331 or Message[7] == 85055149) and GetEntityHealth(Message[1]) > 100 then
			SetPedToRagdoll(Message[1], 2500, 2500, 0, 0, 0, 0)
		else
			if GetGameTimer() >= Injuried then
				if not IsPedInAnyVehicle(Message[1]) and GetEntityHealth(Message[1]) > 100 then
					Injuried = GetGameTimer() + 1000

					local Hit, Mark = GetPedLastDamageBone(Message[1])
					if Hit and not Damaged[Mark] and Mark ~= 0 then
						IMPERIO_SERVER.Evidence("Yellow")
						Bleeding = Bleeding + 1
						Damaged[Mark] = true
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLOODTICK
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if GetGameTimer() >= BloodTimers and GetEntityHealth(Ped) > 100 then
			BloodTimers = GetGameTimer() + 10000
			BloodTick = BloodTick + 1

			if BloodTick >= 3 and Bleeding >= 3 then
				BloodTick = 0

				AnimpostfxPlay("MenuMGIn")
				SetTimeout(Bleeding * 750, function()
					AnimpostfxStop("MenuMGIn")
				end)
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:RESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:Reset")
AddEventHandler("paramedic:Reset", function()
	Damaged = {}
	Bleeding = 0
	BloodTick = 0
	Injuried = GetGameTimer()
	BloodTimers = GetGameTimer()
	ClearPedBloodDamage(PlayerPedId())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLEEDING
-----------------------------------------------------------------------------------------------------------------------------------------
function IMPERIO.Bleeding()
	return Bleeding
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function IMPERIO.Bandage()
	local Humanes = ""
	for Number, _ in pairs(Damaged) do
		TriggerEvent("Notify", "default", "Passou ataduras no(a) <b>" .. Bone(Number) .. "</b>.", false, 5000)
		TriggerEvent("sounds:Private", "bandage", 0.5)
		Bleeding = Bleeding - 1
		Humanes = Bone(Number)
		Damaged[Number] = nil
		BloodTick = 0
		break
	end

	if Bleeding <= 0 then
		ClearPedBloodDamage(PlayerPedId())
	end

	return Humanes
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OXYCONTIN
-----------------------------------------------------------------------------------------------------------------------------------------
function IMPERIO.Oxycontin()
	Damaged = {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:INJURIES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:Injuries")
AddEventHandler("paramedic:Injuries", function()
	local Wounds = 0
	local Injuries = ""
	local Damages = false

	for Number, _ in pairs(Damaged) do
		if not Damages then
			Injuries = Injuries .. "<b>Danos Superficiais:</b><br>"
			Damages = true
		end

		Wounds = Wounds + 1
		Injuries = Injuries .. "<b>" .. Wounds .. "</b>: " .. Bone(Number) .. "<br>"
	end

	if Injuries == "" then
		TriggerEvent("Notify", "default", "Nenhum ferimento encontrado.", false, 5000)
	else
		TriggerEvent("Notify", "default", Injuries, "Seus ferimentos", 10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIAGNOSTIC
-----------------------------------------------------------------------------------------------------------------------------------------
function IMPERIO.Diagnostic()
	return Damaged, Bleeding
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Arms", function()
	if Damaged[18905] or Damaged[18905] or Damaged[60309] or Damaged[36029] or Damaged[57005] or Damaged[28422] or Damaged[6286] then
		return true
	end

	return false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LEGS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Legs", function()
	if Damaged[14201] or Damaged[65245] or Damaged[57717] or Damaged[52301] or Damaged[35502] or Damaged[24806] then
		return true
	end

	return false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOPE
-----------------------------------------------------------------------------------------------------------------------------------------
local Hope = GetGameTimer()
local Warning = GetGameTimer()
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			if exports["modules"]:Legs() then
				TimeDistance = 1
				DisableControlAction(1, 22, true)

				if IsDisabledControlJustPressed(1, 22) and GetGameTimer() >= Warning then
					TriggerEvent("Notify", "default", "Perna machucada.", false, 5000)
					Warning = GetGameTimer() + 5000
				end
			elseif GetGameTimer() <= Hope then
				TimeDistance = 1
				DisableControlAction(1, 22, true)
			else
				if IsPedJumping(Ped) then
					Hope = GetGameTimer() + 5000
				end
			end
		end

		Wait(TimeDistance)
	end
end)