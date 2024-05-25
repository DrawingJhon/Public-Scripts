local adminpad = workspace.Super_AdminPad
local server = shared.Server

local inDebounce = {}

adminpad.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if player and not inDebounce[player] then
		inDebounce[player] = true
		if not server.Admin.CheckAdmin(player) then
			server.Admin.AddAdmin(player, 'Moderators', true)
			server.Remote.MakeGui(player, "Notification", {
				Title = 'Adonis Admin Pad';
				Message = "You're now Moderator! Click to view commands.";
				Time = 10;
				OnClick = server.Core.Bytecode("client.Remote.Send('ProcessCommand','"..server.Settings.Prefix.."cmds')");
			})
			wait(10)
			inDebounce[player] = false
		else
			server.Remote.MakeGui(player, "Notification",{
				Title = 'Adonis Admin Pad';
				Message = 'You already have admin!';
				Time = 5;
			})
			wait(5)
			inDebounce[player] = false
		end
	end
end)
				