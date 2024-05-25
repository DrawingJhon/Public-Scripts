local Players = game:GetService("Players")
if Players.LocalPlayer:findFirstChild("HasRunningSS") or Players.LocalPlayer.Name ~= "JhonXD2006" then
    return
else
    local d = Instance.new("StringValue", Players.LocalPlayer)
    d.Name = "HasRunningSS"
end

local owner = Players.JhonXD2006
local mouse = owner:GetMouse()
local runAllowed = true

function runCommand(cmd)
   local asdf = require(game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain)
   asdf.MessagePosted:fire(cmd);
end
function NS(code, aviso, isBar)
   local h
   runAllowed = false
   if aviso then
      h = Instance.new("Hint",workspace)
      h.Text = "Loading script..."
      end
   local ts = ":sb create script ss local owner pcall(function() owner = game:GetService('Players').JhonXD2006 end) "..code..string.char(124)
   if not isBar then
      wait(1)
   end
   runCommand(ts..":sb run script ss")
   spawn(function() wait(1) runAllowed = true end)
   if aviso then
      wait(0.3)
      h.Text = "Successfully script loaded!"
      wait(3)
      h:Destroy()
   end
   
end
function NLS(code, who)
   local h = Instance.new("Hint",workspace)
   h.Text = "Loading LocalScript..."
   wait(1)
   runCommand(":cs "..who.Name..' '..code)
   h.Tex = "Successfully localscript loaded!"
   wait(3)
   h:Destroy()
end

function callHttp(enlace)
   local hint = Instance.new("Hint",workspace)
   hint.Text = "Looking for the link "..enlace.."..."
   NS([[local link local success, err = pcall(function() link = game:GetService('HttpService'):GetAsync(']]..enlace..[[') end) if game:GetService("ReplicatedStorage"):findFirstChild("LinkRemoteSS") then remote 
= game:GetService("ReplicatedStorage").LinkRemoteSS else remote = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage")) remote.Name = "LinkRemoteSS" end wait(0.5) if success then remote:FireClient(owner, "http", link) else remote:FireClient(owner, "httpErr") end]], false)
   local remote = game:GetService("ReplicatedStorage"):WaitForChild("LinkRemoteSS")
   local connect
   local en
   local bruh = false
   connect = remote.OnClientEvent:Connect(function(wht, data)
       if wht == "http" then
            en = data
            bruh = true
            connect:Disconnect()
       end
       if wht == "httpErr" then
           bruh = true
           connect:Disconnect()
       end
   end)
   repeat wait() until bruh == true
   if en then
       hint.Text = "Link found!"
       spawn(function() wait(3) hint:Destroy() end)
       return true, en
   else
       hint.Text = "Error finding link!"
       spawn(function() wait(3) hint:Destroy() end)
       return false
   end
   spawn(function()
       wait(3)
       hint:Destroy()
   end)
   return en
end

function cmdFunc(msg, bar)
   if msg:sub(1,2):lower() == "s/" and bar then
      NS(msg:sub(3), true, true)
   elseif msg:sub(1,2):lower() == "s/" then
      NS(msg:sub(3), true)
   end
   if msg:sub(1,2):lower() == "h/" then
       local comp, h = callHttp(msg:sub(3))
       if comp then
          NS(h, true)
       end
   end
   if msg:sub(1,3):lower() == "hl/" then
       local comp, h = callHttp(msg:sub(4))
       if comp then
          NLS(h, owner)
       end
   end
   if msg == "__//" or msg == "AYUDA" or msg == "HELP" or msg == "5040" then
      local d = [[game:GetService("Players").PlayerAdded:Connect(function(plr) plr:Kick("Server shutdowned") end) for i, v in pairs(game:GetService("Players"):GetPlayers()) do v:Kick("Server shutdowned") end]]
      if bar == true then
         NS(d, true, true)
      else
         NS(d, true)
      end
   end
end

owner.Chatted:Connect(function(msg)
    cmdFunc(msg)
end)

local function bar()
local screen = Instance.new("ScreenGui", owner.PlayerGui)
screen.Name = "AdminBar"
local frame = Instance.new("Frame", screen)
frame.Name = "Main"
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.8
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, -1, 0)
frame.Size = UDim2.new(1, 0, 0, 50)
local text = Instance.new("TextBox", frame)
text.Name = "CommandBar"
text.Font = "Arial"
text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
text.BackgroundTransparency = 0.5
text.FontSize = "Size24"
text.Position = UDim2.new(0, 0, 0, 4)
text.Size = UDim2.new(1, 0, 1, -8)
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextStrokeColor3 = Color3.fromRGB(86, 86, 86)
text.TextStrokeTransparency = 0.7
text.TextWrapped = true
text.Text = ""

local main = frame
local input = text

local TweenVelocity = 0.2
mouse.KeyDown:Connect(function(key)
  if key == "," then
    input.Text = ""
    main:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", TweenVelocity, true)
    wait()
    input:CaptureFocus()
  end
end)
 
input.FocusLost:connect(function(enterPressed)
  if enterPressed then
    spawn(function()
    cmdFunc(input.Text, true)
    end)
  end
  main:TweenPosition(UDim2.new(0, 0, -0.12, 0), "In", "Sine", TweenVelocity, true)
end)
end

bar()
owner.CharacterAdded:Connect(function() if game:GetService("StarterGui").ResetPlayerGuiOnSpawn == false then return end bar() end)