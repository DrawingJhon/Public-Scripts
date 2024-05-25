local player = owner
local char = player.Character
local torso = char.HumanoidRootPart
local TweenService = game:GetService("TweenService")
local Create = Instance.new

function Tween(obj, sec, data)
	local info = TweenInfo.new(sec)
	local tween = TweenService:Create(obj, info, data)
	tween:Play()
	return tween
end
function PermCollision(objs, collision)
	local conn = game:GetService("RunService").Stepped:Connect(function()
		for i, v in next, objs do
			if v:IsA("BasePart") then
				v.CanCollide = collision and true or false
			end
		end
	end)
	local ret = {
		SetCollision = function(_, bool)
			collision = bool and true or false
		end;
		Stop = function()
			conn:Disconnect()
		end;
		Connection = conn;
		Objects = objs;
	}
	return ret
end

char.Archivable = true
local clones = {}
local lastChar = char:Clone()
for i = 1, 4 do
	local clone = lastChar:Clone()
	clone.Head.face:Destroy()
	torso.Anchored = true
	clone.Humanoid.PlatformStand = true
	clone.Parent = char
	local weld = Create("Weld", clone.Torso)
	weld.Part1 = clone.HumanoidRootPart
	weld.Part0 = torso
	local distances = {5, -5, 10, -10}
	Tween(weld, 1, {C0 = CFrame.new(distances[i], 0, 0)})
	wait(1.5)
end