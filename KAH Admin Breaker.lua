-- NEW NOTE: Put this in autoexec. It's recommended that you have a server lock (CMD-Y's slock is good enough)

local Intensity = "10.5" -- Set this to like 100 if you really want to make sure the crasher gets no admin
getgenv().on = true

--[[ OLD NOTE
     This should only be ran if people are autocrashing or posing some form of threat I guess.
     Yes this can time the server out if you don't leave on your 2 other clients


     USAGE: Get 3 clients in one server. If someone is autocrashing just block the crasher on all 3 accounts and hit the play button,
     it should force yall into the same server as all of you got the same ping.

     If none of your alts have perm then run a script before joining the game that gives you a pad.

     Once all 3 clients are in the game and have admin, just execute this but you have to do it before the crasher joins.
     Now once you run this, it will spam the http queue which will delay perm for about 3 minutes. Now you can do whatever you want. 
     But just to be safe, don't let the crasher get a pad. Just punish them so they're trapped.

     If the crasher doesn't leave then just wait it out anyway as they're clueless most of the time. 
     But if the crasher is blocked then you can just force-create a server in like 5-10 seconds so you could do this every 3 minutes

     If the crasher leaves then get the server to fill up, (even if they rejoin, the admin shouldn't work until all cars have been given)
     Just run this again whenever the server hits 5/6 just incase that person is waiting in the queue just to crash you.
     As long as you ran this before the crasher spawned then you should be good. Perm and person299's admin will be given to the player when they spawn, not when they join (Tested btw)

    Also for the love of god don't use this against a crasher that doesn't have perm nor persons.
    They will just grab a pad and crash it since pads still work regardless of perm being broken in the server
]]

repeat task.wait() until game:IsLoaded()

--// For the padgrabber \\--

local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin

local userId = game.Players.LocalPlayer.UserId

-- services
local rns = game:GetService("RunService")
local tps = game:GetService("TeleportService")
local http = game:GetService("HttpService")
local ws = game:GetService("Workspace")
local plyrs = game:GetService("Players")
local uis = game:GetService("UserInputService")

shared.gpcheck = true

task.spawn(function()
    while true do task.wait() -- It uses while true do instead now
        coroutine.wrap(function() -- PadAbuse
			if padAbuse == true then
				local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
				for i, pad in pairs(pads) do
					coroutine.wrap(function()
						pcall(function()
							local cre = pad.Head
							local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
							firetouchinterest(cre, spr, 1)
                            firetouchinterest(cre, spr, 0)
                            firetouchinterest(cre, spr, 1)
							task.wait()
							firetouchinterest(cre, spr, 0)
							
							if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
								fireclickdetector(adminFlr.Regen.ClickDetector, 0)
							end
						end)
					end)()
				end
			end
        end)()
		
        coroutine.wrap(function() -- Perm
			local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
			if perm ~= true or adminFlr.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") ~= nil then 
			else
				pcall(function()
					local pad = adminFlr.Pads:FindFirstChild("Touch to get admin")
					local a = pad.Head
					firetouchinterest(a, spr, 1)
                    firetouchinterest(a, spr, 0)
                    firetouchinterest(a, spr, 1)
					task.wait()
					firetouchinterest(a, spr, 0)
				end)
			end
        end)()
    end
end)

--// Gamepass checker \\--

local passid = 66254 or 64354

if shared.gpcheck == true then
    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. userId .. "/items/GamePass/" .. passid), passid) then
        print("Perm found")
        gamepassperm = true
        perm = false 
        print("Note that perm would be pointless if it were to have an API outage (as it did for a year once).")
    else
        print("Perm not found. Enabling pad grabber")
        perm = true
        task.wait(.35)
    end
end

for i = 1, 103 do
    game.Players:Chat("gear all 253519495")
end

task.delay(Intensity, function()
    on = false
end)

while on do 
    task.wait()
    game.Players:Chat("gear all 253519495")
end
