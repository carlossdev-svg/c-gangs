ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print('^0[^4C-GANGS^0] Script ^2Started^0')

RegisterNetEvent('c-gangs:getWeapon', function(source, weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    local fullname = GetPlayerName(source)
    local id = ESX.GetPlayerFromId(source).getIdentifier()
    local DATE = os.date("%H:%M:%S %d/%m/%y")
    local webhook = Config.webhook

    xPlayer.addWeapon(weapon, 250)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "C-GANGS", content = "```" ..fullname.. " ["..id.."] | has taken out "..weapon.." | "..DATE.."```"}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent('c-gangs:getItem', function(source, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local fullname = GetPlayerName(source)
    local id = ESX.GetPlayerFromId(source).getIdentifier()
    local DATE = os.date("%H:%M:%S %d/%m/%y")
    local webhook = Config.webhook

    xPlayer.addInventoryItem(item, 1)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "C-GANGS", content = "```" ..fullname.. " ["..id.."] | has taken out "..item.." | "..DATE.."```"}), { ['Content-Type'] = 'application/json' })
end)

-- VERSION CHECKER DON'T DELETE THIS IF YOU WANT TO RECEIVE NEW UPDATES
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        function checkVersion(error, latestVersion, headers)
			local currentVersion = Config.Version  
            local name = "[^4c-gangs^7]"
            Citizen.Wait(2000)
            
			if tonumber(currentVersion) < tonumber(latestVersion) then
				print(name .. " ^1is outdated.\nCurrent version: ^8" .. currentVersion .. "\nNewest version: ^2" .. latestVersion .. "\n^3Update^7: https://github.com/carlossdev-svg/c-gangs")
			else
				print(name .. " is updated.")
			end
		end
	
		PerformHttpRequest("https://raw.githubusercontent.com/carlossdev-svg/gangsCheck/main/version", checkVersion, "GET")
    end
end)
