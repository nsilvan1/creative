-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]:set("Route",0,true)
LocalPlayer["state"]:set("Name","",false)
LocalPlayer["state"]:set("Passport",0,true)
LocalPlayer["state"]:set("Carry",false,true)
LocalPlayer["state"]:set("Walk",false,false)
LocalPlayer["state"]:set("Phone",false,false)
LocalPlayer["state"]:set("Cancel",false,true)
LocalPlayer["state"]:set("Camera",false,true)
LocalPlayer["state"]:set("Bennys",false,false)
LocalPlayer["state"]:set("Prison",false,false)
LocalPlayer["state"]:set("Active",false,false)
LocalPlayer["state"]:set("Scanner",false,false)
LocalPlayer["state"]:set("Hunting",false,false)
LocalPlayer["state"]:set("Freecam",false,false)
LocalPlayer["state"]:set("Safezone",false,true)
LocalPlayer["state"]:set("Handcuff",false,true)
LocalPlayer["state"]:set("Commands",false,true)
LocalPlayer["state"]:set("Megazord",false,false)
LocalPlayer["state"]:set("Spectate",false,false)
LocalPlayer["state"]:set("Charizard",false,false)
LocalPlayer["state"]:set("Blastoise",false,false)
LocalPlayer["state"]:set("usingPhone",false,false)
LocalPlayer["state"]:set("Luckywheel",false,false)
LocalPlayer["state"]:set("usingTrash",false,false)
LocalPlayer["state"]:set("usingTrunk",false,false)
LocalPlayer["state"]:set("Player",GetPlayerServerId(PlayerId()),false)

LocalPlayer["state"]:set("Admin",false,false)
LocalPlayer["state"]:set("Premium",false,false)
LocalPlayer["state"]:set("Lspd",false,false)
LocalPlayer["state"]:set("Sheriff",false,false)
LocalPlayer["state"]:set("Corrections",false,false)
LocalPlayer["state"]:set("Paramedico",false,false)
LocalPlayer["state"]:set("Burgershot",false,false)

LocalPlayer["state"]:set("Nitro",false,true)
LocalPlayer["state"]:set("Cassino",false,false)
LocalPlayer["state"]:set("Buttons",false,true)
LocalPlayer["state"]:set("Races",false,false)
LocalPlayer["state"]:set("Bed",false,true)
LocalPlayer["state"]:set("Target",false,false)
LocalPlayer["state"]:set("TestDrive",false,false)
LocalPlayer["state"]:set("DrivingSchool",false,false)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:Active", function(Passport, Name)
	SetDiscordAppId()
	SetDiscordRichPresenceAsset("imperio-asset")
	SetRichPresence("#"..Passport.." "..Name)
	SetDiscordRichPresenceAssetSmall("imperio")
	SetDiscordRichPresenceAssetText("Imperio RP")
	SetDiscordRichPresenceAssetSmallText("Imperio RP")
	SetDiscordRichPresenceAction(0, "Nosso Discord", "https://discord.gg/")
	SetDiscordRichPresenceAction(1, "Nosso Instagram", "https://www.instagram.com/")
end)