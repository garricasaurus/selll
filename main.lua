local _, addon = ...

local items = addon.items

local main = {}

function main:Sell(ilvl)
    if ilvl then
        items:SellLowLevelItems(ilvl)
    else
        items:SellLowLevelItems(0.75 * GetAverageItemLevel())
    end
end


addon.main = main