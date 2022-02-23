--[[

EZLS Version 2 (2/23/2022)
Simple leaderstats wrapper

by DontEatThemCookies

]]--
local EZLS = {}
local Players = game:GetService("Players")

-- Create leaderstats folder for every player that joins
Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
end)

-- Stat constructor function
setmetatable(EZLS, {
	__call = function(t, valtype: string, name: string, player: Player) : ValueBase	
		local newval: ValueBase
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
})


return EZLS
