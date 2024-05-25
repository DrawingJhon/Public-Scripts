local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Chat = game:GetService("Chat")

function PlayerChatted(func, fromChat)
	if fromChat then
		return Chat.Chatted:Connect(function(obj, message)
			local player = Players:GetPlayerFromCharacter(obj)
			if player then
				func(player, message)
			end
		end)
	else
		local ChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents", math.huge)
		local MessageEvent = ChatEvents:WaitForChild("OnMessageDoneFiltering", math.huge)
		local SpeakEvent = ChatEvents:WaitForChild("SayMessageRequest", math.huge)
		
		return MessageEvent.OnClientEvent:Connect(function(data)
			if data ~= nil then
				local speakerName = data.FromSpeaker
				local message = data.Message
				local player = nil
				for i, v in pairs(Players:GetPlayers()) do
					if v.Name:lower() == speakerName:lower() then
						player = v
					end
				end
				if player then
					func(player, message)
				end
			end
		end)
	end
end

function Speak(message)
	game:GetService("ReplicatedStorage").Packages.Knit.Services.RadioService.RF.SendMessage:InvokeServer(message)

	--SpeakEvent:FireServer(message, "All")
end

local Target = nil

local Gui = Instance.new("ScreenGui")
Gui.Name = math.random()
Gui.Parent = CoreGui

local Hint = Instance.new("TextLabel", Gui)
Hint.AnchorPoint = Vector2.new(0.5, 1)
Hint.Position = UDim2.new(0.5, 0, 1, -70)
Hint.Size = UDim2.new(0, 250, 0, 30)
Hint.BackgroundTransparency = 0.6
Hint.BackgroundColor3 = Color3.new(0, 0, 0)
Hint.TextColor3 = Color3.new(0.7, 0.7, 0.7)
Hint.TextSize = 16
Hint.Font = "Arial"
Hint.BorderSizePixel = 0
Hint.Text = "No one"

local Tool = Instance.new("Tool", LocalPlayer:FindFirstChildOfClass("Backpack"))
Tool.Name = "Replicate Messages"
Tool.RequiresHandle = false
Tool.CanBeDropped = false

local activated = UIS.InputBegan:Connect(function(input)
	if not (input.UserInputType == Enum.UserInputType.MouseButton1 and Tool.Parent == LocalPlayer.Character) then
		return
	end
	local hit = Mouse.Target
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	Target = player
	if player then
		Hint.Text = player.Name
		Hint.TextColor3 = Color3.new(1, 1, 1)
	else
		Hint.Text = "No one"
		Hint.TextColor3 = Color3.new(0.7, 0.7, 0.7)
	end
end)

local chatted = PlayerChatted(function(player, message)
	if player == Target then
		Speak(message)
	end
end, true)

local removing = Players.PlayerRemoving:Connect(function(player)
	if player == Target then
		Target = nil
		Hint.Text = "No one"
		Hint.TextColor3 = Color3.new(0.7, 0.7, 0.7)
		StarterGui:SetCore("SendNotification", {
			Title = player.Name.." left";
			Text = "Player has disconnected from the server.";
			Duration = 10;
		})
	end
end)

local changed; changed = Tool.AncestryChanged:Connect(function()
	if not Tool:IsDescendantOf(game) then
		Gui:Destroy()
		chatted:Disconnect()
		activated:Disconnect()
		removing:Disconnect()
		changed:Disconnect()
	end
end)