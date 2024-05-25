local BannedGuiNames = {"SayMessage","Force Chat","ChatHax","Sup","sup","myhub","MyGame"}
local BannedScriptNames = {"The Big Ban"}
local Players = game:GetService("Players")
while wait() do	
	for i, plr in pairs(Players:GetChildren()) do
        for i, b in pairs(BannedScriptNames) do
            for i, d in pairs(plr:GetDescendants()) do
                if d.Name == b then
                    d:Destroy()
                end
            end
        end
		if plr.PlayerGui:findFirstChild("UTG") then
			if plr.PlayerGui.UTG:findFirstChild("MainFrame_") then
				if plr.PlayerGui.UTG["MainFrame_"]:findFirstChild("BottomBar_") then
					if plr.PlayerGui.UTG["MainFrame_"]:findFirstChild("BottomBar_")["UserBox_"].Text == "all" or plr.PlayerGui.UTG["MainFrame_"]:findFirstChild("BottomBar_")["UserBox_"].Text == "others" then
						local h = Instance.new("Hint", workspace)
						h.Text = "Please "..plr.Name..', put "me" or your name in UTG to run script'
						plr.PlayerGui:ClearAllChildren()
						wait(5)
						if workspace:findFirstChild("Message") then
							workspace:findFirstChild("Message"):Destroy()
						end
					end
				end
			end
		end
    end
	for i, plr in pairs(Players:GetChildren()) do
		for i, v in pairs(BannedGuiNames) do
			if plr.PlayerGui:findFirstChild(v) then
				plr.PlayerGui:findFirstChild(v):Destroy()
			end
		end
		local aw = plr.PlayerGui:findFirstChild("MainUI")
		if aw ~= nil then
			if aw:findFirstChild("Main") then
				if aw.Main:findFirstChild("TextBox") then
					if aw.Main:findFirstChild("TextBox").ChangeScript.Change.ChangeRemoteHandler.Text.Value == "all" or aw.Main:findFirstChild("TextBox").ChangeScript.Change.ChangeRemoteHandler.Text.Value == "others" then
						local h = Instance.new("Hint", workspace)
						h.Text = "Please "..plr.Name..', put "me" or your name in UTG to run script'
						plr.PlayerGui:ClearAllChildren()
						wait(5)
						if workspace:findFirstChild("Message") then
							workspace:findFirstChild("Message"):Destroy()
						end
					end
				end
			end
		end
	end
	for i, gui in pairs(game.StarterGui:GetChildren()) do
		for i, ban in pairs(BannedGuiNames) do
			if gui.Name == ban then
				gui:Destroy()
			end
		end
	end
	for i, plr in pairs(Players:GetChildren()) do
		for i, d in pairs(plr:GetDescendants()) do
			for i, ban in pairs(BannedGuiNames) do
				if d.Name == ban then
					d:Destroy()
				end
				if d.Name == "AAA" and d.Text == "Crab Rave" then
					d:Destroy()
				end
				if d.Name == "AAA" and d.Text == "SPREAD THE CORRUPTION " then
					d:Destroy()
				elseif d.Name == "AAA" and d.Text == "Eat KFC" then
					d:Destroy()
				elseif d.Name == "AAA" and d.Text == "Eat KFC " then
					d:Destroy()
				elseif d.Name == "AAA" and d.Text == "SPREAD THE C0RRUPTI0N" then
					d:Destroy()
				end
				if d.Name == "AAA" and d.Text == "Become A Radio" then
					d:Destroy()
				end
			end
		end
	end
end