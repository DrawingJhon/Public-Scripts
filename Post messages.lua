local webhook = "https://discord.com/api/webhooks/803639603172606002/byTbcu2BhlQ2IgwaSFGxKqDBp5Yk6cyvfGIkLUcH7PUPcM6eCyQf8Q8Ze-RfiQ3lQMV5"

local http = game:GetService("HttpService")

function normal_msg(message)
	local data = {
		content = message;
		username = "Message posted";
	}
	http:PostAsync(webhook, http:JSONEncode(data))
end

local senders = {
	Normal = normal_msg;
}

_G.Message = function(name, data)
	local func = senders[tostring(name)] or error("There is not any sender named: "..tostring(name))
	return func(data)
end