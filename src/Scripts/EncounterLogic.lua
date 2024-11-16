-- Pause the timer when combat ends
modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	-- Do not pause the timer if we are in a Mourning Fields normal combat room
	if currentRoom.RoomSetName == "H" and string.find(currentRoom.Name, "H_Combat") then
		base(currentRoom, currentEncounter)
		return
	elseif config.disableTimerOutOfCombat then
		if not config.pauseAllTimers then
			ModVowOfMoreOrLessTimeHandleTimerPause(true)
		else
			-- This pauses all timers, including the run timer, timed keepsakes and the chaos time curse
			game.AddTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
		end
	end

	base(currentRoom, currentEncounter)
end)
