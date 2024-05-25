local Player = game:GetService("Players").LocalPlayer
local Gui = Player:findFirstChildOfClass("PlayerGui")
local Chat = Gui:findFirstChild("Chat") or Gui:findFirstChild("SB_Chat") or error("No chat found")
local Scroller = Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller

Scroller.ChildAdded:Connect(function(frame)
	local conn
	conn = frame.Changed:Connect(function(p)
	end)
	if p == "Position" or true then
			conn:Disconnect()
			local lastPos = frame[p]
			local TS = game:GetService("TweenService")
			frame.Position = lastPos + UDim2.new(0, -20, 0, 0)
			frame:TweenPosition(lastPos, "Out", "Elastic", 1, true)
	end
end)