-- Pause the timer when combat ends
modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	-- Do not pause the timer if we are in a Mourning Fields normal combat room
	if currentRoom.RoomSetName == "H" and string.find(currentRoom.Name, "H_Combat") then
		base(currentRoom, currentEncounter)
		return
	elseif config.disableTimerOutOfCombat or config.pauseAllTimers then
		if not config.pauseAllTimers then
			ModVowOfPausedTimeHandleTimerPause(true)
		else
			-- This pauses all timers, including the run timer, timed keepsakes and the chaos time curse
			game.AddTimerBlock(game.CurrentRun, "ModVowOfPausedTime")
		end
	end

	base(currentRoom, currentEncounter)
end)
