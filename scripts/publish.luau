local fs = require("@lune/fs")
local DateTime = require("@lune/datetime")
local process = require("@lune/process")

-- ISO 8601 date (YYYYmmddThhmmssZ)
local date = DateTime.now():formatUniversalTime("%Y%m%dT%H%M%SZ")

local packageFile = "pesde.toml"
local packageContents = fs.readFile(packageFile)
local matchStart, matchEnd = string.find(packageContents, 'version = ".-"')

local function writePackage(contents: string)
	fs.writeFile(packageFile, contents)
end

writePackage(
	string.sub(packageContents, 1, assert(matchStart) - 1)
		.. `version = "0.0.0-{date}"`
		.. string.sub(packageContents, assert(matchEnd) + 1)
)

pcall(function()
	require("./build")
	process.exec("pesde", { "publish" }, {
		cwd = "dist",
		shell = true,
		stdio = "forward",
	})
end)

writePackage(packageContents)
