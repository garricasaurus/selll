local _, addon = ...

local seller = {}

addon.Sell = function(ilvl_limit)
    C_MerchantFrame.SellAllJunkItems()
    if not ilvl_limit then
        ilvl_limit = Conf.lowLevelThreshold * GetAverageItemLevel()
    end
    seller:ImprovedSellJunkItems(ilvl_limit)
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
    for bag = 0, 4 do
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
        if Conf.safeSell and i > Conf.safeSellCount then
            return
        end
        if addon.isMerchantFrameOpen() then
            C_Timer.After(i * Conf.sellDelay, function()
                local location = item:GetItemLocation()
                if location then
                    C_Container.UseContainerItem(location.bagID, location.slotIndex)
                end
            end)
        else
            print(addon.OpenMerchant)
            return
        end
    end
end

function seller:disableSellButton(items)
   addon.extraButtonEnabled(false)
   C_Timer.After(#items * Conf.sellDelay, function ()
        addon.extraButtonEnabled(true)
   end)
end