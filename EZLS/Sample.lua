-- Require the EZLS module script
local EZLS = require(game.ServerScriptService.EZLS)

-- Execute everytime a player joins
game.Players.PlayerAdded:Connect(function(player)
	-- Create a new IntValue leaderstat named "Points"
	local points = EZLS.new("int", "Points", player)
	-- Create a new StringValue leaderstat named "Text"
	local text = EZLS.new("string", "Text", player)
	-- Manipulate the stats normally
	text.Value = "Hello!"
	while wait(1) do
		points.Value = points.Value + 1
	end
end)
