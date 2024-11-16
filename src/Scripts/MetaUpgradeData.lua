local newRanks = {
	{ Points = 1, ChangeValue = config.timeEasyTier },
	{ Points = 2, ChangeValue = config.timeMediumTier },
	{ Points = 3, ChangeValue = config.timeHardTier },
}

game.MetaUpgradeData.BiomeSpeedShrineUpgrade.Ranks = newRanks
