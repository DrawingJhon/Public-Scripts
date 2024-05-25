--Bubble chat for full server by Rufus14 (with roblox's ass filter)
plrs = game:GetService("Players")
for i,v in pairs(plrs:GetChildren()) do
	if v.ClassName == "Player" then
		local chatalready = v:findFirstChild("HasChat")
		if chatalready then
			chatalready:destroy()
		end
	end
end
while wait(1) do
	for i,v in pairs(plrs:GetChildren()) do
		if v.ClassName == "Player" then
			local chatalready = v:findFirstChild("HasChat")
			if not chatalready then
				local chatyes = Instance.new("BoolValue", v)
				chatyes.Name = "HasChat"
				local function dochat(message)
					if v.Character then
						if v.Character:findFirstChild("Head") then
							if string.sub(message,1,2) == "/e" or string.sub(message,1,2) == "/w" then
else
								local assfilter = game:GetService("Chat"):FilterStringForBroadcast(message, v)
								game.Chat:Chat(v.Character.Head,assfilter,"White")
							end
						end
					end
				end
				v.Chatted:connect(dochat)
			end
		end
	end
end