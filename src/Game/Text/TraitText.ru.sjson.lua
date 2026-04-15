local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Клятва времени",
  --   Description =
  --   "У вас есть {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue}{#Prev}, чтобы выбраться из каждого [региона]{$Keywords.Biome}. {#ItalicFormat}Иначе…{#Prev}",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "«Этой ночью мне не будет ни секунды покоя, чтобы страх продолжил расти»."
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Обречение",
  --   Description =
  --   "Если вы не завершите требуемое количество [схваток]{$Keywords.Encounter} за {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} сек.{#Prev}, вы получите урон в размере {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}ед. Осталось: {#BoldFormatGraft}{$TooltipData.RemainingUses}{#Prev}."
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Серебристый сгусток",
  --   Description =
  --   "В течение следующих {#UpgradeFormat}{$TooltipData.ExtractData.Duration} сек. {#Prev}вы двигаетесь, атакуете и [заряжаете]{$Keywords.HoldAlt} способности на {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}быстрее."
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/ru/TraitText.ru.sjson')

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
