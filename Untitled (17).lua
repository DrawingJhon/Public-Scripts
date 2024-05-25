local Player = owner
local PlrGui = owner:findFirstChildWhichIsA("PlayerGui")
local Character = Player.Character or error("Not character found!")
local RootPart = Character:findFirstChild("HumanoidRootPart")

local SGui = Instance.new("ScreenGui", PlrGui)
local Main = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TBDesc = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local Description = Instance.new("TextLabel")
