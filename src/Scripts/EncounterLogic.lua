-- Pause the timer when combat ends
modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	-- Only apply timer logic if not in a Mourning Fields normal combat room
	if (not (currentRoom.RoomSetName == "H" and string.find(currentRoom.Name, "H_Combat"))) and (config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat) then
		if not config.disableAllTimersOutOfCombat then
			mod.VowOfPausedTimeHandleTimerPause(true)
		else
			game.AddTimerBlock(game.CurrentRun, "ModVowOfPausedTime")
		end
	end

	base(currentRoom, currentEncounter)
end)

modutil.mod.Path.Wrap("WaitForArachneRewardFound", function(base, encounter)
	-- Resume the timer when entering an Arachne reward room
	-- Enemies spawn only when one is found, so one could assume the timer is always paused in this room when checking only when entering, but it should behave as a normal combat does
	if (config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat) then
		if not config.disableAllTimersOutOfCombat then
			mod.VowOfPausedTimeHandleTimerPause(false)
		else
			game.RemoveTimerBlock(game.CurrentRun, "ModVowOfPausedTime")
		end
	end

	-- The base function waits to be notified about the found reward
	base(encounter)

	-- When finding the Arachne reward, pause the timer
	if config.disableVowTimerOutOfCombat or config.disableAllTimersOutOfCombat then
		if not config.disableAllTimersOutOfCombat then
			mod.VowOfPausedTimeHandleTimerPause(true)
		else
			game.AddTimerBlock(game.CurrentRun, "ModVowOfPausedTime")
		end
	end
end)
