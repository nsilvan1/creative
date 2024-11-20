-----------------------------------------------------------------------------------------------------------------------------------------
-- OXYGEN
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Oxygen(Value)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.DowngradeOxygen(Passport, Value)
	end
end