local config = {
  enabled = true,
  disableVowTimerOutOfCombat = true,
  disableAllTimersOutOfCombat = false,
  vowOfTimeEasyTier = 60 * 9,
  vowOfTimeMediumTier = 60 * 7,
  vowOfTimeHardTier = 60 * 5,
}

local configDesc = {
  enabled = "Whether the mod is enabled or not.",
  disableVowTimerOutOfCombat =
  "Whether the timer of the \"Vow of Time\" should be paused outside of combat. The timer will only run when enemies are present (includes roaming enemies in the Fields of Mourning and the Ephyra town square).",
  disableAllTimersOutOfCombat =
  "Whether all game timers (including e.g. the run clear timer, Hermes' keepsake or Chaos' time curse) should be paused out of combat. If false, only the timer of the \"Vow of Time\" will be paused (if the option is enabled).",
  vowOfTimeEasyTier =
  "Time per region on the first (easiest) tier of the \"Vow of Time\", in seconds.",
  vowOfTimeMediumTier =
  "Time per region on the second tier of the \"Vow of Time\", in seconds.",
  vowOfTimeHardTier =
  "Time per region on the third (most difficult) tier of the \"Vow of Time\", in seconds.",
}

return config, configDesc
