-- Wrap around the function that checks if the player should be damaged after running out of time
modutil.mod.Path.Wrap("BiomeSpeedTimerLoop", function(base)
	-- If a save is loaded, the default BiomeTimeLimits.Penalty.Interval will be 1, so we need to make sure it is set to the correct value if the timer is actually paused at the moment
	if not config.pauseAllTimers and game.CurrentRun.ModVowOfPausedTimeTimerPaused then
		game.BiomeTimeLimits.Penalty.Interval = game.BiomeTimeLimits.Penalty.ModVowOfPausedTimePausedTimerInterval
	end

	-- Give a miniscule amount of time to prevent the penalty from triggering when first entering a cleared room
	-- The wait call is at the end of the function, so the first iteration of the loop would still run without this
	if game.CurrentRun.BiomeTime <= 0 and config.disableTimerOutOfCombat and game.BiomeTimeLimits.Penalty.Interval == game.BiomeTimeLimits.Penalty.ModVowOfPausedTimePausedTimerInterval then
		game.CurrentRun.BiomeTime = 0.001
	end

	base()
end)
