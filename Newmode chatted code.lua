for i,v in pairs(game.Players:GetChildren()) do
	PLRSTART(v)
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

local function onPlayerAdded(player)
     PLRSTART(player)
end

local prefix = "!"
local noobdetect = true

function PLRSTART(v)
plr.Chatted:Connect(function(msg)
    task.spawn(function()
     if noobdetect == true then
    	        if message:lower() == ";fly" and v ~= game.Players.LocalPlayer then
                   print(v.Name..' is a noob.')
                   Chat('h [KohlsLite]: '..v.Name..', it is fly me, not ;fly!!')
                end
                if message:lower():find(";poop") or message:lower():find(":poop") or message:lower():find("poop") then
                   print(v.Name..' is a noob.')
                   Chat('h [KohlsLite]: '..v.Name..', go back to FREE ADMIN, POOP IS NOT A COMMAND!!')
                end
                if message:lower():find(";morph") or message:lower():find(":morph") or message:lower():find("morph") then
                   print(v.Name..' is a noob.')
                   Chat('h [KohlsLite]: '..v.Name..', go back to FREE ADMIN, MORPH IS NOT A COMMAND!!')
                end
                if message:lower() == ";fly me" then
                   print(v.Name..' is a noob.') 
                   Chat('h [KohlsLite]: '..v.Name..', imagine using the ; prefix! You dont need any!!')
                end
                if message:lower():find(";bring") or message:lower():find(":bring") or message:lower():find("bring") and v ~= game.Players.LocalPlayer then
                   print(v.Name..' is a noob.')
                   Chat('h [KohlsLite]: '..v.Name..', it is tp (plr) me, not ;bring!!')
                end
                if message:lower():find(";goto") or message:lower():find(":goto") or message:lower():find("goto") and v ~= game.Players.LocalPlayer then
                   print(v.Name..' is a noob.') 
                   Chat('h [KohlsLite]: '..v.Name..', it is tp me (plr), not ;goto!!')
            	end
		end
    end)
end)
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        
    	if string.sub(msg:lower(), 1, #prefix + 7) == prefix.."ndetect" then
          noobdetect = true
        end
        
        if string.sub(msg:lower(), 1, #prefix + 9) == prefix.."unndetect" then
          noobdetect = false
        end
        
end)
