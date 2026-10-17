local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Voto del Tiempo",
  --   Description =
  --   "Tienes {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}para salir de cada [región]{$Keywords.Biome} {#ItalicFormat}(o si no...){#Prev}.",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "«Esta noche no tendré un momento de paz, para que el Miedo se extienda»."
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Agonizante",
  --   Description =
  --   "Completa {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}[encuentro(s)]{$Keywords.Encounter} en {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} s{#Prev}. Si fracasas, te infliges {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}de daño.",
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Gota Metálica",
  --   Description =
  --   "Te mueves, golpeas y [canalizas]{$Keywords.HoldAlt} un {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}más rápido los próximos {#UpgradeFormat}{$TooltipData.ExtractData.Duration} s{#Prev}.",
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/es/TraitText.es.sjson')

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
