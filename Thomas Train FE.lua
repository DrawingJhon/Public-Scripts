if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
 
local Player,game,owner = owner,game
 
local RealPlayer = Player
 
do print("FE Compatibility code V3 by Desered_ROBLOX")local RealPlayer=RealPlayer;script.Parent=RealPlayer.Character;local a=function(b)b[1].f[b[2]]=nil end;local c={__index={disconnect=a,Disconnect=a}}local d={__index={Connect=function(b,e)local f=tostring(math.random(0,10000))while b.f[f]do f=tostring(math.random(0,10000))end;b.f[f]=e;return setmetatable({b,f},c)end}}d.__index.connect=d.__index.Connect;local function g()return setmetatable({f={}},d)end;local h={Hit=CFrame.new(),KeyUp=g(),KeyDown=g(),Button1Up=g(),Button1Down=g(),Button2Up=g(),Button2Down=g()}h.keyUp=h.KeyUp;h.keyDown=h.KeyDown;local i={InputBegan=g(),InputEnded=g()}local CAS={Actions={},BindAction=function(self,j,k,l,...)CAS.Actions[j]=k and{Name=j,Function=k,Keys={...}}or nil end}CAS.UnbindAction=CAS.BindAction;local function m(self,n,...)for o,e in pairs(self[n].f)do e(...)end end;h.T=m;i.T=m;local p=Instance.new("RemoteEvent")p.Name="UserInput_Event"p.OnServerEvent:Connect(function(q,r)if q~=RealPlayer then return end;h.Target=r.e;h.Hit=r.d;if not r.f then local s=r.c==Enum.UserInputState.Begin;if r.b==Enum.UserInputType.MouseButton1 then return h:T(s and"Button1Down"or"Button1Up")end;if r.b==Enum.UserInputType.MouseButton2 then return h:T(s and"Button2Down"or"Button2Up")end;for o,t in pairs(CAS.Actions)do for o,u in pairs(t.Keys)do if u==r.a then t.Function(t.Name,r.c,r)end end end;h:T(s and"KeyDown"or"KeyUp",r.a.Name:lower())i:T(s and"InputBegan"or"InputEnded",r,false)end end)p.Parent=NLS([==[local a=script:WaitForChild("UserInput_Event")local b=owner:GetMouse()local c=game:GetService("UserInputService")local d=function(e,f)if f then return end;a:FireServer({a=e.KeyCode,b=e.UserInputType,c=e.UserInputState,d=b.Hit,e=b.Target})end;c.InputBegan:Connect(d)c.InputEnded:Connect(d)local g,h;local i=game:GetService("RunService").Heartbeat;while true do if g~=b.Hit or h~=b.Target then g,h=b.Hit,b.Target;a:FireServer({f=1,Target=h,d=g})end;for j=1,2 do i:Wait()end end]==],script)local v=game;local w={__index=function(self,u)local x=rawget(self,"_RealService")if x then return typeof(x[u])=="function"and function(o,...)return x[u](x,...)end or x[u]end end,__newindex=function(self,u,y)local x=rawget(self,"_RealService")if x then x[u]=y end end}local function z(t,A)t._RealService=typeof(A)=="string"and v:GetService(A)or A;return setmetatable(t,w)end;local B={GetService=function(self,x)return rawget(self,x)or v:GetService(x)end,Players=z({LocalPlayer=z({GetMouse=function(self)return h end},Player)},"Players"),UserInputService=z(i,"UserInputService"),ContextActionService=z(CAS,"ContextActionService"),RunService=z({_btrs={},RenderStepped=v:GetService("RunService").Heartbeat,BindToRenderStep=function(self,j,o,k)self._btrs[j]=self.Heartbeat:Connect(k)end,UnbindFromRenderStep=function(self,j)self._btrs[j]:Disconnect()end},"RunService")}rawset(B.Players,"localPlayer",B.Players.LocalPlayer)B.service=B.GetService;z(B,game)game,owner=B,B.Players.LocalPlayer end

-- ty krystalburger
--[[
	Thomas The Dank Engine:
							By: KrystalTeam
							Features: Being a dank engine that kill people
							Version: 1.0.0.2
--]]

local p = game.Players.LocalPlayer.Character
local weld = Instance.new("Weld",p.Torso)
weld.Part0 = p.Torso

local train = Instance.new("Part",p.Torso)
train.Anchored = true
train.CanCollide = false
train.Size = Vector3.new(3,2,6)
train.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld.Part1 = train
weld.C1 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(180),0)
train.Anchored = false
local TrainMesh = Instance.new("SpecialMesh",train)
TrainMesh.MeshType = Enum.MeshType.FileMesh
TrainMesh.Scale = Vector3.new(0.020,0.020,0.015)
TrainMesh.MeshId = "rbxassetid://431017802"
TrainMesh.TextureId = "rbxassetid://431017809"


local weld2 = Instance.new("Weld",p.Torso)
weld2.Part0 = p.Torso
local Smoke = Instance.new("Part",p.Torso)
Smoke.Anchored = true
Smoke.CanCollide = false
Smoke.Size = Vector3.new(1,1,1)
Smoke.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld2.Part1 = Smoke
weld2.C1 = CFrame.new(0,-4,3.5)-- * CFrame.Angles(0,math.rad(180),0)
Smoke.Anchored = false
Smoke.Transparency = 1;

local Particle = Instance.new("ParticleEmitter",Smoke)
Particle.Rate = 50;
Particle.Speed = NumberRange.new(30,60);
Particle.VelocitySpread = 4;
Particle.Texture = "rbxassetid://133619974"

local Light = Instance.new("SpotLight",train)
Light.Angle = 45;
Light.Brightness = 100;
Light.Face = Enum.NormalId.Back;
Light.Range = 30;

p.Humanoid.WalkSpeed = 20;


for i,v in pairs(p:GetChildren()) do
	if v:IsA("Part") then
		v.Transparency = 1;
	elseif v:IsA("Hat") then
		v:Destroy()
	elseif v:IsA("Model") then
		v:Destroy()
	end
end

local function SFX(id) local s=Instance.new("Sound",p.Torso); s.SoundId = "rbxassetid://"..id; s.Volume = 1; return s; end
train.Touched:connect(function(p)
	if p.Parent then
		if p.Parent:IsA("Model") then
			if game.Players:FindFirstChild(p.Parent.Name) then
				if p.Parent.Name ~= game.Players.LocalPlayer.Name then
					game.Players:FindFirstChild(p.Parent.Name).Character:BreakJoints()
					local Whistle = SFX(604650009)
					Whistle:Play()
				end
			end
		end
	end
end)

local Music = SFX(190819252)
Music.Looped = true;
wait(1)
Music:Play();
-- ~CL 2016