--[[

EZLS Version 1 (2/8/2022)
simple leaderstats wrapper

by DontEatThemCookies

]]--
local EZLS = {}

-- Create leaderstats folder for every player that joins
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
end)

-- Stat constructor function
function EZLS.new(valtype: string, name: string, player: Player) : ValueBase	
	local newval
	if valtype == "int" then
		-- New IntValue stat (can store whole integers)
		newval = Instance.new("IntValue")
	elseif valtype == "num" then
		-- New NumberValue stat (can store decimal numbers)
		newval = Instance.new("NumberValue")
	elseif valtype == "string" then
		-- New StringValue stat (can store strings)
		newval = Instance.new("StringValue")
	else
		-- Warn that an invalid type was passed
		warn("Invalid argument 'valtype' (must be int/num/string)")
		return
	end
	
	newval.Name = name
	newval.Parent = player:WaitForChild("leaderstats")
	return newval
end

return EZLS
