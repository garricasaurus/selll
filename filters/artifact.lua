local _, addon = ...

-- Filter for selling Legion Artifact Relics
local filter = {}

function filter:CanSell(item, ilvl_limit)
    return addon.IsItemLevelBelowThreshold(item, ilvl_limit) and
        addon.MatchItemType(item, Enum.ItemClass.Gem, Enum.ItemGemSubclass.Artifactrelic)
end

addon.filters = addon.filters or {}
addon.filters.artifact = filter