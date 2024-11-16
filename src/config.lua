local config = {
  version = 0,
  enabled = true,
  disableTimerOutOfCombat = true,
  pauseAllTimers = true,
  timeEasyTier = 60 * 7.5,
  timeMediumTier = 60 * 6,
  timeHardTier = 60 * 4,
}

local configDesc = {
  enabled = "Whether the mod is enabled or not.",
  disableTimerOutOfCombat =
  "Whether the timer of the \"Vow of Time\" should be paused outside of combat. The timer will only run when enemies are present (includes non-reward encounter enemies in the Fields of Mourning and enemies in the Ephyra town square).",
  pauseAllTimers =
  "Whether all game timers (including e.g. the run clear timer, Hermes' keepsake or Chaos' time curse) should be paused out of combat. If false, only the timer of the \"Vow of Time\" will be paused.",
  timeEasyTier =
  "Time per region on the first (easiest) tier of the \"Vow of Time\", in seconds. The game's default is 9 minutes, the mod lowers this to 7:30 minutes.",
  timeMediumTier =
  "Time per region on the second tier of the \"Vow of Time\", in seconds. The game's default is 7 minutes, the mod lowers this to 6 minutes.",
  timeHardTier =
  "Time per region on the third (most difficult) tier of the \"Vow of Time\", in seconds. The game's default is 5 minutes, the mod lowers this to 4 minutes.",
}

return config, configDesc
