local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('gunshop:serverbuyitem', function(data)
    local bool = false
    local a = source
    local b = QBCore.Functions.GetPlayer(a)
    local fn = b.PlayerData.charinfo.firstname
    local ln = b.PlayerData.charinfo.lastname
    
    local materialItemS = 0
    local materialItemAmount = 0

    for k, v in pairs(Config.Recipes[data.item].materials) do       
        local materialItem = b.Functions.GetItemByName(k)
        materialItemS = materialItemS + 1

        if materialItem ~= nil and materialItem.amount >= v then
            materialItemAmount = materialItemAmount + 1
        end
    end

    if materialItemS == materialItemAmount then
        bool = true
    end

    if bool then
        for k, v in pairs(Config.Recipes[data.item].materials) do
            b.Functions.RemoveItem(k, v)
            TriggerClientEvent('inventory:client:ItemBox', a, QBCore.Shared.Items[k], "remove", v)
        end

        Citizen.Wait(1000)

        if data.isWeapon then
            b.Functions.AddItem(data.item, 1)
            TriggerClientEvent('inventory:client:ItemBox', a, QBCore.Shared.Items[data.item], "add", 1)
            discordlog(Config.SellWebhook, "Item Crafted", "\n Firstname **: " .. fn .. "**\n Lastname** : " .. ln .. "** \n Player ID : **" .. a .. "** \n Item : **" .. data.item .. "** \n Amount : **1**")
        else
            b.Functions.AddItem(data.item, data.count)
            TriggerClientEvent('inventory:client:ItemBox', a, QBCore.Shared.Items[data.item], "add", data.count)
            discordlog(Config.SellWebhook, "Item Crafted", "\n Firstname **: " .. fn .. "**\n Lastname** : " .. ln .. "** \n Player ID : **" .. a .. "** \n Item : **" .. data.item .. "** \n Amount : **" .. data.count .. "**")
        end
    end
end)



function discordlog(webhook, title, text, target)
	local ts = os.time()
	local time = os.date('%Y-%m-%d %H:%M:%S', ts)
	local connect = {
	    {
	        ["color"] = 3092790,
	        ["title"] = title,
	        ["description"] = text,
	        ["footer"] = {
		    ["text"] = "SRC CRAFTING \n Date  " ..time,
		    ["icon_url"] = Config.Discord.Icon,
	        },
	    }
	}
	PerformHttpRequest(Config.Discord.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Discord.Name, embeds = connect, avatar_url = Config.Discord.Logo}), { ['Content-Type'] = 'application/json' })
end