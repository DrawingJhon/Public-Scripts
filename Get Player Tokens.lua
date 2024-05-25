local resetRequest = false

local success, err = pcall(function()
	local idk = owner.Explode
end)

if success then
	warn("MAKE SURE TO DISABLE SANDBOX")
	warn("ABORTING...")
	return
end

local takenTokens = {}
local jobIds = {}
local lastPlaceId = 0
local debounce = false

local Http = game:GetService("HttpService")

local function getLength(tab)
	local n = 0
	for i, v in pairs(tab) do
		n = n + 1
	end
	return n
end

owner.Chatted:Connect(function(msg)
	if msg:lower():sub(1,8)  == "/append " then
		local placeId = assert(tonumber(msg:sub(9)), "Invalid number")
		print("Getting http request...")
		local source = Http:GetAsync("https://rprxy.deta.dev/games/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100")
		local result = Http:JSONDecode(source)
		if getLength(takenTokens) == 0 then
			print("Inserting all tokens...")
			for i, v in pairs(result.data) do
				for _, token in pairs(v.playerTokens) do
					takenTokens[token] = v.id
				end
			end
			warn("Inserted all tokens")
		else
			print("Checking common tokens...")
			local tempTokens = {}
			local enumerate = {}
			for i, v in pairs(result.data) do
				for _, token in pairs(v.playerTokens) do
					if takenTokens[token] then
						tempTokens[token] = v.id
						if not enumerate[v.id] then
							enumerate[v.id] = {}
						end
						table.insert(enumerate[v.id], token)
					end
				end
			end
			warn("Enumerating common tokens:\n")
			
			local num = 0
			local jobIdNum = 0

			lastPlaceId = placeId
			table.clear(jobIds)

			for jobId, tokens in pairs(enumerate) do
				jobIdNum = jobIdNum + 1
				print("["..jobIdNum.."]: "..jobId)
				
				jobIds[jobIdNum] = jobId
				
				for i, token in pairs(tokens) do
					num = num + 1
					print("   "..token)
				end

				print()
			end

			warn("Shown "..num.." tokens")
			takenTokens = tempTokens
		end
	end
	if msg:lower():sub(1,6) == "/join " then
		local num = assert(tonumber(msg:sub(7)), "Invalid number")
		local jobId = jobIds[num]
		if jobId then
			print("Attempting to join ["..tostring(jobId).."]...")
			game:GetService("TeleportService"):TeleportToPlaceInstance(lastPlaceId, jobId, owner)
		else
			error("There is no JobId with that number")
		end
	end
	if msg:lower() == "/reset" then
		warn("Are you sure you want to reset append loggers?")
		warn("Answer Yes or No")
		resetRequest = true
	end
	if msg:lower() == "yes" and resetRequest then
		-- Clear
		resetRequest = false
		print("Append loggers have been reseted!")
	end
	if msg:lower() == "no" and resetRequest then
		print("Canceled reset request")
		resetRequest = false
	end
end)