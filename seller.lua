local _, addon = ...

local seller = {}

addon.Sell = function(ilvl_limit)
    if not addon.isMerchantFrameOpen() then
        print(addon.OpenMerchant)
        return
    end
    C_MerchantFrame.SellAllJunkItems()
    if not ilvl_limit then
        ilvl_limit = SellConf.lowLevelThreshold * GetAverageItemLevel()
    end
    C_Timer.After(SellConf.sellDelay, function()
        seller:ImprovedSellJunkItems(ilvl_limit)
    end)
end

function seller:ImprovedSellJunkItems(ilvl_limit)
    local itemsInBag = self:bagContents()
    local itemsToSell = {}
    for _, item in ipairs(itemsInBag) do
        item:ContinueOnItemLoad(function()
            if self:canSell(item, ilvl_limit) then
                table.insert(itemsToSell, item)
            end
        end)
    end
    self:throttledSell(itemsToSell)
end

function seller:bagContents()
    local res = {}
    for bag = 0, 5 do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local item = Item:CreateFromBagAndSlot(bag, slot)
            if not item:IsItemEmpty() then
                table.insert(res, item)
            end
        end
    end
    return res
end

function seller:canSell(item, ilvl_limit)
    local filters = addon.filters or {}
    for _, filter in pairs(filters) do
        if filter:CanSell(item, ilvl_limit) then
            return true
        end
    end
    return false
end

function seller:throttledSell(items)
    self:disableSellButton(items)
    for i, item in ipairs(items) do
        if SellConf.safeSell and i > SellConf.safeSellCount then
            return
        end
        item:LockItem()
        C_Timer.After(i * SellConf.sellDelay, function()
            self:trySellItem(item)
        end)
    end
end

function seller:trySellItem(item)
    item:UnlockItem()
    if addon.isMerchantFrameOpen() then
        local location = item:GetItemLocation()
        if location then
            C_Container.UseContainerItem(location.bagID, location.slotIndex)
        end
    end
end

function seller:disableSellButton(items)
    addon.extraButtonEnabled(false)
    C_Timer.After(#items * SellConf.sellDelay, function()
        addon.extraButtonEnabled(true)
    end)
end
