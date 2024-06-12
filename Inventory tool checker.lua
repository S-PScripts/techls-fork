function checkforplayer(plr)
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.sub(v.Name:lower(), 1, #plr) == plr then
            print(plr .. " was found as " .. v.Name)
            return v
        end
    end
    return nil
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if string.sub(msg:lower(), 1, 14) == "!checkbackpack" then
            local finding = string.sub(msg:lower(), 16)
            if not checkforplayer(finding) then
                print("Invalid player")
                return
            end
            local wtech = checkforplayer(finding)
            local gplayer = game.Players:FindFirstChild(wtech)
            local Backpack = gplayer:FindFirstChild("Backpack")
            if Backpack then
                for _, v in pairs(Backpack:GetChildren()) do
                    print(v.Name)
                end
            end
        end
end)
