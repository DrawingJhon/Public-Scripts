server = nil -- Mutes warnings about unknown globals
service = nil

return function()	
	game.Players.PlayerAdded:connect(function(plr)
		local touch =Instance.new("BoolValue", plr)
		touch.Value = false
		touch.Name = "isTouched"
	end)
	
	game.Workspace.AdminPad.Touched:connect(function(thing)
		local touch = game.Players:getPlayerFromCharacter(thing.Parent).isTouched
		if server.Admin.CheckAdmin(game.Players:getPlayerFromCharacter(thing.Parent)) == false and touch.Value == false then
			touch.Value = true
			server.Admin.AddAdmin(game.Players:getPlayerFromCharacter(thing.Parent),1,true) 
			server.Remote.MakeGui(game.Players:getPlayerFromCharacter(thing.Parent),"Notification",{
				Title = "Adonis Admin Pad";
				Message = "You're now an admin! Click to view commands.";
				Time = 10;
				OnClick = server.Core.Bytecode("client.Remote.Send('ProcessCommand','"..server.Settings.Prefix.."cmds')");
			})
			wait(10) 
			touch.Value = false
		elseif server.Admin.CheckAdmin(game.Players:getPlayerFromCharacter(thing.Parent)) == true and touch.Value == false then
			touch.Value = true
			server.Remote.MakeGui(game.Players:getPlayerFromCharacter(thing.Parent),"Notification",{
				Title = "Adonis Admin Pad";
				Message = "You already have admin!";
				Time = 5;
			})	
			wait(5) 
			touch.Value = false
		end
	end)
end
	
--[[
	
The original Adonis Admin Pad made by heroesp.  
Please do not take credit for my work.
Check out my game here: https://www.roblox.com/games/98831904/Adonis-Admin-House
	
--]]