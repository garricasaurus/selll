local _, addon = ...

addon.CreateText = function(frame, text, style, width)
    local s = frame:CreateFontString(nil, "ARTWORK", style)
    s:SetWidth(width or 250)
    s:SetJustifyH("LEFT")
    s:SetText(text)
    return s
end

addon.CreateCheckbox = function(frame, text)
    local chekbox = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
    chekbox["text"]:SetText(text)
    return chekbox
end

addon.CreateSlider = function(frame, text, min, max, step)
    local slider = CreateFrame("Slider", nil, frame, "OptionsSliderTemplate")
    slider:SetWidth(350)
    slider:SetMinMaxValues(min, max)
    slider:SetValueStep(step)

    local tooltip = slider:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    tooltip:SetPoint("BOTTOM", slider, "BOTTOM", 0, -8)

    slider:SetScript("OnValueChanged", function(_, value)
        tooltip:SetText(string.format("%.2f", value))
    end)

    local header = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    header:SetText(text)
    header:SetPoint("BOTTOMLEFT", slider, "TOPLEFT", 0, 16)

    return slider
end
