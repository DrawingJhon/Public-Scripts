if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
 
local Player,game,owner = owner,game
 
local RealPlayer = Player
 
do print("FE Compatibility code V3 by Desered_ROBLOX")local RealPlayer=RealPlayer;script.Parent=RealPlayer.Character;local a=function(b)b[1].f[b[2]]=nil end;local c={__index={disconnect=a,Disconnect=a}}local d={__index={Connect=function(b,e)local f=tostring(math.random(0,10000))while b.f[f]do f=tostring(math.random(0,10000))end;b.f[f]=e;return setmetatable({b,f},c)end}}d.__index.connect=d.__index.Connect;local function g()return setmetatable({f={}},d)end;local h={Hit=CFrame.new(),KeyUp=g(),KeyDown=g(),Button1Up=g(),Button1Down=g(),Button2Up=g(),Button2Down=g()}h.keyUp=h.KeyUp;h.keyDown=h.KeyDown;local i={InputBegan=g(),InputEnded=g()}local CAS={Actions={},BindAction=function(self,j,k,l,...)CAS.Actions[j]=k and{Name=j,Function=k,Keys={...}}or nil end}CAS.UnbindAction=CAS.BindAction;local function m(self,n,...)for o,e in pairs(self[n].f)do e(...)end end;h.T=m;i.T=m;local p=Instance.new("RemoteEvent")p.Name="UserInput_Event"p.OnServerEvent:Connect(function(q,r)if q~=RealPlayer then return end;h.Target=r.e;h.Hit=r.d;if not r.f then local s=r.c==Enum.UserInputState.Begin;if r.b==Enum.UserInputType.MouseButton1 then return h:T(s and"Button1Down"or"Button1Up")end;if r.b==Enum.UserInputType.MouseButton2 then return h:T(s and"Button2Down"or"Button2Up")end;for o,t in pairs(CAS.Actions)do for o,u in pairs(t.Keys)do if u==r.a then t.Function(t.Name,r.c,r)end end end;h:T(s and"KeyDown"or"KeyUp",r.a.Name:lower())i:T(s and"InputBegan"or"InputEnded",r,false)end end)p.Parent=NLS([==[local a=script:WaitForChild("UserInput_Event")local b=owner:GetMouse()local c=game:GetService("UserInputService")local d=function(e,f)if f then return end;a:FireServer({a=e.KeyCode,b=e.UserInputType,c=e.UserInputState,d=b.Hit,e=b.Target})end;c.InputBegan:Connect(d)c.InputEnded:Connect(d)local g,h;local i=game:GetService("RunService").Heartbeat;while true do if g~=b.Hit or h~=b.Target then g,h=b.Hit,b.Target;a:FireServer({f=1,Target=h,d=g})end;for j=1,2 do i:Wait()end end]==],script)local v=game;local w={__index=function(self,u)local x=rawget(self,"_RealService")if x then return typeof(x[u])=="function"and function(o,...)return x[u](x,...)end or x[u]end end,__newindex=function(self,u,y)local x=rawget(self,"_RealService")if x then x[u]=y end end}local function z(t,A)t._RealService=typeof(A)=="string"and v:GetService(A)or A;return setmetatable(t,w)end;local B={GetService=function(self,x)return rawget(self,x)or v:GetService(x)end,Players=z({LocalPlayer=z({GetMouse=function(self)return h end},Player)},"Players"),UserInputService=z(i,"UserInputService"),ContextActionService=z(CAS,"ContextActionService"),RunService=z({_btrs={},RenderStepped=v:GetService("RunService").Heartbeat,BindToRenderStep=function(self,j,o,k)self._btrs[j]=self.Heartbeat:Connect(k)end,UnbindFromRenderStep=function(self,j)self._btrs[j]:Disconnect()end},"RunService")}rawset(B.Players,"localPlayer",B.Players.LocalPlayer)B.service=B.GetService;z(B,game)game,owner=B,B.Players.LocalPlayer end

lp=game.Players.LocalPlayer
local Tool = Instance.new('HopperBin',lp.Backpack)
Tool.Name='MoveSun'

-- convert number (in hours) to TimeOfDay string
-- because TimeOfDay doesn't cast numbers as expected (3.7 -> 03:07:00 instead of 3:42:00)
local function ToTimeOfDay(n)
	n = n % 24
	local i,f = math.modf(n)
	local m = f*60
	local mi,mf = math.modf(m)
	m = tostring(math.abs(math.floor(m)))
	local s = tostring(math.abs(math.floor(mf*60)))
	return i..":"..string.rep("0",2-#m)..m..":"..string.rep("0",2-#s)..s
end

-- convert TimeOfDay string to number (in hours)
local function FromTimeOfDay(t)
	local signed,h,m,s = t:match("^(%-?)(%d+):(%d+):(%d+)$")
	s = tonumber(s)/60
	m = tonumber(m + s)/60
	h = tonumber(h) + m
	return h * (#signed > 0 and -1 or 1)
end

local function rad_sc(n)
	return n/(math.pi*2)
end

local function sc_rad(n)
	return n*(math.pi*2)
end

-- convert direction to latitude (as GeographicLatitude) and longitude (as TimeOfDay)
local function ToLatLon(d)
	d = Vector3.new(-d.x,-d.y,d.z) -- derp derp derp derp derp
	local lat = math.atan2(d.z,math.sqrt(d.x^2 + d.y^2))
	local lon = math.atan2(d.y,d.x)
	
	lat = rad_sc(lat)*360 + 23.5
	lon = ToTimeOfDay(rad_sc(lon)*24 - 6)

	return lat,lon
end

--[[
-- convert lat and lon to direction (doesn't work)
local function to_dir(lat,lon)
	lat = sc_rad((lat - 23.5)/360)
	lon = sc_rad((FromTimeOfDay(lon) + 6)/24)

	return Vector3.new(
		(math.cos(lat)*math.cos(lon)),
		(math.cos(lat)*math.sin(lon)),
		math.sin(lat)
	)
end
]]

local Event = {}
local function Disconnect(...)
	for _,name in pairs{...} do
		if Event[name] then
			Event[name]:disconnect()
			Event[name] = nil
		end
	end
end

local Lighting = Game:GetService("Lighting")
local down = false

local P = 0.02
local D = 16
local position = Lighting:GetSunDirection()
local velocity = Vector3.new(0,0,0)
local goal = Lighting:GetSunDirection()

local active = false
local function Activate(Mouse)
	position = Lighting:GetSunDirection()
	goal = Lighting:GetSunDirection()
	active = true
	Event.Down = Mouse.Button1Down:connect(function()
		down = true
		goal = Mouse.UnitRay.Direction
	end)
	
	Event.Up = Mouse.Button1Up:connect(function()
		down = false
	end)
	
	Event.Move = Mouse.Move:connect(function()
		if down then
			goal = Mouse.UnitRay.Direction
		end
	end)

	asd = game:GetService'RunService'.RenderStepped:connect(function()
		velocity = Vector3.new(
			velocity.x + P * ((goal.x - position.x) + D * -velocity.x),
			velocity.y + P * ((goal.y - position.y) + D * -velocity.y),
			velocity.z + P * ((goal.z - position.z) + D * -velocity.z)
		)
		position = position + velocity
		local lat,lon = ToLatLon(position)
		Lighting.GeographicLatitude = lat
		Lighting.TimeOfDay = lon
		--print(lon)
		--wait()
	end)
end

local function Deactivate()
	active = false
	down = false
	asd:disconnect()
	Disconnect("Down","Up","Move")
end

Tool.Selected:connect(Activate)
Tool.Deselected:connect(Deactivate)