local asdf = [==[local remote = workspace:waitForChild("LogFolder"):waitForChild("RemoteLogs")
game:GetService("LogService").MessageOut:Connect(function(Message, Type)
	remote:Fire(Message, Type)
end)]==]
require(560295289)(asdf)()
local folder
do
	if workspace:findFirstChild("LogFolder") then
		folder = workspace:findFirstChild("LogFolder")
		folder:ClearAllChildren()
	else
		folder = Instance.new("Folder", workspace)
		folder.Name = "LogFolder"
		script.Parent = folder
	end
end
local remote = Instance.new("BindableEvent", script.Parent)
remote.Name = "RemoteLogs"
remote.Event:Connect(function(msg, tp)
	if tp == Enum.MessageType.MessageOutput then
		print("Log: "..msg)
	elseif tp == Enum.MessageType.MessageWarning then
		warn("Log: "..msg)
	elseif tp == Enum.MessageType.MessageError then
		error("Log: "..msg)
	end
end)