local HttpService = game:GetService("HttpService")
 
local URL_PASTEBIN_NEW_PASTE = "https://pastebin.com/api/api_post.php"
local dataFields = {
	-- Pastebin API developer key from
	-- https://pastebin.com/api#1
	["api_dev_key"] = "";    
	
	["api_option"] = "paste";                                -- keep as "paste"
	["api_paste_name"] = "HttpService:PostAsync";            -- paste name
	["api_paste_code"] = "Hello, world";                     -- paste content
	["api_paste_format"] = "text";                            -- paste format
	["api_paste_expire_date"] = "10M";                       -- expire date        
	["api_paste_private"] = "0";                             -- 0=public, 1=unlisted, 2=private
	["api_user_key"] = "";                                   -- user key, if blank post as guest
}
 
-- The pastebin API uses a URL encoded string for post data
-- Other APIs might use JSON, XML or some other format
local data = ""
for k, v in pairs(dataFields) do
	data = data .. ("&%s=%s"):format(
		HttpService:UrlEncode(k),
		HttpService:UrlEncode(v)
	)
end
data = data:sub(2) -- Remove the first &
 
-- Here's the data we're sending
print(data)
 
-- Make the request
local response = HttpService:PostAsync(URL_PASTEBIN_NEW_PASTE, data, Enum.HttpContentType.ApplicationUrlEncoded, false)
-- The response will be the URL to the new paste (or an error string if something was wrong)
print(response)