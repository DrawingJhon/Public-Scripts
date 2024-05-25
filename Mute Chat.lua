local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")
local clientChatModules = ChatService.ClientChatModules
local messageCreatorUtil = require(clientChatModules.MessageCreatorModules.Util)
local ChatSettings = require(clientChatModules.ChatSettings)
local ChatWindow = messageCreatorUtil.ChatWindow
local ChatBar = ChatWindow.ChatBar
local ChatMain = require(Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain)

local ChatWindowFrame = ChatWindow.GuiObject
local ChatBarFrame = ChatBar.GuiObject.Parent

function getClassicChatEnabled()
	if ChatSettings.ClassicChatEnabled ~= nil then
		return ChatSettings.ClassicChatEnabled
	end
	return Players.ClassicChat
end

function getBubbleChatEnabled()
	if ChatSettings.BubbleChatEnabled ~= nil then
		return ChatSettings.BubbleChatEnabled
	end
	return Players.BubbleChat
end

function bubbleChatOnly()
	return not getClassicChatEnabled() and getBubbleChatEnabled()
end

local chatBarSize = ChatBarFrame.AbsoluteSize.Y

ChatBarFrame.Size = UDim2.new(1, -(chatBarSize + 2), 0, chatBarSize)

if ChatWindowFrame:FindFirstChild("ImageButton") then
	ChatWindowFrame.ImageButton:Destroy()
end

local ChangerFrame = Instance.new("ImageButton")
ChangerFrame.Selectable = false
ChangerFrame.Image = ""
ChangerFrame.BackgroundTransparency = 0.6
ChangerFrame.BorderSizePixel = 0
ChangerFrame.Visible = true
ChangerFrame.BackgroundColor3 = ChatSettings.BackGroundColor
ChangerFrame.Size = UDim2.new(0, chatBarSize, 0, chatBarSize)
ChangerFrame.Active = true

if bubbleChatOnly() then
	ChangerFrame.Position = UDim2.new(1, -ChangerFrame.AbsoluteSize.X, 0, 0)
else
	ChangerFrame.Position = UDim2.new(1, -ChangerFrame.AbsoluteSize.X, 1, -ChangerFrame.AbsoluteSize.Y)
end

ChangerFrame.Parent = ChatWindowFrame

local Icon = Instance.new("TextLabel")
Icon.Selectable = false
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.Size = UDim2.new(0.8, 0, 0.8, 0)
Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
Icon.BackgroundTransparency = 1
Icon.Text = "😀"
Icon.TextSize = 20
Icon.Parent = ChangerFrame

local ccFrame = ChatWindow.GuiObjects.ChatChannelParentFrame

local function updateTransparency()
	ChangerFrame.BackgroundTransparency = ccFrame.BackgroundTransparency
	Icon.TextTransparency = (ccFrame.BackgroundTransparency - 0.6) / 0.4
end

updateTransparency()

ccFrame:GetPropertyChangedSignal("BackgroundTransparency"):Connect(function()
	updateTransparency()
end)

local chatEnabled = true

local realFire = ChatMain.MessagePosted.fire
function ChatMain.MessagePosted:fire(...)
	if chatEnabled then
		realFire(ChatMain.MessagePosted, ...)
	end
end

ChangerFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		chatEnabled = not chatEnabled
		Icon.Text = chatEnabled and "😀" or "🤐"
	end
end)