-- Coded like garbage, I've been using it for nearly a full year and it still works well against abusers :D
-- Some of this doesn't work without my_var_script, like kicksnipe for instance

-- Altered slock v1.7 
-- ignore the indentation please

        local prefix = "_"
        local wl = {}
        local connections = {}
        shared.words = {}
        local permslock = true
        local antilog = string.rep("0", 32)
        local nosounds = true
        local player
        
        local sl = false
        local tl = false -- Treehouselock (unused)
        local blindfinished = true
        
        local Admin = game:GetService("Workspace").Terrain["_Game"].Admin
        local Pads = Admin.Pads
        local regen = Admin:FindFirstChild("Regen")

        local function chatt(massage)
            game.Players:Chat(massage)
        end
        
        local function trueblind()
            chatt(":blind                                                                                                                                                                 all")
            chatt("fogcolor 0 0 0")
            chatt("fogend nil")
            chatt("brightness nan")
            chatt("time -")
            chatt("ungear friends                                                                                                                                                 all")
        end
        
        local function alteredp()
            chatt("unpunish all "..math.random(1,1000));task.wait()
            chatt("invis all "..math.random(1,1000))
            chatt(":refresh all "..math.random(1,1000))
            chatt("invis all "..math.random(1,1000))
            chatt(":kill all "..math.random(1,1000))
            chatt(":trip all "..math.random(1,1000))
            chatt(":setgrav all" .. " -1000000000000000000000000000000000000000000000000000000000000000000000000000000000000");wait(.1)
            chatt("invis all all all "..math.random(1,1000))
            chatt(":unpunish all all all "..math.random(1,1000));task.wait(.2)
            chatt("invis all "..math.random(1,1000));wait(.2)
            chatt(":reset all "..math.random(1,1000));wait(.15)
            chatt(":punish all all all                                                                       "..math.random(1,1000));wait(.1)
        end

        local function showcmds()
              print([[_serverlock - Server lock. It's really powerful
_unserverlock - This will turn it off lol
_nonpermmode - Classic old server lock that perfectly works if no perms are in the server.
_permmode - Switch back
_disablewords - Make it so the altered blind does not get used along with your other blacklisted trigger words.
_disablemuter - Make it so music and other sound effects get unblocked again
_unslock (nonpermmode only) - Unlock a player
_unloadregen - Unload the regen pad
_blacklistperms - If someone with perm joins, immediately lock the server
_kicksnipe - Use this when the server lock is active. It will undo the server lock really quick while keeping the altered blind active, kicks everyone out and then locks the server again
_muteall - This will mute everyone during the slock. Don't spam this, just use it again when it runs out or something
The prefix is also a global using getgenv. So with getgenv().prefix = anything, you'd be able to change it (supports multiple chars)
If your account does not have perm, you should unload the regen from your client first."]])

        local oneee = true
        
        function chat(plr)
            local connection = plr.Chatted:Connect(function(msg)
                if msg:lower():find("fix") or msg:lower():find("unblind") or msg:lower():find("#######") or msg:lower():find("______") or msg:lower():find("logs") or msg:lower():find("m ") or msg:lower():find("h ") or msg:lower():find("message") or msg:lower():find("hint") or msg:lower():find("cmds") or msg:lower():find("commands") or msg:lower():find("disco") then
                    if ratelimit2 then return end
                    if sl or tl then
                        ratelimit2 = true
                        trueblind()
                        wait(.1)
                        ratelimit2 = false
                    elseif msg:lower():find("flash") then
                        if ratelimit2 then return end
                        if sl or tl then
                            chatt("undisco is a thing btw")
                        end
                    end
                end
                for _, word in ipairs(shared.words) do
                    if msg:lower():find(word) then
                        if sl or tl then return end
                        sl = true
                        wait()
                        chatt("char all "..antilog.."3266116528")
                        trueblind()
                        userdetect()
                        alteredp()
                    end
                end
            end)
            table.insert(connections, connection)
        end
        
        for _, v in ipairs(game.Players:GetPlayers()) do
            chat(v)
        end
        
        game.Players.PlayerAdded:Connect(function(plr)
            chat(plr)
        end)
        
        
        function getplayername(plr)
          for i, v in pairs(game.Players:GetPlayers()) do
              if string.sub(v.Name:lower(), 1, #plr) == plr then
                  player = v.Name
                end
            end
        end
        
        function userdetect()
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v.Name ~= table.find(wl, v.Name) then
                    if game.Players:FindFirstChild(v.Name) then
                        if sl == true then
                            if permslock then
                            if ratelimit then return end
                            ratelimit = true
                            alteredp()
                            ratelimit = false
                            else
                            chatt(":punish "..v.Name.." "..math.random(1,1000))
                            chatt(":blind "..v.Name.." "..math.random(1,1000))
                            end
                        end
                    end
                end
            end
        end
        userdetect()
        --{
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
                if string.sub(msg, 1, #prefix + 7) == prefix .. "unslock" then
                    getplayername(string.sub(msg, #prefix + 9, #msg))
                    table.insert(wl, player)
                    -- Reverted to older version cus nobody even uses me_ names anymore
                end
        
                if string.sub(msg, 1, #prefix + 11) == prefix .. "serverlock" then
                    if not blindfinished then return end
                    blindfinished = true
                    chatt(":punish all "..math.random(1,1000));wait()
                    sl = true
                    trueblind()
                    pcall(function()
                    fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
                    end)
                    userdetect()
                    task.spawn(function()			
                        local StatsService = game:GetService("Stats")
                        local ping1 = string.split(StatsService.Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1]
                        task.wait(.4)
                        while oneee and sl do task.wait(.2)
                            local ping2 = string.split(StatsService.Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1]
                            if ping2 == ping1 then
                                if ratelimit3 then return end
                                ratelimit3 = true
                                if not oneee then return end
                                chatt("clr")
                                task.wait(.49)
                                ratelimit3 = false
                            end
                        end
                    end)
                    task.spawn(function()
                        while nosounds do wait(.35)
                            for i, v in pairs(game:GetDescendants()) do
                                if v:IsA("Sound") then
                                    v:Stop()
                                end
                            end   
                        end
                    end)
                     for i = 1, 100 do
                        if sl then
                            if permslock then return end
                            wait(20)
                            trueblind()
                        end
                        blindfinished = true
                     end
                end
        
                if string.sub(msg, 1, #prefix + 13) == prefix .. "unserverlock" then
                    sl = false
                    chatt("unchar all")
                end

                if string.sub(msg, 1, #prefix + 7) == prefix .. "muteall" then
                    wait(.5) -- This is shit ik
                    game.Players:Chat("respawn random")
                    for i = 1,13 do
                        game.Players:Chat("dog all all all                                                                           fuck")
                    end
                    for i = 1,13 do
                        game.Players:Chat("size all .3")
                    end
                    for i = 1,13 do
                        game.Players:Chat("freeze all all all                                                                           fuck")
                    end
                    for i = 1,13 do
                        game.Players:Chat("size all 10")
                    end
                    for i = 1,15 do
                        game.Players:Chat("clone all all all                                                                           fuck")
                    end
                end
        
                if string.sub(msg, 1, #prefix + 9) == prefix .. "kicksnipe" then
                    sl = false
                    wait(.51)
                    chatt("respawn all                                                                                               fuck")
                    wait(.51)
                    local playercount = game.Players:GetPlayers()
                    if #playercount > 4 then
                        print("Now attempting to recover the server kinda. Get an alt to join at the same time as you so you can kick with 7 players")
                    else print("Not enough players. Get an alt to join at the same time as you so you can kick with 7 players")
                        sl = true
                        userdetect()
                    return end
                    chatt("respawn all                                                                                               fuck")
                    wait(1.5)
                    chatt("purge") -- Lol you thought you could get the kicksnipe source code here LOL
                end
        
                if string.sub(msg, 1, #prefix + 4) == prefix .. "cmds" then
                    showcmds()
                end
        
                if string.sub(msg, 1, #prefix + 14) == prefix .. "blacklistperms" then
                    local id = 66254
                    local function addperm(plr)
                    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. plr.UserId .. "/items/GamePass/" .. id), id) then
                            sl = true
                            wait()
                            chatt("char all "..antilog.."3266116528")
                            trueblind()
                            userdetect()
                            alteredp()
                        end
                    end
        
                    game.Players.PlayerAdded:Connect(function(p)
                        addperm(p)
                    end)
                end
        
                if string.sub(msg, 1, #prefix + 11) == prefix .. "nonpermmode" then
                    permslock = false
                    print("Nonpermmode toggled")
                end
        
                if string.sub(msg, 1, #prefix + 12) == prefix .. "disablewords" then
                    shared.words = {}
                    for _, connection in ipairs(connections) do
                        connection:Disconnect()
                    end
                end
        
                if string.sub(msg, 1, #prefix + 12) == prefix .. "disablemuter" then
                    nosounds = false
                    wait(1)
                    nosounds = true
                end
        
                if string.sub(msg, 1, #prefix + 8) == prefix .. "permmode" then
                    permslock = true
                    print("Permmode toggled")
                end
        
                if string.sub(msg, 1, #prefix + 11) == prefix .. "unloadregen" then
                    regen:Destroy()
                    print("Regen unloaded")
                end
            end)
        game.Workspace.ChildAdded:Connect(userdetect)        
