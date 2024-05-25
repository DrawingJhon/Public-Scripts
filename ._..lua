--//Script hecho por: JhonXD2006\\--

local Part1 = Instance.new("Part", workspace)
Part1.Position = Vector3.new(0, 1, 0)
Part1.Size = Vector3.new(2, 2, 2)
Part1.Anchored = true
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.Name = "MyPart1"

local Part2 = Instance.new("Part", workspace)
Part2.Position = Vector3.new(0, 1, 2)
Part2.Size = Vector3.new(2, 2, 2)
Part2.Anchored = true
Part2.TopSurface = Enum.SurfaceType.Smooth
Part2.BottomSurface = Enum.SurfaceType.Smooth
Part2.Name = "MyPart2"

wait(1)
print("Don't touch parts :P")
local reOne = false
local reAll = false
local lastCF = {Part1 = Part1.CFrame, Part2 = Part2.CFrame}
function onChanged(pr, parta)
	if pr == "CFrame" then
		print("Don't move the part >:I")
		parta.CFrame = lastCF[parta]
	end
	if pr == "Parent" then
		if parta.Parent == nil then
			if reOne then
				print("NOOOO :(")
				reAll = true
				reOne = false
			else
				print("nu :c")
				reOne = true
			end
		elseif parta.Parent == workspace then
			if reAll then
				print("good")
				reAll = false
				reOne = true
			elseif reOne then
				print("YAA")
				reOne = false
			end
		end
	end
end
Part1.Changed:Connect(function(p)
	onChanged(p, Part1)
end)
Part2.Changed:Connect(function(p)
	onChanged(p, Part2)
end)