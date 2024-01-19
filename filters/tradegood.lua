local _, addon = ...

-- Filter for old trade goods
local filter = {}

function filter:CanSell(item, _)
    if addon.MatchItemType(item, Enum.ItemClass.Tradegoods) then
        return addon.IsItemFromOldXpac(item)
    end
end

addon.filters = addon.filters or {}
addon.filters.tradegood = filter
