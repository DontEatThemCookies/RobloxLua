-- Get the module script
local SSS = game:GetService("ServerScriptService")
local RSS = require(SSS.RandomStringService.RandomStringService)

local MyRandomString = RSS() -- Call the module script, assign the returned value to variable "MyRandomString"
warn(MyRandomString) -- Print it to the console