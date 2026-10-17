local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "时间之誓",
  --   Description =
  --   "每个{$Keywords.Biome}的通关时限为 {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue}{#Prev}。{#ItalicFormat}（超时后果自负！）{#Prev}",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = ""今夜我将不得喘息，以令恐惧震慑世间。""
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "仓促混沌",
  --   Description =
  --   "你需要在 {#AltPenaltyFormat}{$TooltipData.ExtractData.Duration} 秒{#Prev}之内解决下 {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}场{$Keywords.Encounter}，否则受到 {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}伤害。"
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "金属液滴",
  --   Description =
  --   "在接下来的 {#UpgradeFormat}{$TooltipData.ExtractData.Duration} 秒{#Prev}中，你的移动、武器和{$Keywords.HoldAlt}速度加快 {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}%{#Prev}。"
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/zh-CN/TraitText.zh-CN.sjson')

-- Change the description of the Vow of Time if the timer pauses outside of combat
if config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat then
  sjson.hook(helpTextFile, function(data)
    for i, existingText in ipairs(data.Texts) do
      for _, newValue in ipairs(newVowDescription) do
        if existingText.Id == newValue.Id then
          data.Texts[i] = sjson.to_object(newValue, order)
        end
      end
      -- Add a note that the Chaos and Hermes timers will not pause outside of combat
      if not config.disableAllTimersOutOfCombat then
        for _, newValue in ipairs(newChaosTimeCurse) do
          if existingText.Id == newValue.Id then
            data.Texts[i] = sjson.to_object(newValue, order)
          end
        end
        for _, newValue in ipairs(newHermesSpeedKeepsake) do
          if existingText.Id == newValue.Id then
            data.Texts[i] = sjson.to_object(newValue, order)
          end
        end
      end
    end
  end)
end
