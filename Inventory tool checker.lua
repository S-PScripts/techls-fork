local prefix = "!"

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        
    	if string.sub(msg:lower(), 1, #prefix + 3) == prefix.."CBP" then
		local player = string.sub(msg, #prefix + 5, #msg)
		local gplayer = game.Players:FindFirstChild(player)
		local Backpack = gplayer:FindFirstChild("Backpack")
		if Backpack then
			for _, v in pairs(Backpack:GetChildren()) do
				print(v.Name)
			end
		end
        end

end)
