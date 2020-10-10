ESX 					= nil
local connectedPlayers 	= {}
local notExpl 			= {3, 13, 20, 21, 22, 39}

local text = {
	["Shots Fired"] = {"~r~Shots fired ~w~by a ~r~", "sex", "atbetween", "street1", "xand", "street2", "", ""},
	["Civil Disturbance"] = {"~r~Civil Disturbance ~w~involving a ~r~", "sex", "atbetween", "street1", "xand", "street2", "", ""},
	["Grand Theft Auto"] = {"~r~Grand Theft Auto ~w~of a ~r~", "veh", "~w~ by a ~r~", "sex", "atbetween", "street1", "xand", "street2"},
	["Vehicle Theft"] = {"Attempted ~r~theft ~w~of a ~r~", "veh", "~w~ by a ~r~", "sex", "atbetween", "street1", "xand", "street2"},
	["Weaponized Vehicle"] = {"Reports of a ~r~weaponized vehicle ~w~, a ~r~", "veh", "atbetween", "street1", "xand", "street2", "", ""},
	["Car Chopping"] = {"Suspected ~r~car chopping ~w~by a ~r~", "veh", "~w~ by a ~r~", "sex", "atbetween", "street1", "xand", "street2"},
	["Drug Deal"] = {"Suspected ~r~drug deal ~w~by a ~r~", "sex", "atbetween", "street1", "xand", "street2", "", ""},
	["Bank Robbery"] = {"~r~Bank Robbery ~w~by a ~r~", "sex", "atbetween", "street1", "xand", "street2", "", ""},
	["Shop Robbery"] = {"~r~Shop Robbery ~w~by a ~r~", "sex", "atbetween", "street1", "xand", "street2", "", ""},
	["Explosion"] = {"~r~Explosion ~w~reported ~r~", "atbetween", "street1", "xand", "street2", "", "", ""}
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayerToList(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil

	TriggerClientEvent('dd_outlawalerts:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('explosionEvent', function(source, ev)
	explosion(source, ev)
end)

ESX.RegisterServerCallback('dd_outlawalerts:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

ESX.RegisterServerCallback('dd_outlawalerts:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

function AddPlayerToList(xPlayer, update)

	local playerId = xPlayer.source
	local identifier = GetPlayerIdentifier(playerId)	

	connectedPlayers[playerId] = identifier	

	if update then
		TriggerClientEvent('dd_outlawalerts:updateConnectedPlayers', -1, connectedPlayers)
	end
end

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToList()
		end)
	end
end)


function AddPlayersToList()
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToList(xPlayer, false)
	end

	TriggerClientEvent('dd_outlawalerts:updateConnectedPlayers', -1, connectedPlayers)
end

function has_value(tab, val)
    for index, value in pairs(tab) do

        if value == val then
            return true
        end
    end
    return false
end

function explosion(source, ev)
	for k, v in pairs(ev) do
		eType = ev.explosionType
		if ev.f210 ~= 0 then
			entity = NetworkGetEntityFromNetworkId(ev.f210)
			prop = GetEntityCoords(entity)
			ev.posX = prop.x
			ev.posY = prop.y
			ev.posZ = prop.z
		end
	end
	if not has_value(notExpl, eType) then
		TriggerClientEvent('dd_outlawalerts:explosionAlert', -1, ev.posX, ev.posY, ev.posZ)
	end
end

RegisterServerEvent('dd_outlawalerts:eventInProgress')
AddEventHandler('dd_outlawalerts:eventInProgress', function(event, zone, street1, street2, veh, sex)
	local msg = {}
	if street2 == "" then
		atbetween = " ~w~at ~r~"
		xand = ""
	elseif street2 ~= "" then
		atbetween = " ~w~between ~r~"
		xand = " ~w~and ~r~"
	end
	for k, v in pairs(text[event]) do
		if v == "street1" then
			v = street1
		elseif v == "street2" then
			v = street2
		elseif v == "sex" then
			v = sex
		elseif v == "veh" then
			v = veh
		elseif v == "atbetween" then
			v = atbetween
		elseif v == "xand" then
			v = xand
		end
		table.insert(msg, k, v)
	end
	TriggerClientEvent("dd_outlawalerts:Notify", -1, event, zone, msg[1]..msg[2]..msg[3]..msg[4]..msg[5]..msg[6]..msg[7]..msg[8])
end)

RegisterServerEvent('dd_outlawalerts:setOutlaw')
AddEventHandler('dd_outlawalerts:setOutlaw', function(blipColour)
	local identifier = GetPlayerIdentifier(source, 0)
	MySQL.Async.execute('UPDATE users SET outlaw = @blipColour WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@blipColour'] = blipColour
	})
	Wait(1000)
TriggerEvent('dd_outlawalerts:getOutlaw', identifier)
end)

RegisterServerEvent('dd_outlawalerts:getOutlaw')
AddEventHandler('dd_outlawalerts:getOutlaw', function(identifier)
	MySQL.Async.fetchAll("SELECT identifier, outlaw FROM users WHERE identifier = @identifier", {
		['@identifier'] = identifier
	}, function(result)
		blipColour = result[1].outlaw
		if blipColour ~= 0 then
			TriggerClientEvent('dd_outlawalerts:outlawBlip', -1, identifier, blipColour, connectedPlayers)
			MySQL.Async.execute('UPDATE users SET outlaw = @blipColour WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@blipColour'] = 0
			})
		end
	end)
end)

RegisterServerEvent('dd_outlawalerts:alertPos')
AddEventHandler('dd_outlawalerts:alertPos', function(event, blipAlertTime, blipColour, ax, ay, az)
	TriggerClientEvent('dd_outlawalerts:alertPlace', -1, event, blipAlertTime, blipColour, ax, ay, az )
end)

-- ESX.RegisterServerCallback('outlawalert:isVehicleOwner', function(source, cb, plate)
-- 	local identifier = GetPlayerIdentifier(source, 0)

-- 	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
-- 		['@owner'] = identifier,
-- 		['@plate'] = plate
-- 	}, function(result)
-- 		if result[1] then
-- 			cb(result[1].owner == identifier)
-- 		else
-- 			cb(false)
-- 		end
-- 	end)
-- end)