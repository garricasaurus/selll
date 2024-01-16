local _, addon = ...

local isMerchantFrameOpen = false

MerchantFrame:HookScript("OnShow", function()
    isMerchantFrameOpen = true
end)

MerchantFrame:HookScript("OnHide", function ()
    isMerchantFrameOpen = false
end)

addon.isMerchantFrameOpen = function ()
    return isMerchantFrameOpen
end