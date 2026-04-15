local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Ślub Czasu",
  --   Description =
  --   "Masz {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}na ukończenie każdego [regionu]{$Keywords.Biome} {#ItalicFormat}(w przeciwnym razie pożałujesz...){#Prev}.",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "„Tej nocy nie zaznam spokoju ani na chwilę, by zapanował Strach"."
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Zgubny",
  --   Description =
  --   "Masz {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} sek. {#Prev}na ukończenie {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}[potyczek]{$Keywords.Encounter}. Jeśli ci się to nie uda, otrzymasz {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}obrażeń."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Metaliczna Kropelka",
  --   Description =
  --   "Przez kolejne {#UpgradeFormat}{$TooltipData.ExtractData.Duration} sek. {#Prev}poruszasz się, atakujesz i [podtrzymujesz]{$Keywords.HoldAlt} zdolności o {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}szybciej."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/pl/TraitText.pl.sjson')

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
