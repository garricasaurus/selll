local _, addon = ...

local isMerchantFrameOpen = false

local function CreateExtraButton()
    local button = CreateFrame("Button", "ExtraSellButton", MerchantFrame, "UIPanelButtonTemplate")
    button:SetSize(36, 36)
    button:SetPoint("TOPLEFT", MerchantSellAllJunkButton, "TOPLEFT", 0, 0)
    button:SetText("")
    button:SetFrameStrata("HIGH")
    button:SetNormalAtlas("SpellIcon-256x256-SellJunk")
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Sell Junk & Low Level Items")
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function (self)
        GameTooltip:Hide()
    end)
    button:SetScript("OnClick", function ()
        addon.Sell()
    end)
    return button
end

MerchantFrame.extraButton = CreateExtraButton()

MerchantFrame:HookScript("OnShow", function()
    isMerchantFrameOpen = true
    MerchantFrame.extraButton:SetShown(Conf.replaceBlizzButton)
end)

EventRegistry:RegisterCallback("MerchantFrame.MerchantTabShow", function ()
    MerchantFrame.extraButton:SetShown(Conf.replaceBlizzButton)
end)

EventRegistry:RegisterCallback("MerchantFrame.BuyBackTabShow", function ()
    MerchantFrame.extraButton:SetShown(false)
end)

MerchantFrame:HookScript("OnHide", function ()
    isMerchantFrameOpen = false
end)

addon.isMerchantFrameOpen = function ()
    return isMerchantFrameOpen
end

addon.extraButtonEnabled = function (enabled)
    MerchantFrame.extraButton:SetEnabled(enabled)
end