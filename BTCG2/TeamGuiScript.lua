-- Team Changer GUI 2.1 by DontEatThemCookies [02/22/2022]

-- CONFIGURATION
local TeamTable = {
	-- FORMAT:  ["TeamName"] = {GroupId, RankId (optional)},
	-- EXAMPLE: ["Military"] = {1234567}, ["Officers"] = {1234567, 8},
}
local Cooldown = 5              -- How many seconds before a player can change teams again



-- MAIN CODE

-- Declarations
local Players = game:GetService("Players")
local Teams   = game:GetService("Teams")
local Event   = script.Parent:WaitForChild("TeamGuiEvent")

local Dbounce = false
local fmt     = string.format
local clamp   = math.clamp

local function ChangeTeam(player: Player, team: string)
	-- Perform the actual team changing
	local ActualTeam = Teams:FindFirstChild(team)
	if not ActualTeam then return end
	player.Team = ActualTeam
	player.Character:BreakJoints()
	player:LoadCharacter()
	
	-- Debounce
	wait(Cooldown)
	Dbounce = false
end

Event.OnServerEvent:Connect(function(player: Player, team: string)
	if not Dbounce then
		Dbounce = true
		
		-- If 'team' is not a valid team then return
		if not Teams:FindFirstChild(team) then return end
		-- If the team is not in the table then assume team can be joined without restrictions
		if not TeamTable[team] then ChangeTeam(player, team) return end
		-- Get the group ID and rank ID
		local GroupId = TeamTable[team][1]
		local RankId  = TeamTable[team][2]
		-- Handle group ID misconfiguration (missing or invalid value)
		if not GroupId or type(GroupId) ~= "number" then 
			warn(fmt("misconfigured team '%s' - invalid/missing group ID", team))
			Event:FireClient(player, fmt("Misconfigured team '%s'", team))
			wait(Cooldown)
			Dbounce = false
			return
		end
		-- Assume that lowest group rank is required if rank ID is unspecified or misconfigured
		if not RankId or (RankId and type(RankId) ~= "number") then RankId = 1 end
		-- Ensure that the rank ID remains in the valid range of 0-255
		RankId = clamp(RankId, 0, 255)
		
		-- Deny team change if player does not meet prerequisites
		if player:GetRankInGroup(GroupId) < RankId then 
			Event:FireClient(player, fmt("Cannot join team '%s'", team))
			wait(Cooldown)
			Dbounce = false
			return 
		end
		
		-- All good, change the player's team
		ChangeTeam(player, team)
	else
		Event:FireClient(player, "On cooldown!")
	end
end)
