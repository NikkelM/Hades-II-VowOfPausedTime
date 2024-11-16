modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	-- Pause the timer when combat ends
	if config.disableTimerOutOfCombat then
		game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = true
	end

	base(currentRoom, currentEncounter)
end)
