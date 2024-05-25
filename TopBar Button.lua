local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")

local TopbarModule = {}

function TopbarModule:Add(ButtonName,Image,Left)
	if ButtonName ~= nil and Image ~= nil then
		if RunService:IsClient() then
			local Player = game.Players.LocalPlayer
			if Player ~= nil then 
				local PlrCheck = false
				for _,p in pairs(game.Players:GetPlayers()) do
					if p == Player then
						PlrCheck = true
					end
				end
				if PlrCheck == false then
					warn("Invalid Player")
					return false
				else
					-- Player is valid, Check to see if there is already the topbar frame
					local TopbarFrame
					pcall(function()
						TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
					end)
					if TopbarFrame == nil then
						-- No TopbarFrame, Add it
						local TBUI = Instance.new("ScreenGui",Player.PlayerGui)
						TBUI.Name = "TopbarGUI"
						TBUI.DisplayOrder = 1000000000
						TBUI.Enabled = true
						TBUI.IgnoreGuiInset = true
						TBUI.ResetOnSpawn = false
						
						local TBFrame = Instance.new("Frame",TBUI)
						TBFrame.BackgroundTransparency = 1
						TBFrame.BorderSizePixel = 0
						TBFrame.Name = "TopbarFrame"
						TBFrame.Size = UDim2.new(1,0,0,36)
						TBFrame.ZIndex = 1000000000
						
						local TBL = Instance.new("Frame",TBFrame)
						TBL.BackgroundTransparency = 1
						TBL.BorderSizePixel = 0
						TBL.Name = "Left"
						TBL.Position = UDim2.new(0,104,0,4)
						TBL.Size = UDim2.new(0.85,0,0,32)
						
						local TBR = Instance.new("Frame",TBFrame)
						TBR.BackgroundTransparency = 1
						TBR.BorderSizePixel = 0
						TBR.Name = "Right"
						TBR.AnchorPoint = Vector2.new(1,0)
						TBR.Position = UDim2.new(1,-60,0,4)
						TBR.Size = UDim2.new(0.85,0,0,32)
						
						local TBLUI = Instance.new("UIListLayout",TBL)
						TBLUI.Padding = UDim.new(0,12)
						TBLUI.FillDirection = Enum.FillDirection.Horizontal
						TBLUI.HorizontalAlignment = Enum.HorizontalAlignment.Left
						TBLUI.SortOrder = Enum.SortOrder.LayoutOrder
						TBLUI.VerticalAlignment = Enum.VerticalAlignment.Top
						
						local TBRUI = Instance.new("UIListLayout",TBR)
						TBRUI.Padding = UDim.new(0,12)
						TBRUI.FillDirection = Enum.FillDirection.Horizontal
						TBRUI.HorizontalAlignment = Enum.HorizontalAlignment.Right
						TBRUI.SortOrder = Enum.SortOrder.LayoutOrder
						TBRUI.VerticalAlignment = Enum.VerticalAlignment.Top
						
						RunService.RenderStepped:Connect(function()
							if GuiService.MenuIsOpen == true then
								TBFrame.Visible = false
							else
								TBFrame.Visible = true
							end
						end)
						TopbarFrame = TBUI
					end
					-- Check to see if name is taken
					local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
					local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
					if CheckLeft == nil and CheckRight == nil then
						local NewButton = Instance.new("Frame")
						NewButton.Name = ButtonName
						NewButton.BackgroundTransparency = 1
						NewButton.BorderSizePixel = 0
						NewButton.Position = UDim2.new(0,104,0,4)
						NewButton.Size = UDim2.new(0,32,0,32)
						
						local IconButton = Instance.new("ImageButton",NewButton)
						IconButton.BackgroundTransparency = 1
						IconButton.Name = "IconButton"
						IconButton.Size = UDim2.new(1,0,1,0)
						IconButton.ZIndex = 2
						IconButton.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
						
						local BadgeContainer = Instance.new("Frame",IconButton)
						BadgeContainer.BackgroundTransparency = 1
						BadgeContainer.Size = UDim2.new(1,0,1,0)
						BadgeContainer.Name = "BadgeContainer"
						BadgeContainer.ZIndex = 5
						BadgeContainer.Visible = false
						
						local Badge = Instance.new("Frame",BadgeContainer)
						Badge.BackgroundTransparency = 1
						Badge.Name = "Badge"
						Badge.Position = UDim2.new(0,18,0,-2)
						Badge.Size = UDim2.new(0,24,0,24)
						
						local BadgeBG = Instance.new("ImageLabel",Badge)
						BadgeBG.BackgroundTransparency = 1
						BadgeBG.Size = UDim2.new(1,0,1,0)
						BadgeBG.Name = "Background"
						BadgeBG.ZIndex = 2
						BadgeBG.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
						BadgeBG.ImageColor3 = Color3.fromRGB(35, 37, 39)
						BadgeBG.ImageRectOffset = Vector2.new(301, 484)
						BadgeBG.ImageRectSize = Vector2.new(25,25)
						BadgeBG.ScaleType = Enum.ScaleType.Slice
						BadgeBG.SliceCenter = Rect.new(Vector2.new(14,14),Vector2.new(15,15))
						
						local Inner = Instance.new("ImageLabel",Badge)
						Inner.AnchorPoint = Vector2.new(0.5,0.5)
						Inner.BackgroundTransparency = 1
						Inner.Name = "Inner"
						Inner.Position = UDim2.new(0.5,0,0.5,0)
						Inner.Size = UDim2.new(1,-4,1,-4)
						Inner.ZIndex = 3
						Inner.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
						Inner.ImageRectOffset = Vector2.new(463,168)
						Inner.ImageRectSize = Vector2.new(21,21)
						Inner.ScaleType = Enum.ScaleType.Slice
						Inner.SliceCenter = Rect.new(Vector2.new(14,14),Vector2.new(15,15))
						
						local InnerTL = Instance.new("TextLabel",Inner)
						InnerTL.BackgroundTransparency = 1
						InnerTL.Name = "TextLabel"
						InnerTL.Size = UDim2.new(1,0,1,0)
						InnerTL.Font = Enum.Font.Gotham
						InnerTL.Text = "0"
						InnerTL.TextColor3 = Color3.fromRGB(57, 59, 61)
						InnerTL.TextSize = 14
						
						local IconImg = Instance.new("ImageLabel",IconButton)
						IconImg.AnchorPoint = Vector2.new(0.5,0.5)
						IconImg.BackgroundTransparency = 1
						IconImg.Name = "IconImage"
						IconImg.Position = UDim2.new(0.5,0,0.5,0)
						IconImg.Size = UDim2.new(0,24,0,24)
						IconImg.ZIndex = 3
						IconImg.Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"
						IconImg.ScaleType = Enum.ScaleType.Fit
						
						local DropDown = Instance.new("ImageLabel",NewButton)
						DropDown.AnchorPoint = Vector2.new(0.5,0)
						DropDown.BackgroundTransparency = 1
						DropDown.Position = UDim2.new(0.5,0,1,2)
						DropDown.Size = UDim2.new(0,10,0,0)
						DropDown.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
						DropDown.ScaleType = Enum.ScaleType.Slice
						DropDown.SliceCenter =  Rect.new(Vector2.new(10,10),Vector2.new(10,10))
						
						local DropList = Instance.new("UIListLayout",DropDown)
						DropList.FillDirection = Enum.FillDirection.Vertical
						DropList.HorizontalAlignment = Enum.HorizontalAlignment.Left
						DropList.SortOrder = Enum.SortOrder.LayoutOrder
						DropList.VerticalAlignment = Enum.VerticalAlignment.Top
						
						pcall(function()
							NewButton.IconButton.IconImage.Image = Image
						end)
						if Left == true or nil then
							NewButton.Parent = TopbarFrame.TopbarFrame.Left
						else
							NewButton.Parent = TopbarFrame.TopbarFrame.Right
						end
						return NewButton.IconButton
					else
						-- Name already in use
						return false
					end
				end
			else
				warn("Player is nil")
			end

		else
			warn("Input is nil")
			return false
		end
	end
