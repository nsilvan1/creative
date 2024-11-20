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
Tunnel.bindInterface("crafting", Imperio)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Permission(Type)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if List[Type]["Permission"] then
            if List[Type]["Permission"] ~= nil then
                if vRP.HasGroup(Passport,List[Type]["Permission"]) then
                    return true
                end
            end
        else
            return true
        end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Request(Type)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local inventoryShop = {}
        for Item, v in pairs(List[Type]["List"]) do
            local keyList = {}

            for Required, Amount in pairs(v.Required) do
                keyList[#keyList + 1] = { index = Required, amount = Amount }
            end

            inventoryShop[#inventoryShop + 1] = {
                ["id"] = Type,
                ["name"] = itemName(Item),
                ["index"] = itemIndex(Item),
                ["type"] = itemType(Item),
                ["economy"] = parseFormat(itemEconomy(Item)),
                ["key"] = Item,
                ["weight"] = itemWeight(Item),
                ["amount"] = parseInt(v["Amount"]),
                ["recipeItems"] = keyList,
                ["craftable"] = v["Craftable"],
                ["time"] = v["Time"]
            }
        end

        local InventoryUser = {}
		local Inventory = vRP.Inventory(Passport)
        for Index, v in pairs(Inventory) do
            v["amount"] = parseInt(v.amount)
            v["name"] = itemName(v["item"])
            v["weight"] = itemWeight(v["item"])
            v["index"] = itemIndex(v["item"])
            v["max"] = itemMaxAmount(v["item"])
            v["economy"] = parseFormat(itemEconomy(v["item"]))
            v["key"] = v["item"]
            v["slot"] = Index

            local SplitString = splitString(v["item"], "-")
            if SplitString[2] ~= nil then
                if itemDurability(v.item) then
                    v["durability"] = parseInt(os.time() - SplitString[2])
                    v["days"] = itemDurability(v["item"])
                else
                    v["durability"] = 0
                    v["days"] = 1
                end
            else
                v["durability"] = 0
                v["days"] = 1
            end
            InventoryUser[Index] = v
        end
        return inventoryShop, InventoryUser, vRP.InventoryWeight(Passport), vRP.GetWeight(Passport)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Crafting(Type, Item, Amount)
    local source = source
    local Amount = parseInt(Amount)
    local Passport = vRP.Passport(source)
    if Passport then
        if Amount <= 0 then Amount = 1 end

        if List[Type]["List"][Item] then
            if vRP.MaxItens(Passport, Item, List[Type]["List"][Item]["Amount"] * Amount) then
                TriggerClientEvent("Notify", source, "amarelo", "Limite atingido.", "Atenção", 5000)
                return
            end

            if (vRP.InventoryWeight(Passport) + (itemWeight(Item) * List[Type]["List"][Item]["Amount"]) * Amount) <= vRP.GetWeight(Passport) then
                for Index, v in pairs(List[Type]["List"][Item]["Required"]) do
                    local ConsultItem = vRP.InventoryItemAmount(Passport, Index)
                    if ConsultItem[1] < parseInt(v * Amount) then
                        return
                    end

                    if vRP.CheckDamaged(ConsultItem[2]) then
                        TriggerClientEvent("Notify", source, "vermelho", "Item danificado.", "Aviso", 5000)
                        return
                    end
                end

                for Index, v in pairs(List[Type]["List"][Item]["Required"]) do
                    local ConsultItem = vRP.InventoryItemAmount(Passport, Index)
                    vRP.RemoveItem(Passport, ConsultItem[2], parseInt(v * Amount))
                end

                vRP.GenerateItem(Passport, Item, List[Type]["List"][Item]["Amount"] * Amount, true)
            else
                TriggerClientEvent("Notify", source, "vermelho", "Mochila cheia.", "Aviso", 5000)
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OWNED
-----------------------------------------------------------------------------------------------------------------------------------------
function Imperio.Owned(Type, Item)
    local Owned = {}
    local source = source
    local Passport = vRP.Passport(source)

    if Passport and List[Type]["List"][Item] then
        for item, v in pairs(List[Type]["List"][Item]["Required"]) do
            table.insert(Owned, {
                ["index"] = item,
                ["amount"] = vRP.ItemAmount(Passport, item)
            })
        end

        return Owned
    end

    return false
end