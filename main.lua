local addonName, addon = ...

local settings = addon.settings

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event, name)
    if event == "ADDON_LOADED" and name == addonName then
        SellConf = SellConf or settings.defaults
        settings:Init()
    end
end)