local config = {
  version = 0;
  enabled = true;
  disableTimerOutOfCombat = true;
  timeEasyTier = 60*9;
  timeMediumTier = 60*7;
  timeHardTier = 60*5;
}

local configDesc = {
  enabled = "Whether the mod is enabled or not.";
  disableTimerOutOfCombat = "Whether the timer of the \"Vow of Time\" should be paused when combat ends or not.";
  timeEasyTier = "How much time per region you are given on the first tier of the \"Vow of Time\", in seconds. Can also be expressed as e.g. \"60*9\"";
  timeMediumTier = "How much time per region you are given on the second tier of the \"Vow of Time\", in seconds. Can also be expressed as e.g. \"60*7\"";
  timeHardTier = "How much time per region you are given on the third tier of the \"Vow of Time\", in seconds. Can also be expressed as e.g. \"60*5\"";
}

return config, configDesc