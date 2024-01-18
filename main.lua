local addonName, addon = ...

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

addon.defaults = {
    replaceBlizzButton = false,
    lowLevelThreshold = 0.75,
    safeSell = false,
    safeSellCount = 12,
}
