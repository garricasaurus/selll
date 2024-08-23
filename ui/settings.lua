local name, addon = ...

local settings = {
    defaults = {
        replaceBlizzButton = true,
        lowLevelThreshold = 0.75,
        safeSell = false,
        safeSellCount = 12,
        sellDelay = 0.25,
        sellAttempts = 3,
    }
}

function settings:Init()
    self.category, self.layout = Settings.RegisterVerticalLayoutCategory(name)
    self.category.ID = name

    self.layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(addon.SettingsTitle))
    self:CreateProxiedCheckBox(addon.SafeSellText, addon.SafeSellHint, "safeSell")
    self:CreateProxiedCheckBox(addon.ReplaceBlizzText, addon.ReplaceBlizzHint, "replaceBlizzButton")
    self:CreateProxiedSlider(addon.ThresholdText, addon.ThresholdHint, 0, 1, 0.01, "lowLevelThreshold")

    Settings.RegisterAddOnCategory(self.category)
end

function settings:CreateProxiedCheckBox(text, tooltip, variable)
    local setting = Settings.RegisterAddOnSetting(self.category, variable, variable, SellConf,
        Settings.VarType.Boolean, text, self.defaults[variable])
    Settings.CreateCheckbox(self.category, setting, tooltip)
end

function settings:CreateProxiedSlider(name, tooltip, min, max, step, variable)
    local sliderOptions = Settings.CreateSliderOptions(min, max, step)
    if step < 1 then
        sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right,
            function(v)
                return string.format("%.2f", v)
            end)
    else
        sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
    end
    local setting = Settings.RegisterAddOnSetting(self.category, variable, variable, SellConf,
        Settings.VarType.Number, name, self.defaults[variable])
    Settings.CreateSlider(self.category, setting, sliderOptions, tooltip)
end

addon.settings = settings
