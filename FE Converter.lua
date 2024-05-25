script.Parent = owner:findFirstChildOfClass("PlayerGui")

function GetSource(http)
	return game:GetService("HttpService"):GetAsync(http)
end

local FeSource = GetSource("https://pastebin.com/raw/QCQ46dDs")
local scriptList = {}

local sp = ""
for i, v in pairs(FeSource:split("\n")) do
	if not v:match("%-%-") then
		sp = sp.." "..v
	end
end
FeSource = sp

function MakeFe(source)
	local z = NS(FeSource.." "..source, owner:findFirstChildOfClass("PlayerGui"))
	table.insert(scriptList, z)
end

function cmdFunc(msg)
	if msg:lower():sub(1,3) == "fh/" then
		local source
		local success, err = pcall(function()
			source = GetSource(msg:sub(4))
		end)
		if success then
			MakeFe(source)
		else
			assert(nil, "Unable to get url'"..tostring(msg:sub(4)).."'")
		end
	end
	if msg:lower():sub(1,3) == "fs/" then
		MakeFe(msg:sub(4))
	end
end

local remote = Instance.new("RemoteEvent", script)
remote.Name = "REEEEEEE"
remote.OnServerEvent:Connect(function(plr, pass, text)
	if plr ~= owner or pass ~= "asdAJGcvaifehlbqayispdlhobefobwapsdoucafegwu9rqalsc" then return end
	cmdFunc(text)
end)

owner.Chatted:Connect(cmdFunc)