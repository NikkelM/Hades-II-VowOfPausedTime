local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Клятва часу",
  --   Description =
  --   "Ви маєте вийти з кожного [краю]{$Keywords.Biome} за {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}{#ItalicFormat}(бо буде біда...){#Prev}.",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "«Цієї ночі не матиму й миті спокою, щоб решту страх пройняв»."
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Скороминущість",
  --   Description =
  --   "У вас є {#AltPenaltyFormat}{$TooltipData.ExtractData.Duration} сек.{#Prev}, щоб завершити декілька ({#BoldFormatGraft}{$TooltipData.RemainingUses}{#Prev}) [сутичок]{$Keywords.Encounter}, інакше зазнаєте {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}шкоди."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Металева крапля",
  --   Description =
  --   "Ви рухатиметеся, атакуватимете й [посилюватимете]{$Keywords.HoldAlt} здібності на {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}швидше протягом наступних {#UpgradeFormat}{$TooltipData.ExtractData.Duration} сек."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/uk/TraitText.uk.sjson')

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
