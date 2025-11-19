local fs = require("@lune/fs")
if fs.isDir("dist") then
	fs.removeDir("dist")
end

local multitarget = require("../lune_packages/multitarget")
multitarget.build("pesde.toml", {
	luau = true,
	lune = true,
	roblox = true,
}, "dist", { "src" }, "RUNTIME", "pkg", "luau_pkg", true, "luau")

return nil
