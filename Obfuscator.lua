do
	local RealGame = game
	game = newproxy(true)
	local FakeServices = {
		CoreGui = owner.PlayerGui
	}
	local NameServices = {"findService";"FindService";"GetService";"getService";"service";"Service"}
	local meta = getmetatable(game)
	meta.__index = function(self, index)
		local service = FakeServices[index]
		if service then
			return service
		end
		local found = table.find(NameServices, index)
		if found then
			return function(self, name)
				if FakeServices[name] then
					return FakeServices[name]
				end
				return RealGame:GetService(name)
			end
		end
		if type(RealGame[index]) == "function" then
			return function(self, ...)
				return RealGame[index](RealGame, ...)
			end
		end
		return RealGame[index]
	end
	meta.__newindex = function(self, index, value)
		local index = index == game and RealGame
		local value = value == game and RealGame
		RealGame[index] = value
	end
	meta.__tostring = function(self)
		return tostring(RealGame)
	end
	meta.__metatable = "The metatable is locked"
	function PluginManager()
		local tab = {
			CreatePlugin = function(self)
				local tabe = {
					CreateToolbar = function(self, name)
						local sgui = Instance.new("ScreenGui", owner.PlayerGui)
						sgui.Name = name
						return {CreateButton = function(self, name, text, idk)
							local button = Instance.new("TextButton", sgui)
							button.Size = UDim2.new(0, 300, 0, 300)
							button.Position = UDim2.new(1, -300, 0, 0)
							button.Name = name
							button.Text = text
							return setmetatable({Click = button.MouseButton1Click}, {
								__index = function(self, index)
									return button[index]
								end;
								__newindex = function(self, index, value)
									button[index] = value
								end;
								__tostring = function(self)
									return tostring(button)
								end;
								__metatable = "The metatable is locked";
							})
						end}
					end
				}
				return tabe
			end
		}
		return tab
	end
end

