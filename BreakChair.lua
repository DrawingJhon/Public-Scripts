local player = game:GetService("Players").LocalPlayer
local char = player.Character
local human = char.Humanoid
local uis = game:GetService("UserInputService")

if _G.ResetSeat then
	_G.ResetSeat()
end

local jumping = false
local lastSeat = nil

local conn = human:GetPropertyChangedSignal("SeatPart"):Connect(function()
	if jumping then
		lastSeat = nil
		jumping = false
		return
	end
	
	local seat = human.SeatPart
	if seat then
		lastSeat = seat
	elseif lastSeat then
		lastSeat = nil
		task.wait(0.05)
		lastSeat:Sit(human)
		print("Recoverint sit")
	end
end)

local jc = uis.JumpRequest:Connect(function()
	jumping = true
end)

_G.ResetSeat = function()
	conn:Disconnect()
	jc:Disconnect()
end