end

function TopbarModule:Remove(ButtonName)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
			if CheckLeft ~= nil then
				CheckLeft:Destroy()
				return true
			end
			if CheckRight ~= nil then
				CheckRight:Destroy()
				return true
			end
			if CheckRight == nil and CheckLeft == nil then
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:Hide(ButtonName)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
			if CheckLeft ~= nil then
				CheckLeft.Visible = false
				return true
			end
			if CheckRight ~= nil then
				CheckRight.Visible = false
				return true
			end
			if CheckRight == nil and CheckLeft == nil then
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:Show(ButtonName)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
			if CheckLeft ~= nil then
				CheckLeft.Visible = true
				return true
			end
			if CheckRight ~= nil then
				CheckRight.Visible = true
				return true
			end
			if CheckRight == nil and CheckLeft == nil then
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:ChangeImage(ButtonName,Image)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
			if CheckLeft ~= nil then
				pcall(function()
					CheckLeft.IconButton.IconImage.Image = Image
				end)
				return true
			end
			if CheckRight ~= nil then
				pcall(function()
					CheckRight.IconButton.IconImage.Image = Image
				end)
				return true
			end
			if CheckRight == nil and CheckLeft == nil then
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:GetAmount(ButtonName)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
			if CheckLeft ~= nil then
				return CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text
			end
			if CheckRight ~= nil then
				return CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text
			end
			if CheckRight == nil and CheckLeft == nil then
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:SetAmount(ButtonName,Amount)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil and Amount ~= nil then
			if tonumber(Amount) >= 0 then
				local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
				local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
				if CheckLeft ~= nil then
					CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = tostring(Amount)
					if tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) > 0 then
						CheckLeft.IconButton.BadgeContainer.Visible = true
					else 
						CheckLeft.IconButton.BadgeContainer.Visible = false
					end
					return true
				end
				if CheckRight ~= nil then
					CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = tostring(Amount)
					if tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) > 0 then
						CheckRight.IconButton.BadgeContainer.Visible = true
					else
						CheckRight.IconButton.BadgeContainer.Visible = false
					end
					return true
				end
				if CheckRight == nil and CheckLeft == nil then
					return false
				end
			else
				return false
			end
		end
	end
