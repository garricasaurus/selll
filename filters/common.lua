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
