-- Pauses/Unpauses the timer and sets the health penalty interval accordingly
function ModVowOfMoreOrLessTimeHandleTimerPause(pause)
	game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused = pause
	if pause then
		-- Set the dummy, increased value to prevent health from ticking down when the timer is paused
		game.BiomeTimeLimits.Penalty.Interval = game.BiomeTimeLimits.Penalty.ModVowOfMoreOrLessTimePausedTimerInterval
	else
		-- Reset the penalty interval to the original value
		game.BiomeTimeLimits.Penalty.Interval = game.BiomeTimeLimits.Penalty.ModVowOfMoreOrLessTimeOriginalInterval
	end
end

modutil.mod.Path.Wrap("StartRoom", function(base, currentRun, currentRoom)
	-- Pause the timer when loading the first room in a biome (especially for first room of the run)
	if currentRoom.BiomeStartRoom then
		if not config.pauseAllTimers then
			ModVowOfMoreOrLessTimeHandleTimerPause(true)
		else
			-- This pauses all timers, including the run timer, timed keepsakes and the chaos time curse
			game.AddTimerBlock(currentRun or game.CurrentRun, "ModVowOfMoreOrLessTime")
		end
	end

	base(currentRun, currentRoom)
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	-- Resume the timer when an enemy unit spawns
	if config.disableTimerOutOfCombat and unit.AddToEnemyTeam then
		if not config.pauseAllTimers then
			ModVowOfMoreOrLessTimeHandleTimerPause(false)
		else
			game.RemoveTimerBlock(currentRun or game.CurrentRun, "ModVowOfMoreOrLessTime")
		end
	end

	base(unit, currentRun, args)
end)
