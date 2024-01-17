local _, addon = ...

local items = {}

local sellableItemTypes = {
    [1] = true,  -- head
    [2] = true,  -- neck
    [3] = true,  -- shoulder
    [4] = true,  -- body
    [5] = true,  -- chest
    [6] = true,  -- waist
    [7] = true,  -- legs
    [8] = true,  -- feet
    [9] = true,  -- wrist
    [10] = true, -- hand
    [11] = true, -- finger
    [12] = true, -- trinket
    [13] = true, -- weapon
    [14] = true, -- shield
    [15] = true, -- ranged
    [16] = true, -- cloak
    [17] = true, -- 2h-weapon
    [20] = true, -- robe
    [21] = true, -- main hand weapon
    [22] = true, -- off hand weapon
    [23] = true, -- off hand holdable
    [26] = true, -- ranged
    [28] = true, -- relic
}

function items:SellLowLevelItems(ilvl_limit)
    local count = 0
    for bag = 0, 4 do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            if self:shouldSellItem(ilvl_limit, bag, slot) then
                if addon.isMerchantFrameOpen() then
                    C_Container.UseContainerItem(bag, slot)
                    count = count + 1
                    if Conf.safeSell and count == Conf.safeSellCount then
                        return
                    end
                else
                    print("You must open the merchant window to sell items!")
                    return
                end
            end
        end
    end
end

function items:shouldSellItem(ilvl_limit, bag, slot)
    local item = Item:CreateFromBagAndSlot(bag, slot)
    if item then
        local type = item:GetInventoryType()
        if sellableItemTypes[type] then
            local ilvl = item:GetCurrentItemLevel()
            if ilvl <= ilvl_limit then
                return true
            end
        end
    end
    return false
end

addon.items = items
