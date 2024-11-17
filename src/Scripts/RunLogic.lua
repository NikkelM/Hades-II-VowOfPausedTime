modutil.mod.Path.Wrap("UpdateTimers", function(base, elapsed)
	local wasActiveBiomeTimerEnabled = game.CurrentRun.ActiveBiomeTimer
	-- Quickly toggles the ActiveBiomeTimer off to make sure the time doesn't tick down when it shouldn't
	if game.CurrentRun.ModVowOfPausedTimeTimerPaused and wasActiveBiomeTimerEnabled then
		game.CurrentRun.ActiveBiomeTimer = false
	end

	base(elapsed)

	-- Re-enable the timer variable to make sure other timers dependent on it can still run (e.g. keepsakes, run timer)
	-- Only enable it if it was enabled before the wrap, otherwise the timer sticks around after a run ends
	if game.CurrentRun.ModVowOfPausedTimeTimerPaused and wasActiveBiomeTimerEnabled then
		game.CurrentRun.ActiveBiomeTimer = true
	end
end)
