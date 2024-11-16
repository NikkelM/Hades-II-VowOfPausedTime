modutil.mod.Path.Wrap("StartRoom", function(base, currentRun, currentRoom)
	-- Pause the timer when loading the first room in a biome (especially for first room of the run)
	if currentRoom.BiomeStartRoom then
		if config.pauseVowTimerOnly then
			-- This pauses only the Vow of Time timer
			game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = true
		else
			-- This pauses all timers, including the run timer, timed keepsakes and the chaos time curse
			game.AddTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
		end
	end

	base(currentRun, currentRoom)
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	-- Resume the timer when an enemy unit spawns
	if config.disableTimerOutOfCombat and unit.AddToEnemyTeam then
		if config.pauseVowTimerOnly then
			game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = false
		else
			game.RemoveTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
		end
	end

	base(unit, currentRun, args)
end)
