getgenv().on = true
repeat task.wait() until game:IsLoaded()
local plyrs = game:GetService("Players")

while on do task.wait()
    for _, player in ipairs(plyrs:GetPlayers()) do
        local character = player.Character
        if character then
            local rocket = character:FindFirstChild("Rocket")
            while rocket do
                rocket:Destroy()
                rocket = character:FindFirstChild("Rocket")
            end
        end
    end
end
