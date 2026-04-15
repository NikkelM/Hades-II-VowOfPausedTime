local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Voto del Tempo",
  --   Description =
  --   "Hai {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}per lasciare ogni {$Keywords.Biome} {#ItalicFormat}(altrimenti...){#Prev}."
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "“Stanotte avrò la Morte ad inseguirmi, perché il Terrore possa dilagare.”"
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Impaziente",
  --   Description =
  --   "Se non completi {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}{$Keywords.Encounter} in {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} Sec.{#Prev}, subisci {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}danni."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Goccia Metallica",
  --   Description =
  --   "Ti muovi, colpisci e [Incanali]{$Keywords.HoldAlt} il {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}più in fretta per i prossimi {#UpgradeFormat}{$TooltipData.ExtractData.Duration} Sec."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/it/TraitText.it.sjson')

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
