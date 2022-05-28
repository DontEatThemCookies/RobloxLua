--[[

Random String Service - version 1, 05/28/2022

This is a simple module script that picks a random 
string to return from a group of StringValue objects.

HOW TO USE:
1. Place the RandomStringService folder in ServerScriptService
2. Create as much StringValues as you want in the "Strings" subfolder
3. Require the module script using require() on the script(s) you'll use it on

If errors are encountered by RandomStringService, a warning will be shown on the
Developer Console and a number will be returned. The number will vary based on 
what error was encountered:

1 - The "Strings" folder couldn't be found
2 - No StringValue objects are in the "Strings" folder 

Refer to the script named "Example" for an example usage.

]]--