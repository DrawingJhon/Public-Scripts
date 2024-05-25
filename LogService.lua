local msg = Instance.new("Hint", workspace)
msg.Text = "."
Game:GetService("LogService").MessageOut:Connect(function(Message, Type)
	if Type == Enum.MessageType.MessageOutput then -- Print
		msg.Text = Message.." (Print)"
	end
	if Type == Enum.MessageType.MessageInfo then -- Info
		msg.Text = Message.." (Info)"
	end
	if Type == Enum.MessageType.MessageWarning then -- Warn
		msg.Text = Message.." (Warn)"
	end
	if Type == Enum.MessageType.MessageError then -- Error
		msg.Text = Message.." (Error)"
	end
end)
 
print("Hello, World!")