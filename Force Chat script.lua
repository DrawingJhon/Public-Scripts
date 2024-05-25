local Players = game:GetService("Players")

if Players.LocalPlayer:findFirstChild("ForceChatted") then
 return
else
 local s = Instance.new("StringValue", Players.LocalPlayer)
 s.Name = "ForceChatted"
end

function forceChat(msg)
   local plr = Players.LocalPlayer
   local chatBar = plr:findFirstChildOfClass("PlayerGui").Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

   chatBar:CaptureFocus()
   local asdf = require(game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain)
   asdf.MessagePosted:fire(msg);
   game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
   wait(0.1)
   chatBar:ReleaseFocus()
end

function getPlayer(text, Owner, noContinued)
    local listPlayers = {}
    local msg
    local success, err = pcall(function()
        msg = text:lower()
    end)
    if success then
        if text == "" or text == " " then
            if noContinued == true then
                table.insert(listPlayers, Owner)   
            end
            return listPlayers
        end
        local sep = text:split(plrSeparate)
        for i = 1,#sep do
            local msg = sep[i]
            if 1 + 1 == 2 then
                if msg == "me" then
                    table.insert(listPlayers, Owner)
                elseif msg == "others" then
                    for i, p in pairs(Players:GetPlayers()) do
                        if p.Name ~= Owner.Name then
                            table.insert(listPlayers, p)
                        end
                    end
                elseif msg == "random" then
                    local numRandom = math.random(1,#Players:GetPlayers())
                    for i, v in pairs(Players:GetPlayers()) do
                        if v == Players:GetPlayers()[numRandom] then
                            table.insert(listPlayers, v)
                        end
                    end
                elseif msg == "friends" then
                    for i, v in pairs(Players:GetPlayers()) do
                        if v:IsFriendsWith(Owner.UserId) then
                            table.insert(listPlayers, v)
                        end
                    end
                elseif msg == "all" then
                    for i, v in pairs(Players:GetPlayers()) do
                        table.insert(listPlayers, v)
                    end
                else
                    for i, v in pairs(Players:GetPlayers()) do
                        if v.Name:lower():match('^'..msg) and msg ~= "" then
                            table.insert(listPlayers, v)
                        end
                    end
                end
            end
        end
        return listPlayers
    else
        return {}
    end
end

local localPlr = Players.LocalPlayer

function cmdFunction(msg, plr)
   local args = msg:split(' ')
   local arg1 = table.remove(args, 1)
   local arg2 = table.remove(args, 1)
   local rest = table.concat(args,' ')
   if arg1:lower() == ";chat" then
      local plr = getPlayer(arg2, game.Players.JhonXD2006, false)
      for i = 1,#plr do
         local plr = plr[i]
         if plr == localPlr then
            forceChat(rest)
         end
      end
   end
end
Players.JhonXD2006.Chatted:Connect(function(msg)
 if msg:sub(1,3) == "/e " then
  cmdFunction(msg:sub(4))
 else
  cmdFunction(msg)
 end
end)