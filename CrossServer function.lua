local mess = game:GetService("MessagingService")
local Players = game:GetService("Players")

local msg_topic = "TestMessaging141"

local success, err = pcall(function()
	mess:SubscribeAsync(msg_topic, function(msg)
		local table = msg.Data
		if table.JobId ~= game.JobId then
			print(table.Msg)
		end
	end)
end)

if not success then warn(err) end

owner.Chatted:Connect(function(msg)
	local table = {
		JobId = game.JobId;
		Msg = "["..owner.Name.."]: "..msg;
	}
	mess:PublishAsync(msg_topic, table)
end)