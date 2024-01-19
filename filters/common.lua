local _, addon = ...

addon.IsItemLevelBelowThreshold = function(item, ilvl_limit)
    local ilvl = item:GetCurrentItemLevel()
    return ilvl > 0 and ilvl <= ilvl_limit
end

addon.MatchItemType = function(item, matchType, matchSubType)
    local itemID = item:GetItemID()
    local itemType, itemSubType = select(12, GetItemInfo(itemID))
    if itemType == matchType then
        if not matchSubType then
            return true
        else
            return itemSubType == matchSubType
        end
    end
    return false
end

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

addon.IsItemFromOldXpac = function (item)
    local xpac = select(15, GetItemInfo(item:GetItemID()))
    return legacyExpacs[xpac]
end