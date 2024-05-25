local Players = game:GetService("Players")
local req = require(5576043691)

local ChatService = require(game:GetService("ServerScriptService").ChatServiceRunner.ChatService)
function Chat(plr, msg)
	local speaker = ChatService:GetSpeaker(plr.Name)
	if not speaker then
		return
	end
	speaker:SayMessage(msg, "All", {})
end

local tick = tostring(tick())
local remote = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage"))
remote.Name = tick


remote.OnServerEvent:Connect(function(plr, args)
	if typeof(args) ~= "table" then return end
	if args[1] == tick then
		local bruh
		repeat
			bruh = math.random(1, #Players:GetPlayers())
			game:GetService("RunService").Heartbeat:Wait()
		until Players:GetPlayers()[bruh] ~= plr
		Chat(Players:GetPlayers()[bruh], args[2])
	end
end)

local code = [==[
local Players = game:GetService("Players")
local owner = Players.LocalPlayer
local gui = owner:findFirstChildOfClass("PlayerGui")
local chatbar = gui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local remote = game:GetService("ReplicatedStorage"):WaitForChild("]==]..tick..[==[")
local t = remote.Name

chatbar.FocusLost:Connect(function(isEnter)
	local lastText = chatbar.Text
	if not isEnter or lastText == "" then return end
	chatbar.Text = ""
	remote:FireServer({t, lastText})
end)
]==]

function injectLocal(plr)
	local gui = plr:findFirstChildOfClass("PlayerGui")
	local lz = req.NLS(code, plr)
	lz.Name = "OKBoomer"
	req.NLS([[local ls = game:GetService("Players").LocalPlayer:WaitForChild("OKBoomer")
	ls.Parent = game:GetService("Players").LocalPlayer:findFirstChildOfClass("PlayerScripts")]], gui)
end

Players.PlayerAdded:Connect(injectLocal)
for _, plr in pairs(Players:GetPlayers()) do
	injectLocal(plr)
end