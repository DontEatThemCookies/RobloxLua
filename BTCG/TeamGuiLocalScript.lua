-- Team Changer GUI by DontEatThemCookies [02/19/2022]

-- Declarations
local Player = game:GetService("Players").LocalPlayer
local Teams = game:GetService("Teams")
local TeamGui = script.Parent
local Event = TeamGui:WaitForChild("TeamGuiEvent")
local Frame = TeamGui.ButtonFrame
local Ref = Frame.Reference
local Udim2 = UDim2.new(0,0,0.028,0)

-- Table to contain the buttons
local Buttons = {Ref}
-- Get team names, put them into a table and sort it alphabetically
local GetTeams = {}
for _,Team in pairs(Teams:GetTeams()) do table.insert(GetTeams, Team.Name) end
table.sort(GetTeams)
-- Make a button for each team and insert them into the Buttons table
for _,Team in pairs(GetTeams) do
	local Button = Ref:Clone()
	Button.Name = Teams[Team].Name
	Button.Text = Teams[Team].Name
	Button.BackgroundColor = Teams[Team].TeamColor
	Button.Visible = true
	Button.Parent = Frame
	table.insert(Buttons, Button)
end
-- Set up each button's position and respond to any button clicks
for Index,Button in pairs(Buttons) do
	if Index ~= 1 then Button.Position = Buttons[Index-1].Position + Udim2 end
	Button.MouseButton1Click:Connect(function()
		Player.TeamColor = Button.BackgroundColor
		Event:FireServer(Player)
	end)
end

Ref:Destroy()