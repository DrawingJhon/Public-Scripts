local Part = Instance.new("Part", workspace)
Part.Position = Vector3.new(0, 4, 0)
Part.Size = Vector3.new(4, 4, 4)
Part.Anchored = true
Part.TopSurface = Enum.SurfaceType.Smooth
Part.BottomSurface = Enum.SurfaceType.Smooth
Part.Material = Enum.Material.Neon
while true do
    Part.Color = Color3.new(255/255,0/255,0/255)
    for i = 0,255,10 do
        wait()
        Part.Color = Color3.new(255/255,i/255,0/255)
    end
    for i = 255,0,-10 do
        wait()
        Part.Color = Color3.new(i/255,255/255,0/255)
    end
    for i = 0,255,10 do
        wait()
        Part.Color = Color3.new(0/255,255/255,i/255)
    end
    for i = 255,0,-10 do
        wait()
        Part.Color = Color3.new(0/255,i/255,255/255)
    end
    for i = 0,255,10 do
        wait()
        Part.Color = Color3.new(i/255,0/255,255/255)
    end
    for i = 255,0,-10 do
        wait()
        Part.Color = Color3.new(255/255,0/255,i/255)
    end
end