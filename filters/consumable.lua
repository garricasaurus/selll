local _, addon = ...

-- Filter for selling Legion Artifact Relics
local filter = {}

-- We are not able to use the respective Consumable Enum constants
-- due to the bug: https://github.com/Stanzilla/WoWUIBugs/issues/218.
-- In the meantime map the values manually
local types = {
    { itemType = Enum.ItemClass.Consumable, 1 },    -- potion
    { itemType = Enum.ItemClass.Consumable, 4 },    -- scroll
    { itemType = Enum.ItemClass.Consumable, 5 },
}

local legacyExpacs = {
    [0] = true, -- vanilla
    [1] = true, -- TBC
    [2] = true, -- WotLK
    [3] = true, -- Cata
    [4] = true, -- Mists
    [5] = true, -- WoD
    [6] = true, -- Legion
    [7] = true, -- BoA
    [8] = true, -- SL
}

function filter:CanSell(item, _)
    for _, t in ipairs(types) do
        if addon.MatchItemType(item, t.itemType, t.itemSubType) then
            local xpac = select(15, GetItemInfo(item:GetItemID()))
            return legacyExpacs[xpac]
        end
    end
end

addon.filters = addon.filters or {}
addon.filters.consumable = filter
