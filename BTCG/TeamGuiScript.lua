-- Team Changer GUI by DontEatThemCookies [02/19/2022]
script.Parent:WaitForChild("TeamGuiEvent").OnServerEvent:Connect(function(player)
	if player.Parent == game.Players then
		player.Character:BreakJoints()
		player:LoadCharacter()
	end
end)