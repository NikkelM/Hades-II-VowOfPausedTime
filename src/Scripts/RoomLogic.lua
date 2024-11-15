-- modutil.mod.Path.Wrap("StartEncounter", function(base, currentRun, currentRoom, encounter)
-- 	base(currentRun, currentRoom, encounter)

-- 	-- Remove the timer block when combat starts
-- 	print(encounter.InProgress)
-- 	if config.disableTimerOutOfCombat and encounter.InProgress then
-- 		print("Removing timer block (StartEncounter)")
-- 		game.RemoveTimerBlock(currentRun, "ModVowOfMoreOrLessTime")
-- 	end

-- end)

-- modutil.mod.Path.Wrap("EndEncounterEffects", function(base, currentRun, currentRoom, currentEncounter)
-- 	-- Add the timer block when combat starts
-- 	if config.disableTimerOutOfCombat then
-- 		print("Adding timer block (EndEncounterEffects)")
-- 		game.AddTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
-- 	end

-- 	base(currentRun, currentRoom, currentEncounter)
-- end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	-- Remove the timer block when a unit is spawned
	if config.disableTimerOutOfCombat and unit.AddToEnemyTeam then
		print("Removing timer block (SetupUnit)")
		game.RemoveTimerBlock(currentRun or game.CurrentRun, "ModVowOfMoreOrLessTime")
	end

	base(unit, currentRun, args)
end)

modutil.mod.Path.Wrap("BeginOpeningEncounter", function(base, encounter)
	-- Add the timer block when entering the first room of the run
	if config.disableTimerOutOfCombat then
		print("Adding timer block (BeginOpeningEncounter)")
		game.AddTimerBlock(game.CurrentRun, "ModVowOfMoreOrLessTime")
	end

	base(encounter)
end)
