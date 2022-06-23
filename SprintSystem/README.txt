DontEatThemCookies' Sprint System
version 1, 06/23/2022

A fairly simple system that implements player sprinting
via pressing a certain key in the keyboard. Simply put
the "SprintSystem" local script in StarterPlayerScripts.

In the SprintSystem script, you can find two 
configurable variables for you to modify to your liking:

1. "Key" of type Enum.KeyCode, the key to press in order
to toggle sprinting mode
2. "SpeedToAdd" of type number, how much studs per second
to add to the player's walk speed

The script also initializes a BoolValue parented to each
player in the server named "Sprinting" that will be true
or false depending on whether the player is currently
sprinting, creating a simple way for other scripts to
know whether a player is currently sprinting.