modutil.mod.Path.Wrap("StartRoom", function(base, currentRun, currentRoom)
	-- Pause the timer when loading the first room in a biome (especially for first room of the run)
	if currentRoom.BiomeStartRoom then
		game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = true
	end

	base(currentRun, currentRoom)
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	-- Resume the timer when an enemy unit spawns
	if config.disableTimerOutOfCombat and unit.AddToEnemyTeam then
		game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = false
	end

	base(unit, currentRun, args)
end)
