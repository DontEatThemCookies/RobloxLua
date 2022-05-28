-- RandomStringService version 1 (05/28/2022) by DontEatThemCookies
local RandomStringService = {}

local RSS = script.Parent
local Strings = RSS:FindFirstChild("Strings")

local Metatable = {
	__call = function(t)
		if not Strings then warn("RandomStringService couldn't find the Strings folder!") return 1 end
		local TableOfStrings = Strings:GetChildren()
		local RandomIndex, Object
		repeat
			RandomIndex = Random.new():NextInteger(1, #TableOfStrings)
			Object = TableOfStrings[RandomIndex]
			if not Object then warn("No StringValue objects are in the Strings folder!") return 2 end
		until Object:IsA("StringValue")
		return Object.Value
	end,
}
setmetatable(RandomStringService, Metatable)

return RandomStringService