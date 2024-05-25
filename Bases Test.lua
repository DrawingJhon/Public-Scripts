local WallFront = Instance.new("Part", game.Workspace)
local WallBack = Instance.new("Part", game.Workspace)
local WallRight = Instance.new("Part", game.Workspace)
local WallLeft = Instance.new("Part", game.Workspace)

WallFront.Name = "FrontWall"
WallBack.Name = "BackWall"
WallRight.Name = "RightWall"
WallLeft.Name = "LeftWall"

WallFront.Locked = true
WallBack.Locked = true
WallRight.Locked = true
WallLeft.Locked = true

WallFront.Position = Vector3.new(0, 100.5, -499.5)
WallFront.Size = Vector3.new(1000, 200, 1)
WallBack.Position = Vector3.new(0, 100.5, 499.5)
WallBack.Size = Vector3.new(1000, 200, 1)
WallRight.Position = Vector3.new(499.5, 100.5, 0)
WallRight.Size = Vector3.new(1, 200, 1000)
WallLeft.Position = Vector3.new(-499.5, 100.5, 0)
WallLeft.Size = Vector3.new(1, 200, 1000)

WallFront.BottomSurface = Enum.SurfaceType.Smooth
WallFront.TopSurface = Enum.SurfaceType.Smooth
WallBack.BottomSurface = Enum.SurfaceType.Smooth
WallBack.TopSurface = Enum.SurfaceType.Smooth
WallRight.BottomSurface = Enum.SurfaceType.Smooth
WallRight.TopSurface = Enum.SurfaceType.Smooth
WallLeft.BottomSurface = Enum.SurfaceType.Smooth
WallLeft.TopSurface = Enum.SurfaceType.Smooth


WallFront.Material = Enum.Material.Grass
WallBack.Material = Enum.Material.Grass
WallRight.Material = Enum.Material.Grass
WallLeft.Material = Enum.Material.Grass


WallFront.Anchored = true
WallBack.Anchored = true
WallRight.Anchored = true
WallLeft.Anchored = true


WallFront.BrickColor = BrickColor.new(37)
WallBack.BrickColor = BrickColor.new(37)
WallRight.BrickColor = BrickColor.new(37)
WallLeft.BrickColor = BrickColor.new(37)