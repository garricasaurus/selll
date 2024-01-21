SLASH_SELLL1 = "/sell"
SLASH_SELLL2 = "/selll"

local name, addon = ...

local function SlashCommandHandler(msg, _)
    if msg and msg == "config" then
        Settings.OpenToCategory(name)
        return
    end
    -- determine ilvl to sell
    if msg then
        local ilvl = tonumber(msg)
        addon.Sell(ilvl)
    end
end

SlashCmdList["SELLL"] = SlashCommandHandler