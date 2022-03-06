-- Server Location Indicator by DontEatThemCookies [03/05/22]
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local URL = "http://ip-api.com/json/"

Players.PlayerAdded:Connect(function(player)
    local PlayerGui = player:WaitForChild("PlayerGui")
    local SLocGui = script:FindFirstChild("SLocGui")
    if SLocGui then SLocGui.Parent = PlayerGui
    else warn("Couldn't load server location GUI! Aborted") return end

    local success, result = pcall(function()
        local req = HttpService:GetAsync(URL)
        return HttpService:JSONDecode(req)
    end)
    if success then
        local country = result["country"]
        local city = result["regionName"]
        if result["regionName"] == "" then city = result["city"] end
        SLocGui.TextLabel.Text = string.format("Server Location: %s/%s", country, city)
    else
        warn(string.format("Failed to get server location. Result: %s", result))
        SLocGui.Enabled = false
    end
end)
