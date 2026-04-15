local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "시간의 맹세",
  --   Description =
  --   "각 {$Keywords.Biome}을 {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}안에 주파해야 합니다. (만약 실패하면…)"
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "“오늘 밤 한시의 안식도 없으리니, 공포가 퍼질지라.”",
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "쇠하는",
  --   Description =
  --   "{#BoldFormatGraft}{$TooltipData.ExtractData.Duration}초 {#Prev}안에 {#BoldFormatGraft}{$Keywords.Encounter} {$TooltipData.RemainingUses}번{#Prev}을 마치지 못하면 피해를 {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}받습니다."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "금속성 방울",
  --   Description =
  --   "다음 {#UpgradeFormat}{$TooltipData.ExtractData.Duration}초 {#Prev}동안 이동·타격·{$Keywords.HoldAlt}이 {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}빨라집니다."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/ko/TraitText.ko.sjson')

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
