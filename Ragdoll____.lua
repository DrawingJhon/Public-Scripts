local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local RagdollState = (ReplicatedStorage:WaitForChild("Events")):WaitForChild("RagdollState")
local LocalRagdollEvent = ReplicatedStorage:WaitForChild("LocalRagdollEvent")
local Delay = ReplicatedStorage:WaitForChild("Delay")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

if not Character then
    Character = Player.CharacterAdded
    local NewCharacter = Player.CharacterAdded:Wait()
end

local Humanoid = NewCharacter:WaitForChild("Humanoid")
local HumanoidRootPart = NewCharacter:WaitForChild("HumanoidRootPart")
local Motors = ((ReplicatedStorage:WaitForChild("PlayerInfo")):WaitForChild(NewCharacter.Name)):WaitForChild("Motors")

LocalRagdollEvent.Event:Connect(function(p1)
    local Humanoid_State = Humanoid:GetState()
    if p1 then
        if Humanoid_State ~= Enum.HumanoidStateType.Physics then
            RagdollState:FireServer(true)
            Delay.Value = Delay.Value + 3
            Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            HumanoidRootPart.CanCollide = false
            for i, children in pairs(NewCharacter:GetChildren()) do
                if children:IsA("BasePart") then
                    for _, motor in pairs(children:GetChildren()) do
                        if motor:IsA("Motor6D") then
                            motor.Parent = Motors
                        end
                    end
                end
            end
        elseif Humanoid_State == Enum.HumanoidStateType.Physics then
                RagdollState:FireServer(false)
                Delay.Value = Delay.Value + 3
                local function returnMotor_1(name, parent)
                    local found = Motors:FindFirstChild(name)
                    if found and parent then
                      	found.Parent = parent
                    end
                end
                if Humanoid.RigType == Enum.HumanoidRigType.R15 then
                    returnMotor_1("Neck", NewCharacter:FindFirstChild("Head"))
                    returnMotor_1("Waist", NewCharacter:FindFirstChild("UpperTorso"))
                    returnMotor_1("Root", NewCharacter:FindFirstChild("LowerTorso"))
                    returnMotor_1("LeftShoulder", NewCharacter:FindFirstChild("LeftUpperArm"))
                    returnMotor_1("LeftElbow", NewCharacter:FindFirstChild("LeftLowerArm"))
                    returnMotor_1("LeftWrist", NewCharacter:FindFirstChild("LeftHand"))
                    returnMotor_1("RightShoulder", NewCharacter:FindFirstChild("RightUpperArm"))
                    returnMotor_1("RightElbow", NewCharacter:FindFirstChild("RightLowerArm"))
                    returnMotor_1("RightWrist", NewCharacter:FindFirstChild("RightHand"))
                    returnMotor_1("LeftHip", NewCharacter:FindFirstChild("LeftUpperLeg"))
                    returnMotor_1("LeftKnee", NewCharacter:FindFirstChild("LeftLowerLeg"))
                    returnMotor_1("LeftAnkle", NewCharacter:FindFirstChild("LeftFoot"))
                    returnMotor_1("RightHip", NewCharacter:FindFirstChild("RightUpperLeg"))
                    returnMotor_1("RightKnee", NewCharacter:FindFirstChild("RightLowerLeg"))
                    returnMotor_1("RightAnkle", NewCharacter:FindFirstChild("RightFoot"))
                else
                    returnMotor_1("Neck", NewCharacter:FindFirstChild("Torso"))
                    returnMotor_1("RootJoint", NewCharacter:FindFirstChild("HumanoidRootPart"))
                    returnMotor_1("Left Shoulder", NewCharacter:FindFirstChild("Torso"))
                    returnMotor_1("Right Shoulder", NewCharacter:FindFirstChild("Torso"))
                    returnMotor_1("Left Hip", NewCharacter:FindFirstChild("Torso"))
                    returnMotor_1("Right Hip", NewCharacter:FindFirstChild("Torso"))
                end
                HumanoidRootPart.CanCollide = true
                Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end
        return 
    end
end)
RagdollState.OnClientEvent:Connect(function(p5, p6, p7)
    local stateType = Humanoid:GetState()
    if stateType ~= Enum.HumanoidStateType.Physics then
        if stateType ~= Enum.HumanoidStateType.Dead then
            LocalRagdollEvent:Fire(true)
        end
    end
    local mass = (function(char)
        local num = 0
        for i, v in pairs(char:GetChildren()) do
            if v:IsA("BasePart") then
                num = num + v:GetMass()
            elseif v:IsA("Accoutrement") then
                 local handle = v:FindFirstChildOfClass("BasePart")
                 if handle then
                     num = num + handle:GetMass()
                  end
              end
        end
        return num
    end)(NewCharacter)
    if p5 then
        if type(p5) == "userdata" then
            local bodyForce = Instance.new("BodyForce")
            bodyForce.Force = p5 * mass
            bodyForce.Parent = HumanoidRootPart
            Debris:AddItem(bodyForce, 0.1)
        end
    end
    if p6 then
        if type(p6) == "userdata" then
            local bodyAngular = Instance.new("BodyAngularVelocity")
            bodyAngular.AngularVelocity = p6 * mass
            bodyAngular.Parent = HumanoidRootPart
            Debris:AddItem(bodyAngular, 0.1)
        end
    end
    kk = nil
    if p7 then
        if tonumber(p7) then
            kk = p7
        else
            kk = 0
        end
        Delay.Value = Delay.Value + kk - 3
        return 
    end
end)
