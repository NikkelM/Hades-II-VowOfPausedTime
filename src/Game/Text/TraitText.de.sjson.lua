local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  {
    Id = "BiomeSpeedShrineUpgrade",
    DisplayName = "Schwur der (pausierten) Zeit",
    Description =
    "Du musst eine {$Keywords.Biome} innerhalb von {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}abschließen {#ItalicFormat}(oder die Konsequenzen tragen ...){#Prev}.\n{#ItalicFormat}Die Uhr ist außerhalb von Kämpfen pausiert."
  },
  {
    Id = "BiomeSpeedShrineUpgrade_Flavor",
    DisplayName = "„Kaum Ruhe soll ich finden, auf dass die Furcht die Nacht regiert.”"
  }
}

local newChaosTimeCurse = {
  {
    Id = "ChaosTimeCurse",
    DisplayName = "Verfallend",
    Description =
    "Schließe {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}{$Keywords.Encounter} in {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} Sek. {#Prev}ab, oder du erleidest {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}Schaden.\n{#ItalicFormat}Diese Uhr pausiert {#BoldFormat}nicht {#ItalicFormat} außerhalb von Kämpfen."
  }
}

local newHermesSpeedKeepsake = {
  {
    Id = "TimedBuffKeepsake",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Silbriger Tropfen",
    Description =
    "Dein {#BoldFormatGraft}Bewegungs-{#Prev}, {#BoldFormatGraft}Waffen- {#Prev}und [Kanalisierungstempo]{$Keywords.HoldAlt} ist {#UpgradeFormat}{$TooltipData.ExtractData.Duration} Sek. {#Prev}lang um {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}erhöht.\n{#ItalicFormat}Diese Uhr pausiert {#BoldFormat}nicht {#ItalicFormat} außerhalb von Kämpfen."
  }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/de/TraitText.de.sjson')

-- Change the description of the Vow of Time if the timer pauses outside of combat
if config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat then
  sjson.hook(helpTextFile, function(data)
    for _, newValue in ipairs(newVowDescription) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
  end)
end

-- Add a note that the Chaos and Hermes timers will not pause outside of combat
if config.disableVowTimerOutOfCombat and not config.disableAllTimersOutOfCombat then
  sjson.hook(helpTextFile, function(data)
    for _, newValue in ipairs(newChaosTimeCurse) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
    for _, newValue in ipairs(newHermesSpeedKeepsake) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
  end)
end
