repeat task.wait() until game:IsLoaded()

shared.anti = true

task.spawn(function()
    while shared.anti do 
            task.wait()
            pcall(function()
                game.Players.LocalPlayer.Character:FindFirstChild("Right Arm"):Destroy()
                game.Players.LocalPlayer.Character:FindFirstChild("Left Arm"):Destroy()
            end)
    end
end)

wait(5.5)
shared.anti = false
game.Players.LocalPlayer.Character:Destroy()
