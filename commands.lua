SLASH_SELLL1 = "/sell"
SLASH_SELLL2 = "/selll"

local _, addon = ...

local function SlashCommandHandler(msg, _)
    if msg and msg == "config" then
        print("config")
        return
    end
    -- determine ilvl to sell
    if msg then
        local ilvl = tonumber(msg)
        addon.main:Sell(ilvl)
    end
end

SlashCmdList["SELLL"] = SlashCommandHandler