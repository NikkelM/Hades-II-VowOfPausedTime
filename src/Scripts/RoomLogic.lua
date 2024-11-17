-- Pauses/Unpauses the timer and sets the health penalty interval accordingly
function ModVowOfPausedTimeHandleTimerPause(pause)
	game.CurrentRun.ModVowOfPausedTimeTimerPaused = pause
	if pause then
		-- Set the dummy, increased value to prevent health from ticking down when the timer is paused
		game.BiomeTimeLimits.Penalty.Interval = game.BiomeTimeLimits.Penalty.ModVowOfPausedTimePausedTimerInterval
	else
		-- Reset the penalty interval to the original value
		game.BiomeTimeLimits.Penalty.Interval = game.BiomeTimeLimits.Penalty.ModVowOfPausedTimeOriginalInterval
	end
end

modutil.mod.Path.Wrap("StartRoom", function(base, currentRun, currentRoom)
	-- Pause the timer when loading the first room in a biome (especially for first room of the run)
	if currentRoom.BiomeStartRoom then
		if not config.disableAllTimersOutOfCombat then
			ModVowOfPausedTimeHandleTimerPause(true)
		else
			-- This pauses all timers, including the run timer, timed keepsakes and the chaos time curse
			game.AddTimerBlock(currentRun or game.CurrentRun, "ModVowOfPausedTime")
		end
	end

	base(currentRun, currentRoom)
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	-- Resume the timer when an enemy unit spawns
	if (config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat) and unit.AddToEnemyTeam then
		if not config.disableAllTimersOutOfCombat then
			ModVowOfPausedTimeHandleTimerPause(false)
		else
			game.RemoveTimerBlock(currentRun or game.CurrentRun, "ModVowOfPausedTime")
		end
	end

	base(unit, currentRun, args)
end)
