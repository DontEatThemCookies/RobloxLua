EZLS Version 1 (02/08/2022)
Scripted by DontEatThemCookies

EZLS is a rudimentary leaderstats wrapper that 
shortens the process of making a basic leaderboard.

Gone are the days of manual folder intialization:
EZLS automatically creates "leaderstats" folders for 
every player. The EZLS.new() constructor is used to
create the stats themselves. Its syntax is as follows:

EZLS.new([type], [name], [player])

[type] can be one of three strings: "int" corresponds to
an IntValue, "num" corresponds to a NumberValue and "string"
corresponds to a StringValue.

[name] can be any string. This will be the value object's name.

[player] must be a player instance. For example, this could be 
the player argument given by the 'game.Players.PlayerAdded' event.

This function returns the newly-created stat value, allowing for
normal manipulation. See Sample.lua for a code sample.
