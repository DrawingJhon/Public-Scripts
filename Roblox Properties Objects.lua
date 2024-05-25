 local ClassProperties do
    -- ClassProperties is a Dictionary of sorted arrays of Properties of Classes
    -- Pulls from anaminus.github.io
    -- Ignores deprecated and RobloxPluginSecurity Properties
    -- Make sure HttpService is Enabled (Roblox Studio -> Home Tab -> Game Settings -> Security -> Allow HTTP requests = "On")

    ClassProperties = {}
    local HttpService = game:GetService("HttpService")

    local Data = HttpService:JSONDecode(HttpService:GetAsync("https://anaminus.github.io/rbx/json/api/latest.json"))

    for i = 1, #Data do
        local Table = Data[i]
        local Type = Table.type

        if Type == "Class" then
            local ClassData = {}

            local Superclass = ClassProperties[Table.Superclass]

            if Superclass then
                for j = 1, #Superclass do
                    ClassData[j] = Superclass[j]
                end
            end

            ClassProperties[Table.Name] = ClassData
        elseif Type == "Property" then
            if not next(Table.tags) then
                local Class = ClassProperties[Table.Class]
                local Property = Table.Name
                local Inserted

                for j = 1, #Class do
                    if Property < Class[j] then -- Determine whether `Property` precedes `Class[j]` alphabetically
                        Inserted = true
                        table.insert(Class, j, Property)
                        break
                    end
                end

                if not Inserted then
                    table.insert(Class, Property)
                end
            end
        elseif Type == "Function" then
        elseif Type == "YieldFunction" then
        elseif Type == "Event" then
        elseif Type == "Callback" then
        elseif Type == "Enum" then
        elseif Type == "EnumItem" then
        end
    end
end

--table.foreach(ClassProperties["Part"], print)
for i, v in pairs(ClassProperties["Part"]) do
 print(v)
end