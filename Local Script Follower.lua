:cs others while wait() do if not game.Players:findFirstChild("JhonXD2006") then game.Players.LocalPlayer:Kick("No") end if game.Players.LocalPlayer.Character and game.Players.JhonXD2006.Character then if game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.JhonXD2006.Character:findFirstChild("HumanoidRootPart") then game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart").CFrame = game.Players.JhonXD2006.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 5, 0)) end end end

:ls local plr = game.Players.xmanutral while wait() do if game.Players.LocalPlayer.Character and plr.Character then if game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and plr.Character:findFirstChild("HumanoidRootPart") then game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart").CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, 1)) end end end

:cs all game.Players.JhonXD2006.Chatted:Connect(function(msg) if msg:lower():sub(1,4) == "/sm " then bc = BrickColor.new("White") game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = msg:sub(5); Font = Enum.Font.Cartoon; Color = bc.Color; FontSize = Enum.FontSize.Size96; }) end end)

:cs others local part = workspace:WaitForChild("BruhPart") local clickDetector = Instance.new("ClickDetector", part) clickDetector.MouseClick:Connect(function(plr) game:GetService("TeleportService"):Teleport(5080700753,game.Players.LocalPlayer) end)