local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Zaman Andı",
  --   Description =
  --   "Her [Bölgeyi]{$Keywords.Biome} {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}dakika içinde tamamlaman gerekir. {#ItalicFormat}(Yoksa vay hâline...)",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = ""Ölüm'ün nefesini ensemde hissedeyim ki Korku geceye hâkim olsun.""
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Mahveden",
  --   Description =
  --   "{#AltPenaltyFormat}{$TooltipData.ExtractData.Duration} sn. {#Prev}içinde {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}{$Keywords.Encounter} tamamlayamazsan {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}hasar alırsın."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Metalik Damla",
  --   Description =
  --   "Gelecek {#UpgradeFormat}{$TooltipData.ExtractData.Duration} sn. {#Prev}boyunca {#BoldFormatGraft}%{$TooltipData.ExtractData.Speed} {#Prev}daha hızlı hareket eder, saldırır ve [Yoğunlaştırırsın]{$Keywords.HoldAlt}."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/tr/TraitText.tr.sjson')

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
