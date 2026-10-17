local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Serment de Hâte",
  --   Description =
  --   "Vous avez {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}pour traverser chaque {$Keywords.Biome} {#ItalicFormat}(sinon...){#Prev}."
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName =
  --   "« En cette nuit d'obscurité, la Terreur je répands ; et aucun répit je ne connaîtrai, j'en fais le serment. »"
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Condamné·e",
  --   Description =
  --   "Terminez les {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}prochains [Combats]{$Keywords.Encounter} en moins de {#AltPenaltyFormat}{$TooltipData.ExtractData.Duration} s {#Prev}; sinon, perdez {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage}{!Icons.Health}{#Prev}."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Gouttelette Métallique",
  --   Description =
  --   "Votre vitesse de frappe, de déplacement et de [Canalisation]{$Keywords.HoldAlt} augmente de {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}pendant {#UpgradeFormat}{$TooltipData.ExtractData.Duration} s {#Prev}dès que vous vous équipez de ceci."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/fr/TraitText.fr.sjson')

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
