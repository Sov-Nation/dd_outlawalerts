ESX 					= nil
local connectedPlayers 	= {}
local notExpl 			= {3, 13, 20, 21, 22, 39}
local playing 			= false

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
	local eType = ev.explosionType
	local eventPos = {}
	local players = ESX.GetPlayers()
	local scapegoat = players[1]
	if not has_value(notExpl, eType) then
		if ev.f210 ~= 0 then
			entity = NetworkGetEntityFromNetworkId(ev.f210)
			eventPos = GetEntityCoords(entity)
		else
			eventPos.x = ev.posX
			eventPos.y = ev.posY
			eventPos.z = ev.posZ
		end
		TriggerClientEvent('dd_outlawalerts:triggerAlert', scapegoat, "Explosion", citizen, Jurisdiction, eventPos)
	end
end

RegisterServerEvent('dd_outlawalerts:eventInProgress')
AddEventHandler('dd_outlawalerts:eventInProgress', function(event, zone, sender, receiver, street1, street2, veh, sex, plate, pcname, scname)
	local message = nil
	if street2 == "" then
		atbetween = " ~w~at ~r~"
		xand = nil
	elseif street2 ~= "" then
		atbetween = " ~w~between ~r~"
		xand = " ~w~and ~r~"
	end
	for k, v in pairs(Config.Events[event].Text) do
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
		if v ~= nil then
			if message == nil then
				message = v
			else
				message = (message..v)
			end
		end
	end
	TriggerClientEvent("dd_outlawalerts:Notify", -1, event, zone, receiver, message)
	playSound(event, zone, sender, receiver)
end)

function playSound(event, zone, sender, receiver)
	if not playing then
		playing = true
		local sound = Sounds.Conjunctives.Wehave[sender][math.random(#Sounds.Conjunctives.Wehave[sender])]
		TriggerEvent('InteractSound_SV:PlayForJob', sound, Sounds.Volume, receiver)
		Wait(1500)
		local sound = Sounds.Events[event][math.random(#Sounds.Events[event])]
		TriggerEvent('InteractSound_SV:PlayForJob', sound, Sounds.Volume, receiver)
		Wait(3000)
		local sound = Sounds.Conjunctives.In[math.random(#Sounds.Conjunctives.In)]
		TriggerEvent('InteractSound_SV:PlayForJob', sound, Sounds.Volume, receiver)
		Wait(1500)
		local sound = Sounds.Zones[zone]
		TriggerEvent('InteractSound_SV:PlayForJob', sound, Sounds.Volume, receiver)
		Wait(4000)
		playing = false
	end
end

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

ESX.RegisterServerCallback('dd_outlawalerts:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)