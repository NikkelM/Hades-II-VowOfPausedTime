---@meta _
---@diagnostic disable

local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  {
    Id = "BiomeSpeedShrineUpgrade",
    DisplayName = "Vow of Paused Time",
    Description =
    "You have {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}to fight through each {$Keywords.Biome} {#ItalicFormat}(or else...){#Prev}.\n{#ItalicFormat}The timer will pause outside of combat."
  },
  {
    Id = "BiomeSpeedShrineUpgrade_Flavor",
    DisplayName = "“Upon this night there shall be but brief respites, that Fear may spread.”"
  }
}

local newChaosTimeCurse = {
  {
    Id = "ChaosTimeCurse",
    DisplayName = "Doomed",
    Description =
    "If you have not cleared {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}{$Keywords.Encounter} in {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} Sec.{#Prev}, you take {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}damage.\n{#ItalicFormat}This timer {#BoldFormat}does not {#ItalicFormat} pause outside of combat."
  }
}

local newHermesSpeedKeepsake = {
  {
    Id = "TimedBuffKeepsake",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Metallic Droplet",
    Description =
    "You move, strike, and {$Keywords.HoldAlt} {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}faster for the next {#UpgradeFormat}{$TooltipData.ExtractData.Duration} Sec.\n{#ItalicFormat}This timer {#BoldFormat}does not {#ItalicFormat} pause outside of combat."
  }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/en/TraitText.en.sjson')

-- Change the description of the Vow of Time if the timer pauses outside of combat
if config.disableTimerOutOfCombat or config.pauseAllTimers then
  sjson.hook(helpTextFile, function(data)
    for _, newValue in ipairs(newVowDescription) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
  end)
end

-- Add a note that the Chaos and Hermes timers will not pause outside of combat
if config.disableTimerOutOfCombat and not config.pauseAllTimers then
  sjson.hook(helpTextFile, function(data)
    for _, newValue in ipairs(newChaosTimeCurse) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
    for _, newValue in ipairs(newHermesSpeedKeepsake) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
  end)
end
