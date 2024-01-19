local _, addon = ...

-- Filter for selling low-level equipment items
local filter = {}

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

function filter:CanSell(item, ilvl_limit)
    return addon.IsItemLevelBelowThreshold(item, ilvl_limit) and self:isSellable(item)
end

function filter:isSellable(item)
    local type = item:GetInventoryType()
    return sellableItemTypes[type]
end

addon.filters = addon.filters or {}
addon.filters.equipment = filter
