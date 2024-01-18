local name, addon = ...

local frame = CreateFrame("Frame", "SellSettingsFrame")

local title = addon.CreateText(frame, addon.SettingsTitle, "GameFontNormalLarge")
local safeSellHint = addon.CreateText(frame, addon.SafeSellHint, "GameFontHighlightSmall")
local safeSellCheckbox = addon.CreateCheckbox(frame, addon.SafeSellText)
local replaceBlizzHint = addon.CreateText(frame, addon.ReplaceBlizzHint, "GameFontHighlightSmall")
local replaceBlizzCheckbox = addon.CreateCheckbox(frame, addon.ReplaceBlizzText)
local thresholdHint = addon.CreateText(frame, addon.ThresholdHint, "GameFontHighlightSmall", 225)
local thresholdSlider = addon.CreateSlider(frame, addon.ThresholdText, 0.05, 0.95, 0.05)

-- align controls
title:SetPoint("TOPLEFT", 20, -20)
safeSellCheckbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -40)
replaceBlizzCheckbox:SetPoint("TOPLEFT", safeSellCheckbox, "BOTTOMLEFT", 0, -40)
thresholdSlider:SetPoint("TOPLEFT", replaceBlizzCheckbox, "BOTTOMLEFT", 0, -80)
safeSellHint:SetPoint("LEFT", safeSellCheckbox, "RIGHT", 200, 0)
replaceBlizzHint:SetPoint("LEFT", replaceBlizzCheckbox, "RIGHT", 200, 0)
thresholdHint:SetPoint("LEFT", thresholdSlider, "RIGHT", 50, 0)


function frame:OnRefresh()
    replaceBlizzCheckbox:SetChecked(Conf.replaceBlizzButton)
    safeSellCheckbox:SetChecked(Conf.safeSell)
    thresholdSlider:SetValue(Conf.lowLevelThreshold)
end

function frame:OnCommit()
    Conf.replaceBlizzButton = replaceBlizzCheckbox:GetChecked()
    Conf.safeSell = safeSellCheckbox:GetChecked()
    Conf.lowLevelThreshold = thresholdSlider:GetValue()
end

function frame:OnDefault()
    Conf = addon.defaults
end

-- integrate with options menu
local settings = Settings.RegisterCanvasLayoutCategory(frame, "Sell[L]")
settings.ID = name

Settings.RegisterAddOnCategory(settings)
