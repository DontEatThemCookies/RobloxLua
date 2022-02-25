-- Declarations
local SFilter = require(game:GetService("ServerScriptService").SimpleFilter)
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	local MyFilteredString = SFilter("lmao", plr.UserId, "ChatForUser")
	print(MyFilteredString) -- should be "####"
end)