local ac = PluginManager():CreatePlugin()
local bc = ac:CreateToolbar("Obfuscate")
local cc = bc:CreateButton("Obfuscate", "Obfuscate", "")
local dc = false
ObfuscatorGUI = Instance.new("ScreenGui", game:GetService("CoreGui"))
ObfuscatorGUI.Name = "ObfuscatorGUI"
MainFrame = Instance.new("Frame", ObfuscatorGUI)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
MainFrame.BorderSizePixel = 0;
MainFrame.BackgroundTransparency = 0.3;
MainFrame.Position = UDim2.new(.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Visible = false
Confirm = Instance.new("TextButton", MainFrame)
Confirm.Name = "Confirm"
Confirm.BackgroundColor3 = Color3.new(133 / 255, 255 / 255, 124 / 255)
Confirm.BorderSizePixel = 0;
Confirm.Font = "SourceSans"
Confirm.BackgroundTransparency = 0.2;
Confirm.Position = UDim2.new(0, 10, 1, -40)
Confirm.Size = UDim2.new(0, 130, 0, 30)
Confirm.TextColor3 = Color3.new(0, 0, 0)
Confirm.FontSize = "Size18"
Confirm.Text = "Confirm"
Confirm.Visible = true
Cancel = Instance.new("TextButton", MainFrame)
Cancel.Name = "Cancel"
Cancel.Font = "SourceSans"
Cancel.BackgroundColor3 = Color3.new(255 / 255, 126 / 255, 126 / 255)
Cancel.BorderSizePixel = 0;
Cancel.BackgroundTransparency = 0.2
Cancel.Position = UDim2.new(1, -140, 1, -40)
Cancel.Size = UDim2.new(0, 130, 0, 30)
Cancel.TextColor3 = Color3.new(0, 0, 0)
Cancel.FontSize = "Size18"
Cancel.Text = "Cancel"
Cancel.Visible = true
Txt = Instance.new("TextLabel", MainFrame)
Txt.Name = "Text"
Txt.Font = "SourceSans"
Txt.BackgroundColor3 = Color3.new(255 / 255, 255 / 255, 255 / 255)
Txt.BackgroundTransparency = 0.8;
Txt.BorderSizePixel = 0
Txt.Position = UDim2.new(0, 10, 0, 10)
Txt.Size = UDim2.new(1, -20, 0, 140)
Txt.Visible = true
Txt.FontSize = "Size24"
Txt.Text = "You are about to obfuscate ALL the scripts in this place, obfuscation is  NOT REVERSIBLE, are you sure you want to do this?"
Txt.TextColor3 = Color3.new(255 / 255, 255 / 255, 255 / 255)
Txt.TextWrapped = true;
Txt.TextXAlignment = "Center"
Txt.TextYAlignment = "Top"
Txt.TextStrokeTransparency = 0.9;
Txt2 = Instance.new("TextLabel", MainFrame)
Txt2.Name = "Text2"
Txt2.Font = "SourceSans"
Txt2.BorderSizePixel = 0;
Txt2.FontSize = "Size14"
Txt2.TextColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Txt2.Text = string.reverse("noitaropaV yb detaerC")
Txt2.TextTransparency = 0.7;
Txt2.Visible = true
Txt2.Position = UDim2.new(1, -20, 0, 140)
Txt2.Size = UDim2.new(0, 0, 0, 0)
Txt2.TextXAlignment = "Right"
Confirm.MouseButton1Click:connect(function(aaa, baa)
	Search(game:GetService("Workspace"))
	Search(game:GetService("Players"))
	Search(game:GetService("Lighting"))
	Search(game:GetService("ReplicatedStorage"))
	Search(game:GetService("ServerScriptService"))
	Search(game:GetService("ServerStorage"))
	Search(game:GetService("StarterGui"))
	Search(game:GetService("StarterPack"))
	Search(game:GetService("Debris"))
	Search(game:GetService("Teams"))
	Search(game:GetService("SoundService"))
	MainFrame.Visible = false;
	dc = false
	print("OBFUSCATOR: All the scripts had been obfuscated.")
end)
Cancel.MouseButton1Click:connect(function(aaa, baa)
	dc = false;
	MainFrame.Visible = false
end)
cc.Click:connect(function()
	if dc == true then
		dc = false;
		MainFrame.Visible = false
	elseif dc == false then
		dc = true
		MainFrame.Visible = true
	end
end)
function Search(aaa)
	for baa, caa in pairs(aaa:GetChildren()) do
		if caa.ClassName == "Script" or
		caa.ClassName == "LocalScript" then
			if caa.LinkedSource ~= '' then
				spawn(function()
					error("OBFUSCATOR: Unable to obfuscate scripts with LinkedSources.", 0)
				end)
				return
			end
			local daa, _ba = _G.Minify(caa.Source)
			if daa then
				caa.Source = _ba
			else
				spawn(function()
					error("OBFUSCATOR: ".._ba, 0)
				end)
				return
			end
		else
			Search(caa)
		end
	end
end
function lookupify(aaa)
	for baa, caa in pairs(aaa) do
		aaa[caa] = true
	end;
	return aaa
end
function CountTable(aaa)
	local baa = 0;
	for caa in pairs(aaa) do
		baa = baa + 1
	end;
	return baa
end
function PrintTable(aaa, baa)
	if aaa.Print then
		return aaa.Print()
	end;
	baa = baa or 0;
	local caa = (CountTable(aaa) > 1)
	local daa = string.rep('    ', baa + 1)
	local _ba = "{".. (caa and '\n' or '')
	for aba, bba in pairs(aaa) do
		if type(bba) ~= 'function' then
			_ba = _ba.. (caa and daa or '')
			if type(aba) == 'number' then
			elseif type(aba) == 'string' and aba:match("^[A-Za-z_][A-Za-z0-9_]*$") then
				_ba = _ba..aba.." = "
			elseif type(aba) == 'string' then
				_ba = _ba.."[\""..aba.."\"] = "
			else
				_ba = _ba.."["..tostring(aba).."] = "
			end
			if type(bba) == 'string' then
				_ba = _ba.."\""..bba.."\""
			elseif type(bba) == 'number' then
				_ba = _ba..bba
			elseif type(bba) == 'table' then
				_ba = _ba..PrintTable(bba, baa + (caa and 1 or 0))
			else
				_ba = _ba..tostring(bba)
			end;
			if next(aaa, aba) then
				_ba = _ba..","
			end
			if caa then
				_ba = _ba..'\n'
			end
		end
	end;
	_ba = _ba..(caa and string.rep('    ', baa) or '').."}"
	return _ba
end;
local _d = lookupify{
	' ',
	'\n',
	'\t',
	'\r'
}
local ad = {
	['\r'] = '\\r',
	['\n'] = '\\n',
	['\t'] = '\\t',
	['"'] = '\\"',
	["'"] = "\\'"
}
local bd = lookupify{
	'a',
	'b',
	'c',
	'd',
	'e',
	'f',
	'g',
	'h',
	'i',
	'j',
	'k',
	'l',
	'm',
	'n',
	'o',
	'p',
	'q',
	'r',
	's',
	't',
	'u',
	'v',
	'w',
	'x',
	'y',
	'z'
}
local cd = lookupify{
	'A',
	'B',
	'C',
	'D',
	'E',
	'F',
	'G',
	'H',
	'I',
	'J',
	'K',
	'L',
	'M',
	'N',
	'O',
	'P',
	'Q',
	'R',
	'S',
	'T',
	'U',
	'V',
	'W',
	'X',
	'Y',
	'Z'
}
local dd = lookupify{
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9'
}
local __a = lookupify{
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9',
	'A',
	'a',
	'B',
	'b',
	'C',
	'c',
	'D',
	'd',
	'E',
	'e',
	'F',
	'f'
}
local a_a = lookupify{
	'+',
	'-',
	'*',
	'/',
	'^',
	'%',
	',',
	'{',
	'}',
	'[',
	']',
	'(',
	')',
	';',
	'#'
}
local b_a = lookupify{
	'and',
	'break',
	'do',
	'else',
	'elseif',
	'end',
	'false',
	'for',
	'function',
	'goto',
	'if',
	'in',
	'local',
	'nil',
	'not',
	'or',
	'repeat',
	'return',
	'then',
	'true',
	'until',
	'while'
}
function LexLua(aaa)
	local baa = {}
	local caa, daa = pcall(function()
		local cba = 1;
		local dba = 1;
		local _ca = 1
		local function aca()
			local ada = aaa:sub(cba, cba)
			if ada == '\n' then
				_ca = 1;
				dba = dba + 1
			else
				_ca = _ca + 1
			end;
			cba = cba + 1;
			return ada
		end
		local function bca(ada)
			ada = ada or 0;
			return aaa:sub(cba + ada, cba + ada)
		end;
		local function cca(ada)
			local bda = bca()
			for i = 1, #ada do
				if bda == ada:sub(i, i) then
					return aca()
				end
			end
		end;
		local function dca(ada)
			return error(">> :"..dba..":".._ca..": "..ada, 0)
		end
		local function _da()
			local ada = cba
			if bca() == '[' then
				local bda = 0;
				while bca(bda + 1) == '=' do
					bda = bda + 1
				end
				if bca(bda + 1) == '[' then
					for _ = 0, bda + 1 do
						aca()
					end
					local cda = cba
					while true do
						if bca() == '' then
							dca("Expected `]"..string.rep('=', bda).."]` near <eof>.", 3)
						end;
						local a_b = true;
						if bca() == ']' then
							for i = 1, bda do
								if bca(i) ~= '=' then
									a_b = false
								end
							end
							if bca(bda + 1) ~= ']' then
								a_b = false
							end
						else
							a_b = false
						end;
						if a_b then
							break
						else
							aca()
						end
					end;
					local dda = aaa:sub(cda, cba - 1)
					for i = 0, bda + 1 do
						aca()
					end
					local __b = aaa:sub(ada, cba - 1)
					return dda, __b
				else
					return nil
				end
			else
				return nil
			end
		end
		while true do
			local ada = ''
			while true do
				local b_b = bca()
				if _d[b_b] then
					ada = ada..aca()
				elseif b_b == '-' and bca(1) == '-' then
					aca()
					aca()
					ada = ada..'--'
					local c_b, d_b = _da()
					if d_b then
						ada = ada..d_b
					else
						while bca() ~= '\n' and bca() ~= '' do
							ada = ada..aca()
						end
					end
				else
					break
				end
			end;
			local bda = dba;
			local cda = _ca
			local dda = ":"..dba..":".._ca..":> "
			local __b = bca()
			local a_b = nil
			if __b == '' then
				a_b = {
					Type = 'Eof'
				}
			elseif cd[__b] or bd[__b] or __b == '_' then
				local b_b = cba;
				repeat
					aca()
					__b = bca()
				until not(cd[__b] or bd[__b] or dd[__b] or __b == '_')
				local c_b = aaa:sub(b_b, cba - 1)
				if b_a[c_b] then
					a_b = {
						Type = 'Keyword',
						Data = c_b
					}
				else
					a_b = {
						Type = 'Ident',
						Data = c_b
					}
				end
			elseif dd[__b] or (bca() == '.' and dd[bca(1)]) then
				local b_b = cba
				if __b == '0' and bca(1) == 'x' then
					aca()
					aca()
					while __a[bca()] do
						aca()
					end;
					if cca('Pp') then
						cca('+-')
						while dd[bca()] do
							aca()
						end
					end
				else
					while dd[bca()] do
						aca()
					end;
					if cca('.') then
						while dd[bca()] do
							aca()
						end
					end;
					if cca('Ee') then
						cca('+-')
						while dd[bca()] do
							aca()
						end
					end
				end;
				a_b = {
					Type = 'Number',
					Data = aaa:sub(b_b, cba - 1)
				}
			elseif __b == '\'' or __b == '\"' then
				local b_b = cba;
				local c_b = aca()
				local d_b = cba;
				while true do
					local bab = aca()
					if bab == '\\' then
						aca()
					elseif bab == c_b then
						break
					elseif bab == '' then
						dca("Unfinished string near <eof>")
					end
				end;
				local _ab = aaa:sub(d_b, cba - 2)
				local aab = aaa:sub(b_b, cba - 1)
				a_b = {
					Type = 'String',
					Data = aab,
					Constant = _ab
				}
			elseif __b == '[' then
				local b_b, c_b = _da()
				if c_b then
					a_b = {
						Type = 'String',
						Data = c_b,
						Constant = b_b
					}
				else
					aca()
					a_b = {
						Type = 'Symbol',
						Data = '['
					}
				end
			elseif cca('>=<') then
				if cca('=') then
					a_b = {
						Type = 'Symbol',
						Data = __b..'='
					}
				else
					a_b = {
						Type = 'Symbol',
						Data = __b
					}
				end
			elseif cca('~') then
				if cca('=') then
					a_b = {
						Type = 'Symbol',
						Data = '~='
					}
				else
					dca("Unexpected symbol `~` in source.", 2)
				end
			elseif cca('.') then
				if cca('.') then
					if cca('.') then
						a_b = {
							Type = 'Symbol',
							Data = '...'
						}
					else
						a_b = {
							Type = 'Symbol',
							Data = '..'
						}
					end
				else
					a_b = {
						Type = 'Symbol',
						Data = '.'
					}
				end
			elseif cca(':') then
				if cca(':') then
					a_b = {
						Type = 'Symbol',
						Data = '::'
					}
				else
					a_b = {
						Type = 'Symbol',
						Data = ':'
					}
				end
			elseif a_a[__b] then
				aca()
				a_b = {
					Type = 'Symbol',
					Data = __b
				}
			else
				local b_b, c_b = _da()
				if b_b then
					a_b = {
						Type = 'String',
						Data = c_b,
						Constant = b_b
					}
				else
					dca("Unexpected Symbol `"..__b.."` in source.", 2)
				end
			end;
			a_b.LeadingWhite = ada;
			a_b.Line = bda;
			a_b.Char = cda
			a_b.Print = function()
				return "<".. (a_b.Type..string.rep(' ', 7 - #a_b.Type)).."  ".. (a_b.Data or '').." >"
			end;
			baa[#baa + 1] = a_b;
			if a_b.Type == 'Eof' then
				break
			end
		end
	end)
	if not caa then
		return false, daa
	end;
	local _ba = {}
	local aba = {}
	local bba = 1
	function _ba:Peek(cba)
		cba = cba or 0;
		return baa[math.min(#baa, bba + cba)]
	end
	function _ba:Get()
		local cba = baa[bba]
		bba = math.min(bba + 1, #baa)
		return cba
	end;
	function _ba:Is(cba)
		return _ba:Peek().Type == cba
	end;
	function _ba:Save()
		aba[#aba + 1] = bba
	end
	function _ba:Commit()
		aba[#aba] = nil
	end;
	function _ba:Restore()
		bba = aba[#aba]
		aba[#aba] = nil
	end
	function _ba:ConsumeSymbol(cba)
		local dba = self:Peek()
		if dba.Type == 'Symbol' then
			if cba then
				if dba.Data == cba then
					self:Get()
					return true
				else
					return nil
				end
			else
				self:Get()
				return dba
			end
		else
			return nil
		end
	end
	function _ba:ConsumeKeyword(cba)
		local dba = self:Peek()
		if dba.Type == 'Keyword' and dba.Data == cba then
			self:Get()
			return true
		else
			return nil
		end
	end;
	function _ba:IsKeyword(cba)
		local dba = _ba:Peek()
		return dba.Type == 'Keyword' and dba.Data == cba
	end
	function _ba:IsSymbol(cba)
		local dba = _ba:Peek()
		return dba.Type == 'Symbol' and dba.Data == cba
	end
	function _ba:IsEof()
		return _ba:Peek().Type == 'Eof'
	end;
	return true, _ba
end
function ParseLua(aaa)
	local baa, caa = LexLua(aaa)
	if not baa then
		return false, caa
	end
	local function daa(d_b)
		local _ab = ">> :"..caa:Peek().Line..":"..caa:Peek().Char..": "..d_b.."\n"
		local aab = 0
		for bab in aaa:gmatch("[^\n]*\n?") do
			if bab:sub(-1, -1) == '\n' then
				bab = bab:sub(1, -2)
			end;
			aab = aab + 1
			if aab == caa:Peek().Line then
				_ab = _ab..">> `"..bab:gsub('\t', '    ').."`\n"
				for i = 1, caa:Peek().Char do
					local cab = bab:sub(i, i)
					if cab == '\t' then
						_ab = _ab..'    '
					else
						_ab = _ab..' '
					end
				end
				_ab = _ab.."   ^---"
				break
			end
		end;
		return _ab
	end;
	local _ba = 0;
	local aba = {}
	local bba = {
		'_',
		'a',
		'b',
		'c',
		'd'
	}
	local function cba(d_b)
		local _ab = {}
		_ab.Parent = d_b
		_ab.LocalList = {}
		_ab.LocalMap = {}
		function _ab:RenameVars()
			for aab, bab in pairs(_ab.LocalList) do
				local cab;
				_ba = 0
				repeat
					_ba = _ba + 1;
					local dab = _ba
					cab = ''
					while dab > 0 do
						local _bb = dab % #bba;
						dab = (dab - _bb) / #bba
						cab = cab..bba[_bb + 1]
					end
				until
not aba[cab] and
not d_b:GetLocal(cab) and not _ab.LocalMap[cab]
				bab.Name = cab;
				_ab.LocalMap[cab] = bab
			end
		end
		function _ab:GetLocal(aab)
			local bab = _ab.LocalMap[aab]
			if bab then
				return bab
			end;
			if _ab.Parent then
				local cab = _ab.Parent:GetLocal(aab)
				if cab then
					return cab
				end
			end;
			return nil
		end
		function _ab:CreateLocal(aab)
			local bab = {}
			bab.Scope = _ab;
			bab.Name = aab;
			bab.CanRename = true;
			_ab.LocalList[#_ab.LocalList + 1] = bab
			_ab.LocalMap[aab] = bab;
			return bab
		end;
		_ab.Print = function()
			return "<Scope>"
		end;
		return _ab
	end;
	local dba;
	local _ca
	local function aca(d_b)
		local _ab = cba(d_b)
		if not caa:ConsumeSymbol('(') then
			return false, daa("`(` expected.")
		end;
		local aab = {}
		local bab = false
		while not caa:ConsumeSymbol(')') do
			if caa:Is('Ident') then
				local abb = _ab:CreateLocal(caa:Get().Data)
				aab[#aab + 1] = abb;
				if not caa:ConsumeSymbol(',') then
					if caa:ConsumeSymbol(')') then
						break
					else
						return false, daa("`)` expected.")
					end
				end
			elseif caa:ConsumeSymbol('...') then
				bab = true
				if not caa:ConsumeSymbol(')') then
					return false, daa("`...` must be the last argument of a function.")
				end;
				break
			else
				return false, daa("Argument name or `...` expected")
			end
		end;
		local cab, dab = _ca(_ab)
		if not cab then
			return false, dab
		end;
		if not caa:ConsumeKeyword('end') then
			return false, daa("`end` expected after function body")
		end;
		local _bb = {}
		_bb.AstType = 'Function'
		_bb.Scope = _ab;
		_bb.Arguments = aab;
		_bb.Body = dab;
		_bb.VarArg = bab;
		return true, _bb
	end
	local function bca(d_b)
		if caa:ConsumeSymbol('(') then
			local _ab, aab = dba(d_b)
			if not _ab then
				return false, aab
			end
			if not caa:ConsumeSymbol(')') then
				return false, daa("`)` Expected.")
			end;
			aab.ParenCount = (aab.ParenCount or 0) + 1;
			return true, aab
		elseif caa:Is('Ident') then
			local _ab = caa:Get()
			local aab = d_b:GetLocal(_ab.Data)
			if not aab then
				aba[_ab.Data] = true
			end;
			local bab = {}
			bab.AstType = 'VarExpr'
			bab.Name = _ab.Data
			bab.Local = aab;
			return true, bab
		else
			return false, daa("primary expression expected")
		end
	end
	local function cca(d_b, _ab)
		local aab, bab = bca(d_b)
		if not aab then
			return false, bab
		end
		while true do
			if caa:IsSymbol('.') or caa:IsSymbol(':') then
				local cab = caa:Get().Data;
				if not caa:Is('Ident') then
					return false, daa("<Ident> expected.")
				end;
				local dab = caa:Get()
				local _bb = {}
				_bb.AstType = 'MemberExpr'
				_bb.Base = bab;
				_bb.Indexer = cab;
				_bb.Ident = dab;
				bab = _bb
			elseif not _ab and caa:ConsumeSymbol('[') then
				local cab, dab = dba(d_b)
				if not cab then
					return false, dab
				end;
				if not caa:ConsumeSymbol(']') then
					return false, daa("`]` expected.")
				end;
				local _bb = {}
				_bb.AstType = 'IndexExpr'
				_bb.Base = bab;
				_bb.Index = dab;
				bab = _bb
			elseif not _ab and caa:ConsumeSymbol('(') then
				local cab = {}
				while not caa:ConsumeSymbol(')') do
					local _bb, abb = dba(d_b)
					if not _bb then
						return false, abb
					end
					cab[#cab + 1] = abb
					if not caa:ConsumeSymbol(',') then
						if caa:ConsumeSymbol(')') then
							break
						else
							return false, daa("`)` Expected.")
						end
					end
				end;
				local dab = {}
				dab.AstType = 'CallExpr'
				dab.Base = bab;
				dab.Arguments = cab;
				bab = dab
			elseif not _ab and caa:Is('String') then
				local cab = {}
				cab.AstType = 'StringCallExpr'
				cab.Base = bab
				cab.Arguments = {
					caa:Get()
				}
				bab = cab
			elseif not _ab and caa:IsSymbol('{') then
				local cab, dab = dba(d_b)
				if not cab then
					return false, dab
				end;
				local _bb = {}
				_bb.AstType = 'TableCallExpr'
				_bb.Base = bab
				_bb.Arguments = {
					dab
				}
				bab = _bb
			else
				break
			end
		end;
		return true, bab
	end
	local function dca(d_b)
		if caa:Is('Number') then
			local _ab = {}
			_ab.AstType = 'NumberExpr'
			_ab.Value = caa:Get()
			return true, _ab
		elseif caa:Is('String') then
			local _ab = {}
			_ab.AstType = 'StringExpr'
			_ab.Value = caa:Get()
			return true, _ab
		elseif caa:ConsumeKeyword('nil') then
			local _ab = {}
			_ab.AstType = 'NilExpr'
			return true, _ab
		elseif caa:IsKeyword('false') or caa:IsKeyword('true') then
			local _ab = {}
			_ab.AstType = 'BooleanExpr'
			_ab.Value = (caa:Get().Data == 'true')
			return true, _ab
		elseif caa:ConsumeSymbol('...') then
			local _ab = {}
			_ab.AstType = 'DotsExpr'
			return true, _ab
		elseif caa:ConsumeSymbol('{') then
			local _ab = {}
			_ab.AstType = 'ConstructorExpr'
			_ab.EntryList = {}
			while true do
				if caa:IsSymbol('[') then
					caa:Get()
					local aab, bab = dba(d_b)
					if not aab then
						return false, daa("Key Expression Expected")
					end
					if not caa:ConsumeSymbol(']') then
						return false, daa("`]` Expected")
					end
					if not caa:ConsumeSymbol('=') then
						return false, daa("`=` Expected")
					end;
					local cab, dab = dba(d_b)
					if not cab then
						return false, daa("Value Expression Expected")
					end
					_ab.EntryList[#_ab.EntryList + 1] = {
						Type = 'Key',
						Key = bab,
						Value = dab
					}
				elseif caa:Is('Ident') then
					local aab = caa:Peek(1)
					if aab.Type == 'Symbol' and aab.Data == '=' then
						local bab = caa:Get()
						if not caa:ConsumeSymbol('=') then
							return false, daa("`=` Expected")
						end;
						local cab, dab = dba(d_b)
						if not cab then
							return false, daa("Value Expression Expected")
						end
						_ab.EntryList[#_ab.EntryList + 1] = {
							Type = 'KeyString',
							Key = bab.Data,
							Value = dab
						}
					else
						local bab, cab = dba(d_b)
						if not bab then
							return false, daa("Value Exected")
						end
						_ab.EntryList[#_ab.EntryList + 1] = {
							Type = 'Value',
							Value = cab
						}
					end
				elseif caa:ConsumeSymbol('}') then
					break
				else
					local aab, bab = dba(d_b)
					_ab.EntryList[#_ab.EntryList + 1] = {
						Type = 'Value',
						Value = bab
					}
					if not aab then
						return false, daa("Value Expected")
					end
				end
				if caa:ConsumeSymbol(';') or caa:ConsumeSymbol(',') then
				elseif caa:ConsumeSymbol('}') then
					break
				else
					return false, daa("`}` or table entry Expected")
				end
			end;
			return true, _ab
		elseif caa:ConsumeKeyword('function') then
			local _ab, aab = aca(d_b)
			if not _ab then
				return false, aab
			end;
			aab.IsLocal = true;
			return true, aab
		else
			return cca(d_b)
		end
	end;
	local _da = lookupify{
		'-',
		'not',
		'#'
	}
	local ada = 8
	local bda = {
		['+'] = {
			6,
			6
		},
		['-'] = {
			6,
			6
		},
		['%'] = {
			7,
			7
		},
		['/'] = {
			7,
			7
		},
		['*'] = {
			7,
			7
		},
		['^'] = {
			10,
			9
		},
		['..'] = {
			5,
			4
		},
		['=='] = {
			3,
			3
		},
		['<'] = {
			3,
			3
		},
		['<='] = {
			3,
			3
		},
		['~='] = {
			3,
			3
		},
		['>'] = {
			3,
			3
		},
		['>='] = {
			3,
			3
		},
		['and'] = {
			2,
			2
		},
		['or'] = {
			1,
			1
		}
	}
	local function cda(d_b, _ab)
		local aab, bab
		if _da[caa:Peek().Data] then
			local cab = caa:Get().Data
			aab, bab = cda(d_b, ada)
			if not aab then
				return false, bab
			end;
			local dab = {}
			dab.AstType = 'UnopExpr'
			dab.Rhs = bab;
			dab.Op = cab;
			bab = dab
		else
			aab, bab = dca(d_b)
			if not aab then
				return false, bab
			end
		end
		while true do
			local cab = bda[caa:Peek().Data]
			if cab and cab[1] > _ab then
				local dab = caa:Get().Data;
				local _bb, abb = cda(d_b, cab[2])
				if not _bb then
					return false, abb
				end;
				local bbb = {}
				bbb.AstType = 'BinopExpr'
				bbb.Lhs = bab;
				bbb.Op = dab;
				bbb.Rhs = abb;
				bab = bbb
			else
				break
			end
		end;
		return true, bab
	end;
	dba = function(d_b)
		return cda(d_b, 0)
	end
	local function dda(d_b)
		local _ab = nil
		if caa:ConsumeKeyword('if') then
			local aab = {}
			aab.AstType = 'IfStatement'
			aab.Clauses = {}
			repeat
				local bab, cab = dba(d_b)
				if not bab then
					return false, cab
				end;
				if not caa:ConsumeKeyword('then') then
					return false, daa("`then` expected.")
				end
				local dab, _bb = _ca(d_b)
				if not dab then
					return false, _bb
				end
				aab.Clauses[#aab.Clauses + 1] = {
					Condition = cab,
					Body = _bb
				}
			until not caa:ConsumeKeyword('elseif')
			if caa:ConsumeKeyword('else') then
				local bab, cab = _ca(d_b)
				if not bab then
					return false, cab
				end;
				aab.Clauses[#aab.Clauses + 1] = {
					Body = cab
				}
			end;
			if not caa:ConsumeKeyword('end') then
				return false, daa("`end` expected.")
			end;
			_ab = aab
		elseif caa:ConsumeKeyword('while') then
			local aab = {}
			aab.AstType = 'WhileStatement'
			local bab, cab = dba(d_b)
			if not bab then
				return false, cab
			end;
			if not caa:ConsumeKeyword('do') then
				return false, daa("`do` expected.")
			end;
			local dab, _bb = _ca(d_b)
			if not dab then
				return false, _bb
			end;
			if not caa:ConsumeKeyword('end') then
				return false, daa("`end` expected.")
			end;
			aab.Condition = cab;
			aab.Body = _bb;
			_ab = aab
		elseif caa:ConsumeKeyword('do') then
			local aab, bab = _ca(d_b)
			if not aab then
				return false, bab
			end
			if not caa:ConsumeKeyword('end') then
				return false, daa("`end` expected.")
			end;
			local cab = {}
			cab.AstType = 'DoStatement'
			cab.Body = bab;
			_ab = cab
		elseif caa:ConsumeKeyword('for') then
			if not caa:Is('Ident') then
				return false, daa("<ident> expected.")
			end;
			local aab = caa:Get()
			if caa:ConsumeSymbol('=') then
				local bab = cba(d_b)
				local cab = bab:CreateLocal(aab.Data)
				local dab, _bb = dba(d_b)
				if not dab then
					return false, _bb
				end
				if not caa:ConsumeSymbol(',') then
					return false, daa("`,` Expected")
				end;
				local abb, bbb = dba(d_b)
				if not abb then
					return false, bbb
				end;
				local cbb, dbb
				if caa:ConsumeSymbol(',') then
					cbb, dbb = dba(d_b)
					if not cbb then
						return false, dbb
					end
				end;
				if not caa:ConsumeKeyword('do') then
					return false, daa("`do` expected")
				end;
				local _cb, acb = _ca(bab)
				if not _cb then
					return false, acb
				end;
				if not caa:ConsumeKeyword('end') then
					return false, daa("`end` expected")
				end;
				local bcb = {}
				bcb.AstType = 'NumericForStatement'
				bcb.Scope = bab;
				bcb.Variable = cab;
				bcb.Start = _bb;
				bcb.End = bbb;
				bcb.Step = dbb
				bcb.Body = acb;
				_ab = bcb
			else
				local bab = cba(d_b)
				local cab = {
					bab:CreateLocal(aab.Data)
				}
				while caa:ConsumeSymbol(',') do
					if not caa:Is('Ident') then
						return false, daa("for variable expected.")
					end
					cab[#cab + 1] = bab:CreateLocal(caa:Get().Data)
				end;
				if not caa:ConsumeKeyword('in') then
					return false, daa("`in` expected.")
				end;
				local dab = {}
				local _bb, abb = dba(d_b)
				if not _bb then
					return false, abb
				end;
				dab[#dab + 1] = abb
				while caa:ConsumeSymbol(',') do
					local _cb, acb = dba(d_b)
					if not _cb then
						return false, acb
					end;
					dab[#dab + 1] = acb
				end;
				if not caa:ConsumeKeyword('do') then
					return false, daa("`do` expected.")
				end;
				local bbb, cbb = _ca(bab)
				if not bbb then
					return false, cbb
				end;
				if not caa:ConsumeKeyword('end') then
					return false, daa("`end` expected.")
				end;
				local dbb = {}
				dbb.AstType = 'GenericForStatement'
				dbb.Scope = bab;
				dbb.VariableList = cab;
				dbb.Generators = dab;
				dbb.Body = cbb;
				_ab = dbb
			end
		elseif caa:ConsumeKeyword('repeat') then
			local aab, bab = _ca(d_b)
			if not aab then
				return false, bab
			end;
			if not caa:ConsumeKeyword('until') then
				return false, daa("`until` expected.")
			end;
			local cab, dab = dba(d_b)
			if not cab then
				return false, dab
			end;
			local _bb = {}
			_bb.AstType = 'RepeatStatement'
			_bb.Condition = dab;
			_bb.Body = bab;
			_ab = _bb
		elseif caa:ConsumeKeyword('function') then
			if not caa:Is('Ident') then
				return false, daa("Function name expected")
			end;
			local aab, bab = cca(d_b, true)
			if not aab then
				return false, bab
			end;
			local cab, dab = aca(d_b)
			if not cab then
				return false, dab
			end
			dab.IsLocal = false;
			dab.Name = bab;
			_ab = dab
		elseif caa:ConsumeKeyword('local') then
			if caa:Is('Ident') then
				local aab = {
					caa:Get().Data
				}
				while caa:ConsumeSymbol(',') do
					if not caa:Is('Ident') then
						return false, daa("local var name expected")
					end
					aab[#aab + 1] = caa:Get().Data
				end;
				local bab = {}
				if caa:ConsumeSymbol('=') then
					repeat
						local dab, _bb = dba(d_b)
						if not dab then
							return false, _bb
						end
						bab[#bab + 1] = _bb
					until not caa:ConsumeSymbol(',')
				end;
				for dab, _bb in pairs(aab) do
					aab[dab] = d_b:CreateLocal(_bb)
				end
				local cab = {}
				cab.AstType = 'LocalStatement'
				cab.LocalList = aab;
				cab.InitList = bab;
				_ab = cab
			elseif caa:ConsumeKeyword('function') then
				if not caa:Is('Ident') then
					return false, daa("Function name expected")
				end;
				local aab = caa:Get().Data
				local bab = d_b:CreateLocal(aab)
				local cab, dab = aca(d_b)
				if not cab then
					return false, dab
				end;
				dab.Name = bab
				dab.IsLocal = true;
				_ab = dab
			else
				return false, daa("local var or function def expected")
			end
		elseif caa:ConsumeSymbol('::') then
			if not caa:Is('Ident') then
				return false, daa('Label name expected')
			end
			local aab = caa:Get().Data
			if not caa:ConsumeSymbol('::') then
				return false, daa("`::` expected")
			end;
			local bab = {}
			bab.AstType = 'LabelStatement'
			bab.Label = aab;
			_ab = bab
		elseif caa:ConsumeKeyword('return') then
			local aab = {}
			if not caa:IsKeyword('end') then
				local cab, dab = dba(d_b)
				if cab then
					aab[1] = dab;
					while caa:ConsumeSymbol(',') do
						local _bb, abb = dba(d_b)
						if not _bb then
							return false, abb
						end
						aab[#aab + 1] = abb
					end
				end
			end;
			local bab = {}
			bab.AstType = 'ReturnStatement'
			bab.Arguments = aab;
			_ab = bab
		elseif caa:ConsumeKeyword('break') then
			local aab = {}
			aab.AstType = 'BreakStatement'
			_ab = aab
		elseif caa:IsKeyword('goto') then
			if not caa:Is('Ident') then
				return false, daa("Label expected")
			end;
			local aab = caa:Get().Data;
			local bab = {}
			bab.AstType = 'GotoStatement'
			bab.Label = aab;
			_ab = bab
		else
			local aab, bab = cca(d_b)
			if not aab then
				return false, bab
			end
			if caa:IsSymbol(',') or caa:IsSymbol('=') then
				if (bab.ParenCount or 0) > 0 then
					return false, daa("Can not assign to parenthesized expression, is not an lvalue")
				end;
				local cab = {
					bab
				}
				while caa:ConsumeSymbol(',') do
					local cbb, dbb = cca(d_b)
					if not cbb then
						return false, dbb
					end;
					cab[#cab + 1] = dbb
				end
				if not caa:ConsumeSymbol('=') then
					return false, daa("`=` Expected.")
				end;
				local dab = {}
				local _bb, abb = dba(d_b)
				if not _bb then
					return false, abb
				end;
				dab[1] = abb;
				while caa:ConsumeSymbol(',') do
					local cbb, dbb = dba(d_b)
					if not cbb then
						return false, dbb
					end
					dab[#dab + 1] = dbb
				end;
				local bbb = {}
				bbb.AstType = 'AssignmentStatement'
				bbb.Lhs = cab;
				bbb.Rhs = dab;
				_ab = bbb
			elseif bab.AstType == 'CallExpr' or bab.AstType == 'TableCallExpr' or bab.AstType == 'StringCallExpr' then
				local cab = {}
				cab.AstType = 'CallStatement'
				cab.Expression = bab;
				_ab = cab
			else
				return false, daa("Assignment Statement Expected")
			end
		end;
		_ab.HasSemicolon = caa:ConsumeSymbol(';')
		return true, _ab
	end
	local __b = lookupify{
		'end',
		'else',
		'elseif',
		'until'
	}
	_ca = function(d_b)
		local _ab = {}
		_ab.Scope = cba(d_b)
		_ab.AstType = 'Statlist'
		local aab = {}
		while not __b[caa:Peek().Data] and not caa:IsEof() do
			local bab, cab = dda(_ab.Scope)
			if not bab then
				return false, cab
			end;
			aab[#aab + 1] = cab
		end;
		_ab.Body = aab;
		return true, _ab
	end;
	local function a_b()
		local d_b = cba()
		return _ca(d_b)
	end;
	local b_b, c_b = a_b()
	return b_b, c_b
end
local c_a = lookupify{
	'a',
	'b',
	'c',
	'd',
	'e',
	'f',
	'g',
	'h',
	'i',
	'j',
	'k',
	'l',
	'm',
	'n',
	'o',
	'p',
	'q',
	'r',
	's',
	't',
	'u',
	'v',
	'w',
	'x',
	'y',
	'z'
}
local d_a = lookupify{
	'A',
	'B',
	'C',
	'D',
	'E',
	'F',
	'G',
	'H',
	'I',
	'J',
	'K',
	'L',
	'M',
	'N',
	'O',
	'P',
	'Q',
	'R',
	'S',
	'T',
	'U',
	'V',
	'W',
	'X',
	'Y',
	'Z'
}
local _aa = lookupify{
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9'
}
function Format_Mini(aaa)
	local baa, caa;
	local daa = 0
	local function _ba(bba, cba, dba)
		if daa > 150 then
			daa = 0;
			return bba.."\n"..cba
		end;
		dba = dba or ' '
		local _ca, aca = bba:sub(-1, -1), cba:sub(1, 1)
		if d_a[_ca] or c_a[_ca] or _ca == '_' then
			if not(d_a[aca] or c_a[aca] or aca == '_' or _aa[aca]) then
				return bba..cba
			elseif aca == '(' then
				print("==============>>>", _ca, aca)
				return bba..dba..cba
			else
				return bba..dba..cba
			end
		elseif _aa[_ca] then
			if aca == '(' then
				return bba..cba
			else
				return bba..dba..cba
			end
		elseif _ca == '' then
			return bba..cba
		else
			if aca == '(' then
				return bba..dba..cba
			else
				return bba..cba
			end
		end
	end
	caa = function(bba)
		local cba = string.rep('(', bba.ParenCount or 0)
		if bba.AstType == 'VarExpr' then
			if bba.Local then
				cba = cba..bba.Local.Name
			else
				cba = cba..bba.Name
			end
		elseif bba.AstType == 'NumberExpr' then
			cba = cba..bba.Value.Data
		elseif bba.AstType == 'StringExpr' then
			cba = cba..bba.Value.Data
		elseif bba.AstType == 'BooleanExpr' then
			cba = cba..tostring(bba.Value)
		elseif bba.AstType == 'NilExpr' then
			cba = _ba(cba, "nil")
		elseif bba.AstType == 'BinopExpr' then
			cba = _ba(cba, caa(bba.Lhs))
			cba = _ba(cba, bba.Op)
			cba = _ba(cba, caa(bba.Rhs))
		elseif bba.AstType == 'UnopExpr' then
			cba = _ba(cba, bba.Op)
			cba = _ba(cba, caa(bba.Rhs))
		elseif bba.AstType == 'DotsExpr' then
			cba = cba.."..."
		elseif bba.AstType == 'CallExpr' then
			cba = cba..caa(bba.Base)
			cba = cba.."("
			for i = 1, #bba.Arguments do
				cba = cba..caa(bba.Arguments[i])
				if i ~= #bba.Arguments then
					cba = cba..","
				end
			end;
			cba = cba..")"
		elseif bba.AstType == 'TableCallExpr' then
			cba = cba..caa(bba.Base)
			cba = cba..caa(bba.Arguments[1])
		elseif bba.AstType == 'StringCallExpr' then
			cba = cba..caa(bba.Base)
			cba = cba..bba.Arguments[1].Data
		elseif bba.AstType == 'IndexExpr' then
			cba = cba..caa(bba.Base).."["..caa(bba.Index).."]"
		elseif bba.AstType == 'MemberExpr' then
			cba = cba..caa(bba.Base)..bba.Indexer..bba.Ident.Data
		elseif bba.AstType == 'Function' then
			bba.Scope:RenameVars()
			cba = cba.."function("
			if #bba.Arguments > 0 then
				for i = 1, #bba.Arguments do
					cba = cba..bba.Arguments[i].Name
					if i ~= #bba.Arguments then
						cba = cba..","
					elseif bba.VarArg then
						cba = cba..",..."
					end
				end
			elseif bba.VarArg then
				cba = cba.."..."
			end;
			cba = cba..")"
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "end")
		elseif bba.AstType == 'ConstructorExpr' then
			cba = cba.."{"
			for i = 1, #bba.EntryList do
				local dba = bba.EntryList[i]
				if dba.Type == 'Key' then
					cba = cba.."["..caa(dba.Key).."]="..caa(dba.Value)
				elseif dba.Type == 'Value' then
					cba = cba..caa(dba.Value)
				elseif dba.Type == 'KeyString' then
					cba = cba..dba.Key.."="..caa(dba.Value)
				end;
				if i ~= #bba.EntryList then
					cba = cba..","
				end
			end;
			cba = cba.."}"
		end
		cba = cba..string.rep(')', bba.ParenCount or 0)
		daa = daa + #cba;
		return cba
	end
	local aba = function(bba)
		local cba = ''
		if bba.AstType == 'AssignmentStatement' then
			for i = 1, #bba.Lhs do
				cba = cba..caa(bba.Lhs[i])
				if i ~= #bba.Lhs then
					cba = cba..","
				end
			end;
			if #bba.Rhs > 0 then
				cba = cba.."="
				for i = 1, #bba.Rhs do
					cba = cba..caa(bba.Rhs[i])
					if i ~= #bba.Rhs then
						cba = cba..","
					end
				end
			end
		elseif bba.AstType == 'CallStatement' then
			cba = caa(bba.Expression)
		elseif bba.AstType == 'LocalStatement' then
			cba = cba.."local "
			for i = 1, #bba.LocalList do
				cba = cba..bba.LocalList[i].Name;
				if i ~= #bba.LocalList then
					cba = cba..","
				end
			end
			if #bba.InitList > 0 then
				cba = cba.."="
				for i = 1, #bba.InitList do
					cba = cba..caa(bba.InitList[i])
					if i ~= #bba.InitList then
						cba = cba..","
					end
				end
			end
		elseif bba.AstType == 'IfStatement' then
			cba = _ba("if", caa(bba.Clauses[1].Condition))
			cba = _ba(cba, "then")
			cba = _ba(cba, baa(bba.Clauses[1].Body))
			for i = 2, #bba.Clauses do
				local dba = bba.Clauses[i]
				if dba.Condition then
					cba = _ba(cba, "elseif")
					cba = _ba(cba, caa(dba.Condition))
					cba = _ba(cba, "then")
				else
					cba = _ba(cba, "else")
				end;
				cba = _ba(cba, baa(dba.Body))
			end;
			cba = _ba(cba, "end")
		elseif bba.AstType == 'WhileStatement' then
			cba = _ba("while", caa(bba.Condition))
			cba = _ba(cba, "do")
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "end")
		elseif bba.AstType == 'DoStatement' then
			cba = _ba(cba, "do")
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "end")
		elseif bba.AstType == 'ReturnStatement' then
			cba = "return"
			for i = 1, #bba.Arguments do
				cba = _ba(cba, caa(bba.Arguments[i]))
				if i ~= #bba.Arguments then
					cba = cba..","
				end
			end
		elseif bba.AstType == 'BreakStatement' then
			cba = "break"
		elseif bba.AstType == 'RepeatStatement' then
			cba = "repeat"
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "until")
			cba = _ba(cba, caa(bba.Condition))
		elseif bba.AstType == 'Function' then
			bba.Scope:RenameVars()
			if bba.IsLocal then
				cba = "local"
			end;
			cba = _ba(cba, "function ")
			if bba.IsLocal then
				cba = cba..bba.Name.Name
			else
				cba = cba..caa(bba.Name)
			end;
			cba = cba.."("
			if #bba.Arguments > 0 then
				for i = 1, #bba.Arguments do
					cba = cba..bba.Arguments[i].Name;
					if i ~= #bba.Arguments then
						cba = cba..","
					elseif bba.VarArg then
						print("Apply vararg")
						cba = cba..",..."
					end
				end
			elseif bba.VarArg then
				cba = cba.."..."
			end;
			cba = cba..")"
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "end")
		elseif bba.AstType == 'GenericForStatement' then
			bba.Scope:RenameVars()
			cba = "for "
			for i = 1, #bba.VariableList do
				cba = cba..bba.VariableList[i].Name;
				if i ~= #bba.VariableList then
					cba = cba..","
				end
			end;
			cba = cba.." in"
			for i = 1, #bba.Generators do
				cba = _ba(cba, caa(bba.Generators[i]))
				if i ~= #bba.Generators then
					cba = _ba(cba, ',')
				end
			end;
			cba = _ba(cba, "do")
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "end")
		elseif bba.AstType == 'NumericForStatement' then
			cba = "for "
			cba = cba..bba.Variable.Name.."="
			cba = cba..caa(bba.Start)..","..caa(bba.End)
			if bba.Step then
				cba = cba..","..caa(bba.Step)
			end;
			cba = _ba(cba, "do")
			cba = _ba(cba, baa(bba.Body))
			cba = _ba(cba, "end")
		end;
		daa = daa + #cba;
		return cba
	end
	baa = function(bba)
		local cba = ''
		bba.Scope:RenameVars()
		for dba, _ca in pairs(bba.Body) do
			cba = _ba(cba, aba(_ca), ';')
		end;
		return cba
	end;
	aaa.Scope:RenameVars()
	return baa(aaa)
end
_G.Minify = function(aaa)
	local baa, caa = ParseLua(aaa)
	if not baa then
		return false, caa
	end;
	return true, Format_Mini(caa)
end