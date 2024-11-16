modutil.mod.Path.Wrap("UpdateTimers", function(base, elapsed)
	if game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused then
		game.CurrentRun.ActiveBiomeTimer = false
	end

	base(elapsed)

	if game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused then
		game.CurrentRun.ActiveBiomeTimer = true
	end
end)
