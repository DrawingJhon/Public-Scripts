plrs = game:GetService("Players")
for i,v in pairs(plrs:GetChildren()) do
    if v.ClassName == "Player" then
        local chatalready = v:findFirstChild("HasOof")
        if chatalready then
            chatalready:destroy()
        end
    end
end
while wait(0.5) do
    if not script:findFirstChild("OofSoundEffect#2") then
        local oofsound = Instance.new("Sound", script)
        oofsound.SoundId = "rbxassetid://1096783747"
        oofsound.Volume = 4.5
        oofsound.Name = "OofSoundEffect#2"
        oofsound.PlayOnRemove = true
    end
    for i,v in pairs(plrs:GetChildren()) do
        if v.ClassName == "Player" then
            local chatalready = v:findFirstChild("HasOOF")
            if not chatalready then
                local chatyes = Instance.new("BoolValue", v)
                chatyes.Name = "HasOof"
                local function dochat(message)
                    if script:FindFirstChild("OofSoundEffect#2") then
                        if script:FindFirstChild("OofSoundEffect#2"):findFirstChild("slowoof") then
                            script:FindFirstChild("OofSoundEffect#2"):findFirstChild("slowoof"):destroy()
                        end
                        script:FindFirstChild("OofSoundEffect#2").PlaybackSpeed = 1
                        if string.match(message,"ooof",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 4.5
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                            local pitchshift = Instance.new("PitchShiftSoundEffect", script:FindFirstChild("OofSoundEffect#2"))
                            pitchshift.Octave = 2
                            pitchshift.Name = "slowoof"
                            script:FindFirstChild("OofSoundEffect#2").PlaybackSpeed = 0.5
                        elseif string.match(message,"OOOF	",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 10
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                            local pitchshift = Instance.new("PitchShiftSoundEffect", script:FindFirstChild("OofSoundEffect#2"))
                            pitchshift.Octave = 2
                            pitchshift.Name = "slowoof"
                            script:FindFirstChild("OofSoundEffect#2").PlaybackSpeed = 0.5
                        elseif string.match(message,"Oof",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 4.5
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                        elseif string.match(message,"OOF",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 10
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                        elseif string.match(message,"oo",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 4.5
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                            local function aaa()
                                wait(0.3)
                                script:FindFirstChild("OofSoundEffect#2"):Stop()
                            end
                            spawn(aaa)
                        elseif string.match(message,"OO",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 10
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                            local function aaa()
                                wait(0.3)
                                script:FindFirstChild("OofSoundEffect#2"):Stop()
                            end
                            spawn(aaa)
                        elseif string.match(message,"of",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 4.5
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                            local function aaa()
                                wait(0.15)
                                script:FindFirstChild("OofSoundEffect#2"):Stop()
                            end
                            spawn(aaa)
                        elseif string.match(message,"OF",1) then
                            script:FindFirstChild("OofSoundEffect#2").Volume = 10
                            script:FindFirstChild("OofSoundEffect#2").TimePosition = 0.5
                            script:FindFirstChild("OofSoundEffect#2"):Play()
                            local function aaa()
                                wait(0.15)
                                script:FindFirstChild("OofSoundEffect#2"):Stop()
                            end
                            spawn(aaa)
                        end
                    end
                end
                v.Chatted:connect(dochat)
            end
        end
    end
end