local CMDS = {}

function splitSpaces(str)
	local sp = str:split(' ')
	return table.concat(sp, '')
end


function execCmd(speaker, cmd, args, cmdbar)
	if typeof(cmd) ~= "string" then error("Cannot execute cmd of type "..tostring(typeof(cmd))) end
	if typeof(args) ~= "table" then error("Cannot find arguments of type "..tostring(typeof(args))) end
	for i = 1,#CMDS do
		local info = CMDS[i]
		if cmd == info.CMD or table.find(info.ALIAS, cmd) then
			local func = info.FUNC
			getfenv(func).CMD = cmd
			if cmd:lower() == "wait" then
				func(speaker, args)
			else
				coroutine.wrap(func)(speaker, args, cmdbar)
			end
		end
	end
end


function cmdFunc(speaker, message, commandBar)
	local function sepCmd(str)
		local sp = str:split("|")
		return function(func)
			for i = 1,#sp do
				func(sp[i])
			end
		end
	end
	local sp = sepCmd(message:gsub("^/e ", ""))
	sp(function(msg)
		local executed = false
		for i = 1,#CMDS do
			if executed then break end
			local info = CMDS[i]
			local cmd = info.CMD
			local numArgs = #info.ARGS
			local sep = msg:split(' ')
			local ArgCmd
			local Args = {}
			local finished = false
			for i = 1, #sep do
				if finished then
					break
				elseif sep[i] == "" then
				elseif not ArgCmd then
					ArgCmd = sep[i]
				elseif Args[numArgs - 1] or numArgs == 1 then
					table.insert(Args, sep[i])
					local AAA = {}
					for z = i, #sep do
						table.insert(AAA, sep[z])
					end
					local rest = table.concat(AAA, ' ')
					Args["rest"] = rest
					Args["REST"] = rest
					finished = true
				elseif numArgs > 0 then
					table.insert(Args, sep[i])
				end
			end
			if ArgCmd:match("^"..prefix) then
				if ArgCmd:sub(string.len(prefix) + 1):lower() == cmd:lower() then
					executed = true
					execCmd(speaker, cmd, Args, commandBar)
				end
			end
		end
	end)
end

function addCmd(cmd, alias, args, func)
	local info = {
		CMD = (type(cmd) == "string") and cmd:lower() or error("The name of a command is needed to run");
		ALIAS = alias or {};
		ARGS = args or {};
		FUNC = func or error("No function detected");
	}
	table.insert(CMDS, info)
	return info
end

--[[
//Example:
addCmd("print", {}, {"message"}, function(speaker, args, commandBar)
	print(speaker.Name.." says: "..args.rest)
end)
]]