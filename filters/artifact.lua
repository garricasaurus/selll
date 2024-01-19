local _, addon = ...

-- Filter for selling Legion Artifact Relics
local filter = {}

local artifact = {
    itemType = 3,       -- Miscellaneous
    itemSubType = 11    -- Artifact Relic
}

function filter:CanSell(item, ilvl_limit)
    return addon.IsItemLevelBelowThreshold(item, ilvl_limit) and
        addon.MatchItemType(item, artifact.itemType, artifact.itemSubType)
end

addon.filters = addon.filters or {}
addon.filters.artifact = filter