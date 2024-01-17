local addonName, addon = ...

local items = addon.items

local main = {}

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event, name)
    if event == "ADDON_LOADED" and name == addonName then
        for k, v in pairs(addon.defaults) do
            if not Conf[k] then
                Conf[k] = v
            end
        end
    end
end)

function main:Sell(ilvl)
    C_MerchantFrame.SellAllJunkItems()
    if not ilvl then
        ilvl = Conf.lowLevelThreshold * GetAverageItemLevel()
    end
    items:SellLowLevelItems(ilvl)
end

addon.main = main
