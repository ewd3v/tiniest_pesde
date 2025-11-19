--!strict

local runtimeLib = if _G.RUNTIME == "lune"
	then require("@self/tiniest_for_lune")
	elseif _G.RUNTIME == "roblox" then require("@self/tiniest_for_roblox")
	else require("@self/tiniest")

return setmetatable({
	expect = require("@self/tiniest_expect"),
	github_actions = require("@self/tiniest_github_actions"),
	plugin = require("@self/tiniest_plugin"),
	pretty = require("@self/tiniest_pretty"),
	quote = require("@self/tiniest_quote"),
	snapshot = require("@self/tiniest_snapshot"),
	time = require("@self/tiniest_time"),
	tiniest = require("@self/tiniest"),

	for_runtime = runtimeLib,
}, { __index = runtimeLib })
