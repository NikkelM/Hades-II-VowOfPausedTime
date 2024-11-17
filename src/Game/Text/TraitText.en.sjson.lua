---@meta _
---@diagnostic disable

local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newData = {
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

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/en/TraitText.en.sjson')

if config.disableTimerOutOfCombat then
  sjson.hook(helpTextFile, function(data)
    for _, newValue in ipairs(newData) do
      table.insert(data.Texts, sjson.to_object(newValue, order))
    end
  end)
end
