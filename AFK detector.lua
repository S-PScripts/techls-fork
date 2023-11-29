-- Only works for PC
local autoafk = true
local prefix = "!"
local UserInputService = game:GetService("UserInputService")

UserInputService.WindowFocusReleased:Connect(
    function()
        if autoafk == true then
          print("You are afk!")
          game.Players:Chat("name me"..game.Players.LocalPlayer.DisplayName.." - AFK")
        end
end)

UserInputService.WindowFocused:Connect(
    function()
        if autoafk == true then
            print("You are no longer afk!")
            game.Players:Chat("reload me")
        end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        
    	if string.sub(msg:lower(), 1, #prefix + 7) == prefix.."autoafk" then
          autoafk = true
        end
        
        if string.sub(msg:lower(), 1, #prefix + 9) == prefix.."unautoafk" then
          autoafk = false
        end
        
end)
