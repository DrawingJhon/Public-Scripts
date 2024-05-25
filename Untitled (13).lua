local HttpService = game:GetService("HttpService")
local DataStore = game:GetService("DataStoreService")
local savedStrings = DataStore:GetDataStore("StrValLinksHttp")
local links = {}
local gLinks = {}

for _, link in pairs(links) do
	spawn(function()
		local str, data
		local com, er = pcall(function()
			str = HttpService:GetAsync(link)
		end)
		if com then
			gLinks[link] = str
		end
		local success, err = pcall(function()
			data = savedStrings:GetAsync(link.."_source")
		end)
		if success then
			if gLinks[link] then
				if gLinks[link] ~= data then
					data = gLinks[link]
					local success, err = pcall(function()
						savedStrings:SetAsync(link.."_source", gLinks[link])
					end)
					if success then
						warn(link.." source updated!")
					else
						warn("An error ocurred setting datastore async: ".err)
					end
				end
			end
			spawn(function()
				loadstring(data)()
			end)
		else
			warn("An error ocurred getting datastore async: "..err)
		end
	end)
end