-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Nitro"] = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATENITRO
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.UpdateNitro(Plate, Fuel)
	if GlobalState["Nitro"][Plate] then
		local Nitro = GlobalState["Nitro"]
		Nitro[Plate] = Fuel
		GlobalState:set("Nitro", Nitro, true)
	end
end