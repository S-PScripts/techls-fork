print("Type _cmds for a list of commands.")

--[[
Slock Version 1.2
Credit to DIY scripts for base. Idfk who made this at first but I got it from Damix and I just needed the wl bit cus lazy

c(prefix.."spam rocket/ all all all");wait(60)
c(prefix.."stop") Ignore this, it's for a kick slock which requires all spawns to be moved and 2 alts + invis]]

getgenv().prefix = "_"
local wl = {}
local connections = {}
shared.words = {"crash","shutdown","close","clone"}
local permslock = true
local antilog = string.rep("0", 32)
local nosounds = true
local player

local sl = false
local tl = false -- Treehouselock (UNUSED, I WAS GONNA MAKE THIS BUT DECIDED NOT TO)
local blindfinished = true

local Admin = game:GetService("Workspace").Terrain["_Game"].Admin
local Pads = Admin.Pads
local regen = Admin:FindFirstChild("Regen")

if slockrunning then return end
getgenv().slockrunning = true

local function trueblind()
    game.Players:Chat(":blind all")
    game.Players:Chat("fogcolor 0 0 0")
    game.Players:Chat("fogend nil")
    game.Players:Chat("brightness nan")
    game.Players:Chat("time -")
end

local function alteredp()
    game.Players:Chat("unpunish all "..math.random(1,1000));task.wait()
    game.Players:Chat("invis all "..math.random(1,1000))
    game.Players:Chat(":refresh all "..math.random(1,1000))
    game.Players:Chat("invis all "..math.random(1,1000))
    game.Players:Chat(":kill all "..math.random(1,1000))
    game.Players:Chat(":trip all "..math.random(1,1000))
    game.Players:Chat(":setgrav all" .. " -1000000000000000000000000000000000000000000000000000000000000000000000000000000000000");wait(.1)
    game.Players:Chat("invis all all all "..math.random(1,1000))
    game.Players:Chat(":unpunish all all all "..math.random(1,1000));task.wait(.2)
    game.Players:Chat("invis all "..math.random(1,1000));wait(.2)
    game.Players:Chat(":reset all "..math.random(1,1000));wait(.15)
    game.Players:Chat(":punish all all all                                                                       "..math.random(1,1000));wait(.1)
end

function chat(plr)
    local connection = plr.Chatted:Connect(function(msg)
        if msg:lower():find("fix") or msg:lower():find("unblind") or msg:lower():find("#######") or msg:lower():find("______") or msg:lower():find("logs") or msg:lower():find("m ") or msg:lower():find("h ") or msg:lower():find("message") or msg:lower():find("hint") or msg:lower():find("m/") then
            if ratelimit then return end
            if sl or tl then
                ratelimit2 = true
                trueblind()
                wait(.35)
                ratelimit2 = false
            end
        end
        for _, word in ipairs(shared.words) do
            if msg:lower():find(word) then
                if sl or tl then return end
                sl = true
                wait()
                game.Players:Chat("char all "..antilog.."3266116528")
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
        if v.Name ~= game.Players.LocalPlayer.Name and not table.find(wl, v.Name) then
            if game.Players:FindFirstChild(v.Name) then
                if sl == true then
                    if permslock then
                    if ratelimit then return end
                    ratelimit = true
                    alteredp()
                    ratelimit = false
                    else
                    game.Players:Chat(":punish                                                                                                                                others fuck "..math.random(1,1000))
                    game.Players:Chat(":blind                                                                                                                                 others fuck "..math.random(1,1000))
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
            for i = 1, 100 do
            game.Players:Chat("unpunish " .. player .. " " .. math.random(1, 1000))
            game.Players:Chat("unblind " .. player .. " " .. math.random(1, 1000))
            wait(20)
            end
        end

        if string.sub(msg, 1, #prefix + 11) == prefix .. "serverlock" then
            if not blindfinished then return end
            blindfinished = true
            game.Players:Chat("punish all "..math.random(1,1000));wait()
            sl = true
            trueblind()
            pcall(function()
            fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
            end)
            userdetect()
            task.spawn(function()
                while nosounds do task.wait()
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
                else
                    print("Remaining blind moments lol");task.wait()
                end
                blindfinished = true
             end
        end

        if string.sub(msg, 1, #prefix + 13) == prefix .. "unserverlock" then
            sl = false
            game.Players:Chat("unflash");wait(1)
            game.Players:Chat("unchar all")
        end

        if string.sub(msg, 1, #prefix + 9) == prefix .. "kicksnipe" then
            sl = false
            wait(.5)
            game.Players:Chat("respawn all                                                                                               fuck")

            local playercount = game.Players:GetPlayers()
            if #playercount > 4 then
                print("Now attempting to recover the server kinda. Get an alt to join at the same time as you so you can kick with 7 players")
            else print("Not enough players. Get an alt to join at the same time as you so you can kick with 7 players")
                sl = true
                userdetect()
            return end
            -- kick commands here. It was obfuscated for this reason
            wait()
            sl = true
        end

        if string.sub(msg, 1, #prefix + 4) == prefix .. "cmds" then
            print([[

_serverlock - Server lock. It's really powerful
_unserverlock - This will turn it off lol
_nonpermmode - Classic old server lock that perfectly works if no perms are in the server.
_permmode - Switch back
_disablewords - Make it so the altered blind does not get used along with your other blacklisted trigger words.
_disablemuter - Make it so music and other sound effects get unblocked again
_unslock (nonpermmode only) - Unlock a player
_unloadregen - Unload the regen pad
_blacklistperms - If someone with perm joins, immediately lock the server

The prefix is also a global using getgenv. So with getgenv().prefix = anything, you'd be able to change it (supports multiple chars)
If your account does not have perm, you should unload the regen from your client first.
            ]])
        end

        if string.sub(msg, 1, #prefix + 14) == prefix .. "blacklistperms" then
            local id = 66254
            local function addperm(plr)
            if not string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. plr.UserId .. "/items/GamePass/" .. id), id) then
                    sl = true
                    wait()
                    game.Players:Chat("char all "..antilog.."3266116528")
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

