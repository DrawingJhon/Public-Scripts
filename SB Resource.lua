local source = [==[
local lb = [[
function LoadLibrary(idk)
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
        end
    }
end
 ]]
local owner = game:GetService("Players").JhonXD2006
function NLS(code, parent) local nls = require(5576043691).NLS([[local owner = game:GetService('Players').LocalPlayer
 ]]..lb..code, parent) return nls end
function LoadLibrary(idk)
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
        end
    }
end
]==]..code