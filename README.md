# Vow of (Paused) Time

Alters the "Vow of Time", pausing its timer outside of combat.

This allows you to take your time after an encounter to pick up rewards, gather resources and enjoy the scenery without the pressure of the timer.

Optionally offers configuration options to alter the amount of time given by each tier of the vow per region, to either make the vow more or less challenging.

![Vow of (Paused) Time](https://github.com/user-attachments/assets/86aa1f48-0bd3-47fc-ae96-1bbb74129a1c)

You can also choose to have the mod pause *all* in-game timers outside of combat, instead of only the vow's timer.
This will pause timers on e.g. Hermes' keepsake, Chaos' curse and also the overall run clear timer. 

Pausing the timer outside of combat can be turned off in the config, in case you only want to tweak the raw numbers the vow offers.

*Note: The timer will always run in normal "Fields of Mourning" combat rooms.*

### Contribute

You can contribute to this mod by providing a translation for your native language!
To do so, follow these steps:

- Open the `src/Game/Text/TraitText.<language>.sjson.lua` file, where `<language>` is the shorthand of the language you would like to translate (e.g. `de` for German).
- Remove the leading `--` from all lines in the `newVowDescription`, `newChaosTimeCurse` and `newHermesSpeedKeepsake` tables.
- Check the `src/Game/Text/TraitText.en.sjson.lua` file for the changes that need to be made to each entry:
	- Updating the `DisplayName` of the Vow to include a `(Paused)` or equivalent change.
	- Updating the `Description` of the Vow to contain a note that the timer *will* pause, on a new line at the end.
	- Updating the `DisplayName` of the Vow's Flavor text to indicate that *some* pauses may be had.
	- Updating the `Description` of the other two entries to contain a note that the timer *will not* pause, on a new line at the end.
- Do this for all four entries in the file.
- Remove the leading `--` from the line importing the file you translated in the `main.lua`.
- Create a PR against this repository so I can review and release your changes!

The mod is currently available in the following languages:

- English
- German
