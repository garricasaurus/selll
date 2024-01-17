local _, addon = ...

addon.defaults = {
    replaceBlizzButton = false,
    lowLevelThreshold = 0.75,
    safeSell = false,
    safeSellCount = 12,
}

local frame = CreateFrame("Frame", "SellConfig")

local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("Selling Settings")

local safeSellCheckbox = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
safeSellCheckbox["text"]:SetText("Safe Sell")
safeSellCheckbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -16)

local replaceBlizzCheckbox = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
replaceBlizzCheckbox["text"]:SetText("Replace Merchant Button")
replaceBlizzCheckbox:SetPoint("TOPLEFT", safeSellCheckbox, "BOTTOMLEFT", 0, -16)

local thresholdSliderText = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
thresholdSliderText:SetPoint("TOPLEFT", replaceBlizzCheckbox, "BOTTOMLEFT", 0, -32)
thresholdSliderText:SetText("Low Level Item Threshold")


local thresholdSlider = CreateFrame("Slider", nil, frame, "OptionsSliderTemplate")
thresholdSlider:SetWidth(350)
thresholdSlider:SetMinMaxValues(0.05, 0.95)
thresholdSlider:SetValueStep(0.05)
thresholdSlider:SetObeyStepOnDrag(true)
thresholdSlider.tooltipText = thresholdSlider:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
thresholdSlider.tooltipText:SetPoint("BOTTOM", thresholdSlider, "BOTTOM", 0, -8)
thresholdSlider:SetScript("OnValueChanged", function(s, value)
    s.tooltipText:SetText(string.format("%.2f", value))
end)
thresholdSlider:SetPoint("TOPLEFT", thresholdSliderText, "BOTTOMLEFT", 0, -16)

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

local settings = Settings.RegisterCanvasLayoutCategory(frame, "Selll")
settings.ID = "Selll"
Settings.RegisterAddOnCategory(settings)
