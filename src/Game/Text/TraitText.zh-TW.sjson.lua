local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "時限之誓",
  --   Description =
  --   "每個{$Keywords.Biome}的通關時限為 {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}（超時後果自負！）{#Prev}。",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "「今夜難享片刻安寧，恐懼漫溢世間。」"
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "垂危",
  --   Description =
  --   "在 {#AltPenaltyFormat}{$TooltipData.ExtractData.Duration} 秒{#Prev}內完成 {#BoldFormatGraft}{$TooltipData.RemainingUses} 場{$Keywords.Encounter}{#Prev}，否則受到 {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} 點{#Prev}傷害。"
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "閃銀汞珠",
  --   Description =
  --   "在接下來的 {#UpgradeFormat}{$TooltipData.ExtractData.Duration} 秒{#Prev}內，移動、出擊和{$Keywords.HoldAlt}的速度上升 {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}%{#Prev}。"
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/zh-TW/TraitText.zh-TW.sjson')

-- Change the description of the Vow of Time if the timer pauses outside of combat
if config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat then
  sjson.hook(helpTextFile, function(data)
    for i, existingText in ipairs(data.Texts) do
      for _, newValue in ipairs(newVowDescription) do
        if existingText.Id == newValue.Id then
          data.Texts[i] = sjson.to_object(newValue, order)
        end
      end
    end
  end)
end

-- Add a note that the Chaos and Hermes timers will not pause outside of combat
if config.disableVowTimerOutOfCombat and not config.disableAllTimersOutOfCombat then
  sjson.hook(helpTextFile, function(data)
    for i, existingText in ipairs(data.Texts) do
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
  end)
end
