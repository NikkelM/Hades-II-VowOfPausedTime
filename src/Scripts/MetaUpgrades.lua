modutil.mod.Path.Wrap("IsBiomeTimerPaused", function(base)
	if game.CurrentRun.ModVowOfMoreOrLessTimeTimerPaused then
		return true
	end

	base()
end)
