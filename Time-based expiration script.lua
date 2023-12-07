local timelimit = "12/30/2023"
local ctime = os.date("%m/%d/%Y")

if ctime > timelimit then
    pcall(function()
        while true do end
        game.Players.LocalPlayer:Kick("OS Time too far ahead. Please check machine date configuration")
    end)
end
