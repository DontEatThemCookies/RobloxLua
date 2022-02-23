-- Require the EZLS module script
local EZLS = require(game:GetService("ServerScriptService").EZLS2)
local Players = game:GetService("Players")

-- Execute everytime a player joins
Players.PlayerAdded:Connect(function(player)
	-- Create a new IntValue leaderstat named "Points"
	local points = EZLS("int", "Points", player)
	-- Create a new StringValue leaderstat named "Text"
	local text = EZLS("string", "Text", player)
	-- Manipulate the stats normally
	text.Value = "Hello!"
	while wait(1) do
		points.Value += 1
	end
end)
