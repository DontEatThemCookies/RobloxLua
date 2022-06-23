-- DontEatThemCookies' Sprint System v1 [06/23/2022] (Recommended Location: StarterPlayerScripts)

-- Configuration
local Key = Enum.KeyCode.LeftShift -- The keyboard key to toggle sprint with (Enum.KeyCode)
local SpeedToAdd = 30              -- How much to modify the player's speed by, in studs/second (number)

-- Definitions
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Define the "Sprinting" BoolValue and ensure its existence
local Sprinting = Player:FindFirstChild("Sprinting")
if not Sprinting then
	Sprinting = Instance.new("BoolValue")
	Sprinting.Name = "Sprinting"
	Sprinting.Value = false
	Sprinting.Parent = Player
end

-- Detect keyboard inputs and toggle sprinting accordingly
UIS.InputBegan:Connect(function(input, GPE)
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if input.KeyCode ~= Key then return end

	if not Sprinting.Value then
		Humanoid.WalkSpeed += SpeedToAdd
	else
		Humanoid.WalkSpeed -= SpeedToAdd
	end
	Sprinting.Value = not Sprinting.Value
end)