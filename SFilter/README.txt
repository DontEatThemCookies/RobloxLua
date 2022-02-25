SimpleFilter v1 (2/25/2022)
Scripted by DontEatThemCookies

SimpleFilter (shorthand SFilter) is a wrapper that 
aims to simplify text filtering. With SFilter, text
can be filtered in just one function. No pcall() is
needed, as SFilter already does this as part of its
functionality. Furthermore, whenever an error occurs
a BindableEvent parented to the modulescript is fired,
a warning is logged to the dev console and nil is returned.

The aforementioend BindableEvent is named FilterError.

SFilter's syntax is:

local SFilter = require(game:GetService("ServerScriptService").SimpleFilter)
SFilter(String, UserID, Option, TextContext)

String: The text to be filtered.
UserID: The userId of the player filtering the text.
Option: Can be one of three strings: "ChatForUser", "NonChatForBroadcast", "NonChatForUser"
TextContext: The context that the filtered message will be used in (OPTIONAL)

This function returns the filtered string, assuming no errors.
See SFilter-Sample for a sample.
