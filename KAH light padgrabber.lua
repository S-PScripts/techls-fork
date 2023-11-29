--[[
- For vanilla executors after Byfron came to life
- From SCV1 Originally
- NO CUSTOM FUNCTIONS
- FREE PERM FOR ALTS]]

local eperm = true
local prefix = "!"

task.spawn(function()
    while true do
      task.wait(0)
      while eperm == true do
        if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
            if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
                local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
                local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
                task.wait(0.125)
                pad.CanCollide = false
                repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait(0.125)
                pad.CFrame = padCFrame
                pad.CanCollide = true
            else
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
            end
        end
      end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        
    	if string.sub(msg:lower(), 1, #prefix + 5) == prefix.."eperm" then
          eperm = true
        end
        
        if string.sub(msg:lower(), 1, #prefix + 7) == prefix.."uneperm" then
          eperm = false
        end
        
end)
