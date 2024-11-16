local config = {
  version = 0;
  enabled = true;
  disableTimerOutOfCombat = true;
  pauseVowTimerOnly = true;
  timeEasyTier = 60*9;
  timeMediumTier = 60*7;
  timeHardTier = 60*5;
}

local configDesc = {
  enabled = "Whether the mod is enabled or not.";
  disableTimerOutOfCombat = "Whether the timer of the \"Vow of Time\" should be paused when combat ends or not.";
  pauseVowTimerOnly = "Whether only the timer of the \"Vow of Timer\" should be paused out of combat. If false, all game timers will pause out of combat (e.g. run timer, timed keepsakes, chaos time curse etc.)";
  timeEasyTier = "How much time per region you are given on the first tier of the \"Vow of Time\", in seconds. Can also be expressed as e.g. \"60*9\". Default is 9 minutes, suggested new time with this mod is 7:30 minutes.";
  timeMediumTier = "How much time per region you are given on the second tier of the \"Vow of Time\", in seconds. Can also be expressed as e.g. \"60*7\". Default is 7 minutes, suggested new time with this mod is 6 minutes.";
  timeHardTier = "How much time per region you are given on the third tier of the \"Vow of Time\", in seconds. Can also be expressed as e.g. \"60*5\" Default is 5 minutes, suggested new time with this mod is 4 minutes.";
}

return config, configDesc