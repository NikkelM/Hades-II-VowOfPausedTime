local order = {
  "Id",
  "DisplayName",
  "Description"
}

local newVowDescription = {
  -- {
  --   Id = "BiomeSpeedShrineUpgrade",
  --   DisplayName = "時の冥約",
  --   Description =
  --   "各{$Keywords.Biome}に{#ShrinePenaltyFormat}{$MetaUpgradeData.BiomeSpeedShrineUpgrade.DisplayValue}{#Prev}のクリア制限時間がつく{#ItalicFormat}（時間切れになると、挑戦失敗）。{#Prev}"
  -- },
  -- {
  --   Id = "BiomeSpeedShrineUpgrade_Flavor",
  --   DisplayName = "「今宵、凶怖は満ち、一瞬の安息も許されず」"
  -- }
}

local newChaosTimeCurse = {
  -- {
  --   Id = "ChaosTimeCurse",
  --   DisplayName = "滅する",
  --   Description =
  --   "以降の{$Keywords.Encounter}{#BoldFormatGraft}{$TooltipData.RemainingUses}{#Prev}回を{#AltPenaltyFormat}{$TooltipData.ExtractData.Duration}秒{#Prev}以内にクリアしないと、{#AltPenaltyFormat}{$TooltipData.ExtractData.Damage}{#Prev}のダメージを受ける。"
  -- }
}

local newHermesSpeedKeepsake = {
  -- {
  --   Id = "TimedBuffKeepsake",
  --   InheritFrom = "BaseBoonMultiline",
  --   DisplayName = "銀の滴",
  --   Description =
  --   "この後{#UpgradeFormat}{$TooltipData.ExtractData.Duration}秒{#Prev}間、移動・攻撃・{$Keywords.HoldAlt}の速度が{#BoldFormatGraft}{$TooltipData.ExtractData.Speed}%{#Prev}速くなる。"
  -- }
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/ja/TraitText.ja.sjson')

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
