local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local Player = game:GetService("Players").LocalPlayer

local BubbleChatContainer = CoreGui.BubbleChat

local cache = {}
local requesting = {}

local doTranslate = false

function translateText(text)
	if not text:match("%a") then
		return text
	end

	if cache[text] then
		return cache[text]
	end

	if requesting[text] then
		return requesting[text]()
	end

	local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=es&dt=t&q="..HttpService:UrlEncode(text)
	local bindable = Instance.new("BindableEvent")
	local fireResult

	bindable.Event:Connect(function(result)
		fireResult = result
	end)

	requesting[text] = function()
		if fireResult then
			return fireResult
		end
		return bindable.Event:Wait()
	end

	local response = game:HttpGetAsync(url)
	local translated

	local success, err = pcall(function()
		local data = HttpService:JSONDecode(response)
		translated = data[1][1][1]
	end)

	if not translated or type(translated) ~= "string" then
		if err then
			warn("Something went wrong trying to translate \""..text.."\". Error: "..err)
		else
			warn("Something went wrong trying to translate \""..text.."\". No error but with type of text: "..typeof(translated))
		end
		bindable:Fire(text)
		return text
	end

	cache[text] = translated
	bindable:Fire(translated)

	return translated
end

function onBubbleChatted(frame)
	if not doTranslate then
		return
	end

	local TextLabel = frame:WaitForChild("Frame"):WaitForChild("Text")

	TextLabel.TextScaled = true
	TextLabel.Text = translateText(TextLabel.Text)

	local assignedText = {}

	TextLabel:GetPropertyChangedSignal("Text"):Connect(function()
		local text = TextLabel.Text
		if assignedText[text] then return end
		local translated = translateText(TextLabel.Text)
		assignedText[translated] = true
		TextLabel.Text = translated
	end)
end

function checkBubbleChatList(bubbleChatList)
	for _, child in pairs(bubbleChatList:GetChildren()) do
		if child:IsA("Frame") then
			onBubbleChatted(child)
		end
	end

	bubbleChatList.ChildAdded:Connect(function(child)
		if child:IsA("Frame") then
			onBubbleChatted(child)
		end
	end)
end

function checkBubbleChat(billboardGui)
	if not billboardGui:IsA("BillboardGui") then return end

	if Player.Character and billboardGui.Adornee:IsDescendantOf(Player.Character) then
		return
	end

	if billboardGui:FindFirstChild("BubbleChatList") then
		checkBubbleChatList(billboardGui.BubbleChatList)
	end

	billboardGui.ChildAdded:Connect(function(child)
		if child.Name == "BubbleChatList" then
			checkBubbleChatList(child)
		end
	end)
end

for _, child in pairs(BubbleChatContainer:GetChildren()) do
	checkBubbleChat(child)
end

BubbleChatContainer.ChildAdded:Connect(checkBubbleChat)

Player.Chatted:Connect(function(message)
	message = message:lower()

	if message == "/e translate" then
		doTranslate = true
	end

	if message == "/e untranslate" then
		doTranslate = false
	end
end)