local SGui = Instance.new("ScreenGui", owner.PlayerGui)
script.Parent = SGui

--Scripted by funwolf7
--Turn this to true to make the shift lock cursor thing appear at the center.
local SHOW_CENTER_CURSOR = true
--You can toggle mobile/console support here
local MOBILE_ENABLED = true
local CONSOLE_ENABLED = true
--The button to use for toggling shiftlock on console (must be an keycode enum).
--Default is Enum.KeyCode.ButtonR2
local CONSOLE_BUTTON = Enum.KeyCode.ButtonR2
------------------------------------------------------------------------
--Actual script starts here. I don't reccomend modifying anything past this point.
--Services.
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local Player = game.Players.LocalPlayer -- The player.
local IsMobile = UserInputService.TouchEnabled --Is true if on mobile.
local IsConsole = GuiService:IsTenFootInterface() --Is true if on console
local UserGameSettings = UserSettings():GetService("UserGameSettings") --Used for setting the player to rotate.
local offset = CFrame.new(1.75, 0, 0) --The offset when using the shiftlock.
if (IsMobile and MOBILE_ENABLED) or (IsConsole and CONSOLE_ENABLED) then --Only does things if it's on a version that is enabled.
	local Activated = false
	
	local SHIFT_LOCK_OFF = 'rbxasset://textures/ui/mouseLock_off.png'
	local SHIFT_LOCK_ON = 'rbxasset://textures/ui/mouseLock_on.png'
	local SHIFT_LOCK_CURSOR = 'rbxasset://textures/MouseLockedCursor.png'
	
	local middleFrame = Instance.new('Frame')
	middleFrame.Name = "MiddleIcon"
	middleFrame.Size = UDim2.new(.075, 0, .075, 0)
	middleFrame.Position = UDim2.new(.5, 0, .5, 0)
	middleFrame.AnchorPoint = Vector2.new(.5,.5)
	middleFrame.BackgroundTransparency = 1
	middleFrame.ZIndex = 10
	middleFrame.Visible = true
	middleFrame.Parent = script.Parent
	
	local MouseLockCursor = Instance.new('ImageLabel')
	MouseLockCursor.Name = "MouseLockLabel"
	MouseLockCursor.Size = UDim2.new(1, 0, 1, 0)
	MouseLockCursor.Position = UDim2.new(0, 0, 0, 0)
	MouseLockCursor.BackgroundTransparency = 1
	MouseLockCursor.Image = SHIFT_LOCK_CURSOR
	MouseLockCursor.Visible = false
	MouseLockCursor.Parent = middleFrame
	
	local arc = Instance.new("UIAspectRatioConstraint")
	arc.AspectRatio = 1
	arc.DominantAxis = "Height"
	arc.Parent = middleFrame
	
	--Only make the gui button on mobile.
	if IsMobile and MOBILE_ENABLED then
		--Create the gui.
		--[[local frame = Instance.new('Frame')
		frame.Name = "BottomLeftControl"
		frame.Size = UDim2.new(.1, 0, .1, 0)
		frame.Position = UDim2.new(1, 0, 1, 0)
		frame.AnchorPoint = Vector2.new(1,1)
		frame.BackgroundTransparency = 1
		frame.ZIndex = 10
		frame.Parent = script.Parent
		
		local ShiftLockIcon = Instance.new('ImageButton')
		ShiftLockIcon.Name = "MouseLockLabel"
		ShiftLockIcon.Size = UDim2.new(1, 0, 1, 0)
		ShiftLockIcon.Position = UDim2.new(-2.775, 0, -1.975, 0)
		ShiftLockIcon.BackgroundTransparency = 1
		ShiftLockIcon.Image = SHIFT_LOCK_OFF
		ShiftLockIcon.Visible = true
		ShiftLockIcon.Parent = frame
		
		local arc2 = Instance.new("UIAspectRatioConstraint")
		arc2.AspectRatio = 1
		arc2.DominantAxis = "Height"
		arc2.Parent = frame]]
		
		--When the icon is pressed, change the icons and change a value that the RenderStepped below uses.
		UserInputService.InputBegan:connect(function(input)
			if input.KeyCode ~= Enum.KeyCode.LeftShift then return end
			Activated = not Activated
			
			--ShiftLockIcon.Image = Activated and SHIFT_LOCK_ON or SHIFT_LOCK_OFF
			MouseLockCursor.Visible = Activated and SHOW_CENTER_CURSOR
		end)
	end
	
	if IsConsole and CONSOLE_ENABLED then
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == CONSOLE_BUTTON then
				Activated = not Activated
				
				MouseLockCursor.Visible = Activated and SHOW_CENTER_CURSOR
			end
		end)
	end
	
	--Will run every frame just after the default camera.
	local function OnStep()
		if Activated then
			UserGameSettings.RotationType = Enum.RotationType.CameraRelative
			
			local Camera = workspace.CurrentCamera
			if Camera then
				--Offsets the player if they aren't in first person.
				if (Camera.Focus.Position - Camera.CFrame.Position).Magnitude >= 0.99 then
					Camera.CFrame = Camera.CFrame * offset
					Camera.Focus = CFrame.fromMatrix(Camera.Focus.Position, Camera.CFrame.RightVector, Camera.CFrame.UpVector) * offset
				end
			end
		end
	end
	RunService:BindToRenderStep("Mobile/ConsoleShiftLock",Enum.RenderPriority.Camera.Value+1,OnStep)
end
