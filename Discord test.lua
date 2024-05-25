local HttpService = game:GetService("HttpService")
local disabled = false
local webhook = "https://discord.com/api/webhooks/717394130849759293/U35GhxkKEDej4I3GrQlTqiHCUceAOJ7Bh54JYWM6i47XH2a1zAIMDv71Mh9MiuKpKkeh"
local GetPlace = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
--print(GetPlace.Name)
local list = {"Player1","Player2","Player3","Player4"}
for i, v in pairs(list) do
if disabled == false then
	local data = {
		['embeds'] = {{
			['title'] = "Player Joined!",
			['description'] = "Something left the game!",
			['color'] = 33535,
			['fields'] = {
				{
					['name'] = "**There are 4 players:**",
					['value'] = v,
					['inline'] = true
				},
				{
					['name'] = "**Game:**",
					['value'] = "["..GetPlace.Name.."](..https://www.roblox.com/games/"..game.PlaceId..")",
					['inline'] = true
				}
			},
			['thumbnail'] = {
				['url'] = "https://www.roblox.com/bust-thumbnail/image?userId=652513366&width=420&height=420&format=png"
			}
		}}
	}
	HttpService:PostAsync(webhook, HttpService:JSONEncode(data))
end
end