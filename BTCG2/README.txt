Basic Team Changer GUI Version 2 (02/21/2022)
Scripted by DontEatThemCookies

The Basic Team Changer GUI is exactly what its
name entails. It's really simple to set up:

1. Place "TeamGui" in StarterGui
2. Setup is complete!

BTCG2 automatically makes buttons for each team
and colored the team's color, so you don't have 
to manually make or configure any buttons. Also,
the team buttons are sorted alphabetically.

Unlike its predecessor, BTCG2 finally comes with
configurability! It is now possible to restrict
team membership to members of a certain group, or
members of a group that hold a certain rank. This
can be configured in TeamGuiScript. Use the format:

{
  ["Team Name"] = {GroupId, RankId (optional)},
}

Group and Rank IDs must be numbers
and RankId must be between 0 to 255.

For example:
{
  ["Military"] = {1234567},
  ["Officers"] = {1234567, 8},
  ["Owner"] = {1234567, 255},
}

There's also a configurable cooldown time. Its value
is how many seconds a player would need to wait until
the player can change teams again.
