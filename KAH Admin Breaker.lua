local Intensity = "10.5" -- Set this to like 100 if you really want to make sure the crasher gets no admin
getgenv().on = true

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
        print("Perm found.")
        gamepassperm = true
        perm = false 
        print("Note that perm would be pointless if it were to have an API outage, as it did for a year once.")
    else
        print("Perm not found. Enabling pad grabber.")
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
