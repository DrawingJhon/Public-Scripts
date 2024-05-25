function LoadLibrary(idk)
	if idk == "RbxUtility" then
		return {Create = function(object)
			local ob = Instance.new(object)
			return function(properties)
				if typeof(properties) == "table" then
					for pr, val in pairs(properties) do
						ob[pr] = val
					end
				end
        		        return ob
			end
		end}
	else
		error("LoadLibrary other type detected")
	end
end
 