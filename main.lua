local addonName, addon = ...

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event, name)
    if event == "ADDON_LOADED" and name == addonName then
        SellConf = SellConf or {}
        for k, v in pairs(addon.defaults) do
            if SellConf[k] == nil then
                SellConf[k] = v
            end
        end
    end
end)

addon.defaults = {
    replaceBlizzButton = true,
    lowLevelThreshold = 0.75,
    safeSell = false,
    safeSellCount = 12,
    sellDelay = 0.5,
}
