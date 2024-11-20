-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blood = {}
local Extract = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Reposed")
AddEventHandler("paramedic:Reposed", function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(Entitys) > 100 then
		if vRP.HasService(Passport,"Paramedico") then
			local Keyboard = KEYBOARD.Primary(source,"Minutos:")
			if Keyboard then
				if parseInt(Keyboard[1]) > 0 then
					local OtherPassport = vRP.Passport(Entitys)
					local Identity = vRP.Identity(OtherPassport)
					local PlayerTimer = parseInt(Keyboard[1] * 60)
					if Identity then
						if vRP.Request(source,"Hospital","Adicionar <b>"..Keyboard[1].." Minutos</b> de repouso em <b>"..Identity["Name"].."</b>?") then
							TriggerClientEvent("Notify",source,"azul","Aplicou <b>"..Keyboard[1].." Minutos</b> de repouso.",false,10000)
							TriggerEvent("Reposed",Entitys,OtherPassport,PlayerTimer)

							if NewBankTaxs then
								exports["bank"]:AddTaxs(OtherPassport,"Prefeitura",PlayerTimer * 0.3,"Gastos Médicos.")
							end
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Treatment")
AddEventHandler("paramedic:Treatment",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(Entitys) > 100 then
		local OtherPassport = vRP.Passport(Entitys)
		local Identity = vRP.Identity(OtherPassport)
		if Identity then
			if vRP.TakeItem(Passport,"syringe0"..Identity["Blood"],1) then
				if not Blood[OtherPassport] then
					Blood[OtherPassport] = os.time() + 1800
				end

				TriggerEvent("Reposed",Entitys,OtherPassport,600)
				TriggerClientEvent("target:StartTreatment",Entitys)
				TriggerClientEvent("Notify",source,"verde","Tratamento começou.","Sucesso",5000)
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("syringe0"..Identity["Blood"]).."</b>.","Atenção",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Revive")
AddEventHandler("paramedic:Revive",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(Entitys) <= 100 then
		if vRP.HasService(Passport,"Paramedico") then
			Player(source)["state"]["Cancel"] = true
			local OtherPassport = vRP.Passport(Entitys)
			TriggerClientEvent("Progress",source,"Reanimando",10000)
			vRPC.PlayAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)

			SetTimeout(10000,function()
				vRPC.Destroy(source)
				vRP.Revive(Entitys,101)
				vRP.UpgradeThirst(OtherPassport,10)
				vRP.UpgradeHunger(OtherPassport,10)
				Player(source)["state"]["Cancel"] = false
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:BANDAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Bandage")
AddEventHandler("paramedic:Bandage",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(Entitys) > 100 then
		if vRP.HasService(Passport,"Paramedico") then
			if IMPERIO_CLIENT.Bleeding(Entitys) > 0 then
				if vRP.TakeItem(Passport,"gauze",1) then
					local Bandage = IMPERIO_CLIENT.Bandage(Entitys)
					TriggerClientEvent("Progress",source,"Passando",5000)
					vRPC.PlayAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)

					SetTimeout(3000,function()
						TriggerClientEvent("Notify",source,"verde","Passou ataduras no(a) <b>"..Bandage.."</b>.","Sucesso",5000)
						TriggerClientEvent("sounds:Private",source,"bandage",0.5)
						vRPC.Destroy(source)
					end)
				else
					TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("gauze").."</b>.","Atenção",5000)
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Nenhum ferimento encontrado.","Atenção",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:DIAGNOSTIC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Diagnostic")
AddEventHandler("paramedic:Diagnostic",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Paramedico") then
			local Result = ""
			local OtherPassport = vRP.Passport(entity)
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				local Diagnostic,Bleeding = IMPERIO_CLIENT.Diagnostic(entity)

				if Bleeding <= 1 then
					Result = "<b>Sangramento:</b> Baixo<br>"
				elseif Bleeding == 2 then
					Result = "<b>Sangramento:</b> Médio<br>"
				elseif Bleeding >= 3 then
					Result = "<b>Sangramento:</b> Alto<br>"
				end

				Result = Result.."<b>Tipo Sangüíneo:</b> "..Sanguine(Identity["Blood"])

				local Number = 0
				local Damaged = false
				for Index,_ in pairs(Diagnostic) do
					if not Damaged then
						Result = Result.."<br><br><b>Danos Superficiais:</b><br>"
						Damaged = true
					end

					Number = Number + 1
					Result = Result.."<b>"..Number.."</b>: "..Bone(Index).."<br>"
				end

				TriggerClientEvent("Notify",source,"default",Result,"Ferimentos",10000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["1"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 56, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 16, texture = 0 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 15, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 15, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 57, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 16, texture = 0 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 15, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 15, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["2"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 84, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 122, texture = 0 },
			["shoes"] = { item = 47, texture = 3 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 186, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 110, texture = 3 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 86, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 90, texture = 0 },
			["mask"] = { item = 122, texture = 0 },
			["shoes"] = { item = 48, texture = 3 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 188, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 127, texture = 3 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETBURN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:presetBurn")
AddEventHandler("paramedic:presetBurn",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasService(Passport,"Emergencia") then
		local Model = vRP.ModelPlayer(entity)
		if Model == "mp_m_freemode_01" or "mp_f_freemode_01" then
			TriggerClientEvent("skinshop:Apply",entity,preset["1"][Model])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETPLASTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:presetPlaster")
AddEventHandler("paramedic:presetPlaster",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasService(Passport,"Emergencia") then
		local Model = vRP.ModelPlayer(entity)
		if Model == "mp_m_freemode_01" or "mp_f_freemode_01" then
			TriggerClientEvent("skinshop:Apply",entity,preset["2"][Model])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:EXTRACTBLOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:extractBlood")
AddEventHandler("paramedic:extractBlood",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local OtherPassport = vRP.Passport(Entitys)
		if OtherPassport and not Extract[OtherPassport] then
			if vRP.GetHealth(Entitys) >= 170 then
				local Identity = vRP.Identity(OtherPassport)
				if Identity and vRP.Request(Entitys,"Paramédico","Deseja iniciar a doação sangue?") then
					if not Blood[OtherPassport] then
						Blood[OtherPassport] = os.time()
					end

					if os.time() >= Blood[OtherPassport] then
						if vRP.TakeItem(Passport,"syringe",3) then
							Extract[OtherPassport] = true
							vRPC.DowngradeHealth(Entitys,50)
							Blood[OtherPassport] = os.time() + 10800
							vRP.GenerateItem(Passport,"syringe0"..Identity["Blood"],5,true)

							if Extract[OtherPassport] then
								Extract[OtherPassport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>3x "..itemName("syringe").."</b>.","Atenção",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","No momento não é possível efetuar a extração, o mesmo ainda está se recuperando ou se acidentou recentemente.","Atenção",10000)
					end
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","Sistema imunológico do paciente muito fraco.","Aviso",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:BLOODDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:bloodDeath")
AddEventHandler("paramedic:bloodDeath",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Blood[Passport] = os.time() + 10800
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EVIDENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function IMPERIO.Evidence(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Color = 1
		if Mode == "Yellow" then
			Color = 1
		elseif Mode == "Red" then
			Color = 2
		elseif Mode == "Green" then
			Color = 3
		elseif Mode == "Blue" then
			Color = 4
		end

		exports["inventory"]:DropsServer(vRPC.EntityCoordsZ(source),"evidence0"..Color.."-"..Passport.."-"..vRP.Identity(Passport)["License"],1,Player(source)["state"]["Route"])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Extract[Passport] then
		Extract[Passport] = nil
	end
end)