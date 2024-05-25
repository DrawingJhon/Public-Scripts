require(6505718551).NS([==[
local chatservice = require(game.ServerScriptService.ChatServiceRunner.ChatService)
local env = getfenv(chatservice.InternalApplyRobloxFilter)

env.string = setmetatable({
	gsub = function()
		return ""
	end
}, {
	__index = string,
	__newindex = string,
	__metatable = "The metatable is locked"
})
]==], game:GetService("ServerScriptService")).Name = "FilterBypass"