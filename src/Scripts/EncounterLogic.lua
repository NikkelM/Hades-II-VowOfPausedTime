modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	-- Remove the timer block when combat starts
	if config.disableTimerOutOfCombat then
		print("Adding timer block (OnAllEnemiesDead)")
		game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = true
		-- game.AddTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
	end

	base(currentRoom, currentEncounter)
end)
