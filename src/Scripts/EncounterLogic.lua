modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	-- Pause the timer when combat ends
	if config.disableTimerOutOfCombat then
		if config.pauseVowTimerOnly then
			-- This pauses only the Vow of Time timer
			game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = true
		else
			-- This pauses all timers, including the run timer, timed keepsakes and the chaos time curse
			game.AddTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
		end
	end

	base(currentRoom, currentEncounter)
end)
