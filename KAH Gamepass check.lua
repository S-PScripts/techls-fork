local sprefix = "!"
local id1 = 66254 -- NBC PERM
local id2 = 64354 -- BC PERM
local id3 = 35748 -- NBC PERSONS
local id4 = 37127 -- BC PERSONS

function getplayername(plr)
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.sub(v.Name:lower(), 1, #plr) == plr then
            playr = v.Name
            playnl = v
        end
     end
 end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        
    if string.sub(msg, 1, #sprefix + 5) == sprefix..'permc' then
        playnl = nil
        getplayername(string.sub(msg, #sprefix + 7, #msg))
            
        if playnl ~= nil then
            print(playnl.."was found!")
        else
            print(playnl.."could not be found.")
        end
        task.wait()
            
        if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. playnl.UserId .. "/items/GamePass/" .. id1), id1) then
            print(playr..' has perm in NBC')
        elseif string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. playnl.UserId .. "/items/GamePass/" .. id2), id2) then
            print(playr..' has perm in BC')
        else 
        print('Perm', playr..' does not have Perm')
        end
    end

      if string.sub(msg, 1, #sprefix + 7) == sprefix..'personc' then
        playnl = nil
        getplayername(string.sub(msg, #sprefix + 9, #msg))
            
        if playnl ~= nil then
            print(playnl.."was found!")
        else
            print(playnl.."could not be found.")
        end
        task.wait()
            
        if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. playnl.UserId .. "/items/GamePass/" .. id3), id3) then
            print(playr..' has persons in NBC')
        elseif string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. playnl.UserId .. "/items/GamePass/" .. id4), id4) then
            print(playr..' has persons in BC')
        else 
        print('Perm', playr..' does not have Persons')
        end
    end
        
end)
