local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "Υπόσχεση του Χρόνου",
  --   Description =
  --   "Έχεις στη διάθεσή σου {#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue} {#Prev}για να ολοκληρώσεις κάθε {$Keywords.Biome} {#ItalicFormat}(αλλιώς την πάτησες...){#Prev}.",
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "«Την αποψινή νύχτα δεν θα επέλθει ούτε στιγμή γαλήνης, προκειμένου ο Φόβος να εξαπλωθεί.»",
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "Εκπνεόμενη",
  --   Description =
  --   "Αν δεν έχεις ολοκληρώσει {#BoldFormatGraft}{$TooltipData.RemainingUses} [Σύγκρουση ή Συγκρούσεις]{#Prev}{$Keywords.Encounter} σε {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} δευτ.{#Prev}, δέχεσαι {#AltPenaltyFormat}{$TooltipData.ExtractData.Damage} {#Prev}ζημιά.",
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "Μεταλλικό σταγονίδιο",
  --   Description =
  --   "Κινείσαι, επιτίθεσαι και [Διοχετεύεις]{$Keywords.HoldAlt} {#BoldFormatGraft}{$TooltipData.ExtractData.Speed}% {#Prev}πιο γρήγορα για τα επόμενα {#UpgradeFormat}{$TooltipData.ExtractData.Duration} δευτ.",
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/el/TraitText.el.sjson')

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
