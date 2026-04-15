local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Voto do Tempo",
  --   Description =
  --   "Você tem {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}para transpor cada [região]{$Keywords.Biome} {#ItalicFormat}(ou pagará o preço...){#Prev}.",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = ""Esta noite, não haverá um instante de paz, para que o medo se alastre.""
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Fugaz",
  --   Description =
  --   "Se não concluir {#BoldFormatGraft}{$TooltipData.RemainingUses} {#Prev}[confronto(s)]{$Keywords.Encounter} dentro de {#AltPenaltyFormat}{$TooltipData.ExtractData.Duration} s{#Prev}, você sofrerá {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}de dano."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Gota Metálica",
  --   Description =
  --   "Você se move, golpeia e [canaliza]{$Keywords.HoldAlt} {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}mais rápido pelos próximos {#UpgradeFormat}{$TooltipData.ExtractData.Duration} s{#Prev}."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/pt-BR/TraitText.pt-BR.sjson')

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