end

function TopbarModule:AddAmount(ButtonName,Amount)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil and Amount ~= nil then
			if tonumber(Amount) >= 0 then
				local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
				local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
				if CheckLeft ~= nil then
					CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = tostring(tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) + Amount)
					if tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) > 0 then
						CheckLeft.IconButton.BadgeContainer.Visible = true
					else 
						CheckLeft.IconButton.BadgeContainer.Visible = false
					end
					if tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) <= -1 then
						CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = "0"
					end
					return true
				end
				if CheckRight ~= nil then
					CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = tostring(tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) + Amount)
					if tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) > 0 then
						CheckRight.IconButton.BadgeContainer.Visible = true
					else
						CheckRight.IconButton.BadgeContainer.Visible = false
					end
					if tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) <= -1 then
						CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = "0"
					end
					return true
				end
				if CheckRight == nil and CheckLeft == nil then
					return false
				end
			else
				return false
			end
		end
	end
end

function TopbarModule:RemoveAmount(ButtonName,Amount)
	if RunService:IsClient() then
		local Player = game.Players.LocalPlayer
		local TopbarFrame = Player.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame ~= nil and Amount ~= nil then
			if tonumber(Amount) >= 0 then
				local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
				local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
				if CheckLeft ~= nil then
					CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = tostring(tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) - Amount)
					if tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) > 0 then
						CheckLeft.IconButton.BadgeContainer.Visible = true
					else 
						CheckLeft.IconButton.BadgeContainer.Visible = false
					end
					if tonumber(CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) <= -1 then
						CheckLeft.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = "0"
					end
					return true
				end
				if CheckRight ~= nil then
					CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = tostring(tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) - Amount)
					if tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) > 0 then
						CheckRight.IconButton.BadgeContainer.Visible = true
					else
						CheckRight.IconButton.BadgeContainer.Visible = false
					end
					if tonumber(CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text) <= -1 then
						CheckRight.IconButton.BadgeContainer.Badge.Inner.TextLabel.Text = "0"
					end
					return true
				end
				if CheckRight == nil and CheckLeft == nil then
					return false
				end
			else
				return false
			end
		end
	end
end

