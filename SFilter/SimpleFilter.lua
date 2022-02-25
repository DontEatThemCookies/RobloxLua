--[[

SimpleFilter v1 (2/25/2022)
Wrapper to simplify text filtering

by DontEatThemCookies

]]--
local SFilter     = {}
local FilterError = script.FilterError
local TextSvc     = game:GetService("TextService")
local RunSvc      = game:GetService("RunService")

local function Error(msg: string)
	local ErrorMessage = "FilterError: "..msg
	warn(ErrorMessage)
	FilterError:Fire(ErrorMessage)
end

setmetatable(SFilter, {__call = 
	function(t, String: string, UserID: number, Option: string, TextContext: Enum.TextFilterContext): string
		local success, result = pcall(function()
			if RunSvc:IsStudio() then Error("filtering only works in non-Studio servers") return end
			local FilterResult = TextSvc:FilterStringAsync(String, UserID, TextContext or Enum.TextFilterContext.PrivateChat)
			local TextResult = ""
			if Option == "ChatForUser" then
				TextResult = FilterResult:GetChatForUserAsync(UserID)
			elseif Option == "NonChatForBroadcast" then
				TextResult = FilterResult:GetNonChatStringForBroadcastAsync()
			elseif Option == "NonChatForUser" then
				TextResult = FilterResult:GetNonChatStringForUserAsync(UserID)
			else
				Error("invalid parameter 'Option'")
				return
			end
			return TextResult
		end)
		if success then return result else Error(result) end
	end
})

return SFilter