function TopbarModule:CreateDropdownButton(DropdownButtonName,TopbarButtonName,Text)
	if RunService:IsClient() then
		local p = game.Players.LocalPlayer
		local TopbarFrame = p.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(TopbarButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(TopbarButtonName)
			local Button = nil
			if CheckLeft then
				Button = CheckLeft
			elseif CheckRight then
				Button = CheckRight
			end
			if Button then
				local NameChecker = Button.Dropdown:FindFirstChild(DropdownButtonName)
				if NameChecker == nil then
					local NewUI = Instance.new("TextButton")
					NewUI.BackgroundTransparency = 1
					NewUI.Size = UDim2.new(1,0,0,25)
					NewUI.Font = Enum.Font.SourceSansSemibold
					NewUI.Text = Text
					NewUI.TextSize = 15
					NewUI.Name = DropdownButtonName
					wait()
					Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset,0,Button.Dropdown.Size.Y.Offset + 25)
					NewUI.Parent = Button.Dropdown
					if NewUI.TextFits == false then
						repeat
							Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset + 1,0,Button.Dropdown.Size.Y.Offset)
							wait()
						until NewUI.TextFits == true
						Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset + 8,0,Button.Dropdown.Size.Y.Offset)
					end
					wait()
					return NewUI
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:RemoveDropdownButton(DropdownButtonName,TopbarButtonName)
	if RunService:IsClient() then
		local p = game.Players.LocalPlayer
		local TopbarFrame = p.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(TopbarButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(TopbarButtonName)
			local Button = nil
			if CheckLeft then
				Button = CheckLeft
			elseif CheckRight then
				Button = CheckRight
			end
			if Button then
				local NameChecker = Button.Dropdown:FindFirstChild(DropdownButtonName)
				if NameChecker then
					NameChecker:Destroy()
					Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset,0,Button.Dropdown.Size.Y.Offset - 25)
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:HideDropdownButton(DropdownButtonName,TopbarButtonName)
	if RunService:IsClient() then
		local p = game.Players.LocalPlayer
		local TopbarFrame = p.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(TopbarButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(TopbarButtonName)
			local Button = nil
			if CheckLeft then
				Button = CheckLeft
			elseif CheckRight then
				Button = CheckRight
			end
			if Button then
				local NameChecker = Button.Dropdown:FindFirstChild(DropdownButtonName)
				if NameChecker then
					if NameChecker.Visible == true then
						NameChecker.Visible = false
						Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset,0,Button.Dropdown.Size.Y.Offset - 25)
						return true
					else
						return false
					end
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:ShowDropdownButton(DropdownButtonName,TopbarButtonName)
	if RunService:IsClient() then
		local p = game.Players.LocalPlayer
		local TopbarFrame = p.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(TopbarButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(TopbarButtonName)
			local Button = nil
			if CheckLeft then
				Button = CheckLeft
			elseif CheckRight then
				Button = CheckRight
			end
			if Button then
				local NameChecker = Button.Dropdown:FindFirstChild(DropdownButtonName)
				if NameChecker then
					if NameChecker.Visible == false then
						NameChecker.Visible = true
						Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset,0,Button.Dropdown.Size.Y.Offset + 25)
						return true
					else
						return false
					end
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end
end

function TopbarModule:EditDropdownButton(DropdownButtonName,TopbarButtonName,Text)
	if RunService:IsClient() then
		local p = game.Players.LocalPlayer
		local TopbarFrame = p.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(TopbarButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(TopbarButtonName)
			local Button = nil
			if CheckLeft then
				Button = CheckLeft
			elseif CheckRight then
				Button = CheckRight
			end
			if Button then
				local NameChecker = Button.Dropdown:FindFirstChild(DropdownButtonName)
				if NameChecker then
					NameChecker.Text = Text
					wait()
					if NameChecker.TextFits == false then
						repeat
							Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset + 1,0,Button.Dropdown.Size.Y.Offset)
							wait()
						until NameChecker.TextFits == true
						Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset + 8,0,Button.Dropdown.Size.Y.Offset)
					end
					wait()
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end	
end

function TopbarModule:ResetDropdownSize(ButtonName)
	if RunService:IsClient() then
		local p = game.Players.LocalPlayer
		local TopbarFrame = p.PlayerGui:FindFirstChild("TopbarGUI")
		if TopbarFrame then
			local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
			local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
			local Button = nil
			if CheckLeft then
				Button = CheckLeft
			elseif CheckRight then
				Button = CheckRight
			end
			if Button then
				Button.Dropdown.Size = UDim2.new(0,0,0,0)
				for _,o in pairs(Button.Dropdown:GetChildren()) do
					if o.ClassName == "TextButton" then
						Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset,0,Button.Dropdown.Size.Y.Offset + 25)
						wait()
						if o.TextFits == false then
							repeat
								Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset + 1,0,Button.Dropdown.Size.Y.Offset)
								wait()
							until o.TextFits == true
							Button.Dropdown.Size = UDim2.new(0,Button.Dropdown.Size.X.Offset + 8,0,Button.Dropdown.Size.Y.Offset)
							wait()
						end
					end
				end
				wait()
				return true
			else
				return false
			end
		else
			return false
		end
	end
end

local module = TopbarModule
module:Add("Test", "54479711", true)