ESX              	= nil
local PlayerData 	= {}
local LEO 			= {"police", "sheriff", "state"}

local waiting = {
	["Shots Fired"] = false, ["Civil Disturbance"] = false, ["Grand Theft Auto"] = false, ["Vehicle Theft"] = false, ["Weaponized Vehicle"] = false, ["Car Chopping"] = false, ["Drug Deal"] = false, ["Bank Robbery"] = false, ["Shop Robbery"] = false, ["Explosion"] = false
}

local weaponwhitelist = {
	GetHashKey("WEAPON_PISTOL"),
	GetHashKey("WEAPON_COMBATPISTOL"),
	GetHashKey("WEAPON_APPISTOL"),
	GetHashKey("WEAPON_PISTOL50"),
	GetHashKey("WEAPON_SNSPISTOL"),
	GetHashKey("WEAPON_HEAVYPISTOL"),
	GetHashKey("WEAPON_VINTAGEPISTOL"),
	GetHashKey("WEAPON_MACHINEPISTOL"),
	GetHashKey("WEAPON_REVOLVER"),
	GetHashKey("WEAPON_MARKSMANPISTOL"),
	GetHashKey("WEAPON_DOUBLEACTION"),
	GetHashKey("WEAPON_SMG"),
	GetHashKey("WEAPON_ASSAULTSMG"),
	GetHashKey("WEAPON_MICROSMG"),
	GetHashKey("WEAPON_MINISMG"),
	GetHashKey("WEAPON_COMBATPDW"),
	GetHashKey("WEAPON_MG"),
	GetHashKey("WEAPON_COMBATMG"),
	GetHashKey("WEAPON_GUSENBERG"),
	GetHashKey("WEAPON_PUMPSHOTGUN"),
	GetHashKey("WEAPON_SAWNOFFSHOTGUN"),
	GetHashKey("WEAPON_ASSAULTSHOTGUN"),
	GetHashKey("WEAPON_BULLPUPSHOTGUN"),
	GetHashKey("WEAPON_HEAVYSHOTGUN"),
	GetHashKey("WEAPON_DBSHOTGUN"),
	GetHashKey("WEAPON_AUTOSHOTGUN"),
	GetHashKey("WEAPON_MUSKET"),
	GetHashKey("WEAPON_ASSAULTRIFLE"),
	GetHashKey("WEAPON_CARBINERIFLE"),
	GetHashKey("WEAPON_ADVANCEDRIFLE"),
	GetHashKey("WEAPON_SPECIALCARBINE"),
	GetHashKey("WEAPON_BULLPUPRIFLE"),
	GetHashKey("WEAPON_COMPACTRIFLE"),
	GetHashKey("WEAPON_SNIPERRIFLE"),
	GetHashKey("WEAPON_HEAVYSNIPER"),
	GetHashKey("WEAPON_MARKSMANRIFLE"),
	GetHashKey("WEAPON_MINIGUN"),
	GetHashKey("WEAPON_RAILGUN"),
	-- GetHashKey("WEAPON_STUNGUN"),
	GetHashKey("WEAPON_RPG"),
	GetHashKey("WEAPON_HOMINGLAUNCHER"),
	GetHashKey("WEAPON_GRENADELAUNCHER"),
	GetHashKey("WEAPON_COMPACTLAUNCHER"),
	-- GetHashKey("WEAPON_FLAREGUN"),
	-- GetHashKey("WEAPON_FIREEXTINGUISHER"),
	-- GetHashKey("WEAPON_PETROLCAN"),
	-- GetHashKey("WEAPON_FIREWORK"),
	-- GetHashKey("WEAPON_FLASHLIGHT"),
	-- GetHashKey("GADGET_PARACHUTE"),
	-- GetHashKey("WEAPON_KNUCKLE"),
	-- GetHashKey("WEAPON_HATCHET"),
	-- GetHashKey("WEAPON_MACHETE"),
	-- GetHashKey("WEAPON_SWITCHBLADE"),
	-- GetHashKey("WEAPON_BOTTLE"),
	-- GetHashKey("WEAPON_DAGGER"),
	-- GetHashKey("WEAPON_POOLCUE"),
	-- GetHashKey("WEAPON_WRENCH"),
	-- GetHashKey("WEAPON_BATTLEAXE"),
	-- GetHashKey("WEAPON_KNIFE"),
	-- GetHashKey("WEAPON_NIGHTSTICK"),
	-- GetHashKey("WEAPON_HAMMER"),
	-- GetHashKey("WEAPON_BAT"),
	-- GetHashKey("WEAPON_GOLFCLUB"),
	-- GetHashKey("WEAPON_CROWBAR"),
	-- GetHashKey("WEAPON_GRENADE"),
	-- GetHashKey("WEAPON_SMOKEGRENADE"),
	-- GetHashKey("WEAPON_STICKYBOMB"),
	-- GetHashKey("WEAPON_PIPEBOMB"),
	-- GetHashKey("WEAPON_BZGAS"),
	-- GetHashKey("WEAPON_MOLOTOV"),
	-- GetHashKey("WEAPON_PROXMINE"),
	-- GetHashKey("WEAPON_SNOWBALL"),
	-- GetHashKey("WEAPON_BALL"),
	-- GetHashKey("WEAPON_FLARE")
}

local vehicleblacklist = {
	"FIRETRUK", "RIOT2", "POLMAV", "PREDATOR"
}

local colourNames = {
    ['0'] = "Black",
    ['1'] = "Black",
    ['2'] = "Black",
    ['3'] = "Silver",
    ['4'] = "Silver",
    ['5'] = "Silver",
    ['6'] = "Gray",
    ['7'] = "Silver",
    ['8'] = "Silver",
    ['9'] = "Silver",
    ['10'] = "Grey",
    ['11'] = "Grey",
    ['12'] = "Black",
    ['13'] = "Grey",
    ['14'] = "Light Grey",
    ['15'] = "Black",
    ['16'] = "Black",
    ['17'] = "Silver",
    ['18'] = "Silver",
    ['19'] = "Grey",
    ['20'] = "Silver",
    ['21'] = "Black",
    ['22'] = "Black",
    ['23'] = "Grey",
    ['24'] = "Silver",
    ['25'] = "Silver",
    ['26'] = "Silver",
    ['27'] = "Red",
    ['28'] = "Red",
    ['29'] = "Red",
    ['30'] = "Red",
    ['31'] = "Red",
    ['32'] = "Red",
    ['33'] = "Red",
    ['34'] = "Red",
    ['35'] = "Red",
    ['36'] = "Orange",
    ['37'] = "Gold",
    ['38'] = "Orange",
    ['39'] = "Red",
    ['40'] = "Dark Red",
    ['41'] = "Orange",
    ['42'] = "Yellow",
    ['43'] = "Red",
    ['44'] = "Red",
    ['45'] = "Red",
    ['46'] = "Red",
    ['47'] = "Red",
    ['48'] = "Dark Red",
    ['49'] = "Green",
    ['50'] = "Green",
    ['51'] = "Green",
    ['52'] = "Green",
    ['53'] = "Green",
    ['54'] = "Green",
    ['55'] = "Lime Green",
    ['56'] = "Dark Green",
    ['57'] = "Green",
    ['58'] = "Dark Green",
    ['59'] = "Green",
    ['60'] = "Blue",
    ['61'] = "Dark Blue",
    ['62'] = "Dark Blue",
    ['63'] = "Blue",
    ['64'] = "Blue",
    ['65'] = "Blue",
    ['66'] = "Blue",
    ['67'] = "Blue",
    ['68'] = "Blue",
    ['69'] = "Blue",
    ['70'] = "Blue",
    ['71'] = "Blue",
    ['72'] = "Blue",
    ['73'] = "Blue",
    ['74'] = "Blue",
    ['75'] = "Dark Blue",
    ['76'] = "Dark Blue",
    ['77'] = "Blue",
    ['78'] = "Blue",
    ['79'] = "Blue",
    ['80'] = "Blue",
    ['81'] = "Blue",
    ['82'] = "Dark Blue",
    ['83'] = "Blue",
    ['84'] = "Dark Blue",
    ['85'] = "Dark blue",
    ['86'] = "Blue",
    ['87'] = "Light blue",
    ['88'] = "Yellow",
    ['89'] = "Yellow",
    ['90'] = "Bronze",
    ['91'] = "Yellow",
    ['92'] = "Lime",
    ['93'] = "Beige",
    ['94'] = "Beige",
    ['95'] = "Beige",
    ['96'] = "Brown",
    ['97'] = "Brown",
    ['98'] = "Light Brown",
    ['99'] = "Beige",
    ['100'] = "Brown",
    ['101'] = "Brown",
    ['102'] = "Beige",
    ['103'] = "Brown",
    ['104'] = "Orange",
    ['105'] = "Yellow",
    ['106'] = "Yellow",
    ['107'] = "Cream",
    ['108'] = "Brown",
    ['109'] = "Brown",
    ['110'] = "Light Brown",
    ['111'] = "White",
    ['112'] = "White",
    ['113'] = "Beige",
    ['114'] = "Brown",
    ['115'] = "Dark Brown",
    ['116'] = "Beige",
    ['117'] = "Silver",
    ['118'] = "Black",
    ['119'] = "Silver",
    ['120'] = "Chrome",
    ['121'] = "White",
    ['122'] = "White",
    ['123'] = "Orange",
    ['124'] = "Light Orange",
    ['125'] = "Green",
    ['126'] = "Yellow",
    ['127'] = "Blue",
    ['128'] = "Green",
    ['129'] = "Brown",
    ['130'] = "Orange",
    ['131'] = "White",
    ['132'] = "White",
    ['133'] = "Green",
    ['134'] = "White",
    ['135'] = "Pink",
    ['136'] = "Pink",
    ['137'] = "Pink",
    ['138'] = "Orange",
    ['139'] = "Green",
    ['140'] = "Blue",
    ['141'] = "Dark Blue",
    ['142'] = "Dark Purple",
    ['143'] = "Dark Red",
    ['144'] = "Green",
    ['145'] = "Purple",
    ['146'] = "Dark Blue",
    ['147'] = "Black",
    ['148'] = "Purple",
    ['149'] = "Dark Purple",
    ['150'] = "Red",
    ['151'] = "Green",
    ['152'] = "Olive Drab",
    ['153'] = "Brown",
    ['154'] = "Tan",
    ['155'] = "Green",
    ['156'] = "Grey",
    ['157'] = "Blue"
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function has_value(tab, val)
    for index, value in pairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function alertChance(ac)
	local dr = math.random(1, 100)
    if(dr <= ac)then
		return true
	end
	return false
end

RegisterNetEvent('dd_outlawalerts:OpenAlertMenu')
AddEventHandler('dd_outlawalerts:OpenAlertMenu', function()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'alert_menu',
    {
		title    = "Alert Menu",
		align    = 'top-left',
		elements = {
			{label = "Pursuit", value = "Pursuit"},
			{label = "Shots Fired", value = "Shots Fired"},
			{label = "Civil Disturbance", value = "Civil Disturbance"},
			{label = "Grand Theft Auto", value = "Grand Theft Auto"},
			{label = "Vehicle Theft", value = "Vehicle Theft"},
			{label = "Weaponized Vehicle", value = "Weaponized Vehicle"},
			{label = "Car Chopping", value = "Car Chopping"},
			{label = "Drug Deal", value = "Drug Deal"},
			{label = "Bank Robbery", value = "Bank Robbery"},
			{label = "Shop Robbery", value = "Shop Robbery"},
		}
	}, function(data, menu)
	
	local target, distance = ESX.Game.GetClosestPlayer()
	local targetid = GetPlayerServerId(target)
	local xPlayer = PlayerPedId()
	local playerheading = GetEntityHeading(GetPlayerPed(-1))
	local playerlocation = GetEntityForwardVector(PlayerPedId())
	local playerCoords = GetEntityCoords(GetPlayerPed(-1))
	
	if data.current.value == "Pursuit" then
		
	elseif data.current.value ~= nil then
		alert(data.current.value, "Officer", Jurisdiction, nil)
	end
	end, function(data, menu)
		menu.close()
	end)
end)

RegisterNetEvent('dd_outlawalerts:Notify')
AddEventHandler('dd_outlawalerts:Notify', function(event, zone, receiver, msg, eventPos)
	TriggerEvent('dd_outlawalerts:staticBlip', event, eventPos)
	ESX.TriggerServerCallback('dd_outlawalerts:getItemAmount', function(quantity)
		if PlayerData.job ~= nil then 
			if quantity > 0 then
				ESX.ShowAdvancedNotification(event, zone, msg, 'CHAR_CALL911', 7)
			elseif PlayerData.job.name == receiver then
				ESX.ShowAdvancedNotification(event, zone, msg, 'CHAR_CALL911', 7)
			elseif receiver == "LEO" and has_value(LEO, PlayerData.job.name) then
				ESX.ShowAdvancedNotification(event, zone, msg, 'CHAR_CALL911', 7)
			end
		end
	end, 'scanner')
end)

RegisterNetEvent('dd_outlawalerts:staticBlip')
AddEventHandler('dd_outlawalerts:staticBlip', function(event, eventPos)
	if PlayerData.job ~= nil then
		if has_value(LEO, PlayerData.job.name) then
			local trans = 250
			local staticBlip = AddBlipForCoord(eventPos.x, eventPos.y, eventPos.z)
			SetBlipSprite(staticBlip, 1)
			SetBlipColour(staticBlip, Config.Events[event].Colour)
			SetBlipAlpha(staticBlip, trans)
			SetBlipAsShortRange(staticBlip, 0)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(event)
			EndTextCommandSetBlipName(staticBlip)
			while trans ~= 0 do
				Wait(Config.Events[event].BlipTime * 4)
				trans = trans - 1
				SetBlipAlpha(staticBlip,  trans)
				if trans == 0 then
					SetBlipSprite(staticBlip, 2)
					return 
				end
			end
		end
	end
end)

RegisterNetEvent('dd_outlawalerts:outlawBlip')
AddEventHandler('dd_outlawalerts:outlawBlip', function(identifier, event, connectedPlayers)
	if PlayerData.job ~= nil and has_value(LEO, PlayerData.job.name) and event ~= "NULL" then
		for k,v in pairs(connectedPlayers) do
			if identifier == v then
				ped = GetPlayerFromServerId(k)
				outped = GetPlayerPed(ped)
				serverid = k
			end
		end
		if GetPlayerServerId(PlayerId()) ~= serverid then
			local transO = 250
			local blip = AddBlipForEntity(outped)
			SetBlipSprite(blip, 270)
			SetBlipColour(blip, Config.Events[event].Colour)
			SetBlipAlpha(blip, transO)
			SetBlipAsShortRange(blip, 1)
			
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('Suspect')
			EndTextCommandSetBlipName(blip)
			while transO ~= 0 do
				Wait(Config.Events[event].OutlawTime * 4)
				transO = transO - 1
				SetBlipAlpha(blip, transO)
				if transO == 0 then
					SetBlipSprite(blip, 2)
				end
			end
		end
	end
end)

function ownerCheck(event, plate)
	if Config.Events[event].Ownershipcheck then
		ESX.TriggerServerCallback('dd_outlawalerts:isVehicleOwner', function(cb)
			isOwner = cb
		end, plate)
	end
	Wait(1000)
	return isOwner
end

function checkGun()
	local currentWeapon = GetSelectedPedWeapon(GetPlayerPed(-1))
	if has_value(weaponwhitelist, currentWeapon) and not IsPedCurrentWeaponSilenced(GetPlayerPed(-1))then
		return true
	end
	return false
end

RegisterNetEvent('dd_outlawalerts:waitLoop')
AddEventHandler('dd_outlawalerts:waitLoop', function(event)
	waiting[event] = true
	Wait(Config.Events[event].Waittime*1000)
	waiting[event] = false
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
		if IsPedShooting(GetPlayerPed(-1)) then
			if checkGun() then
				alert("Shots Fired", "Citizen", Jurisdiction, nil)
			end
		elseif IsPedInMeleeCombat(GetPlayerPed(-1)) then 
			alert("Civil Disturbance", "Citizen", Jurisdiction, nil)
		elseif IsPedJacking(GetPlayerPed(-1)) then
			alert("Grand Theft Auto", "Citizen", Jurisdiction, nil)
		elseif IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) then
			alert("Vehicle Theft", "Citizen", Jurisdiction, nil)
		elseif DoesVehicleHaveWeapons(GetVehiclePedIsUsing(GetPlayerPed(-1))) == 1 then
			if not has_value(vehicleblacklist, GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))) then
				alert("Weaponized Vehicle", "Citizen", Jurisdiction, nil)
			end
		end
	end
end)

function alert(event, sender, receiver, eventPos)
	if waiting[event] then
		return
	end
	local ped = GetPlayerPed(-1)
	if eventPos == nil then
		eventPos = GetEntityCoords(ped)
	end
	local s1, s2 = GetStreetNameAtCoord(eventPos.x, eventPos.y, eventPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	local street1 = GetStreetNameFromHashKey(s1)
	local street2 = GetStreetNameFromHashKey(s2)
	local zone = Config.Zones.Keys[GetNameOfZone(eventPos.x, eventPos.y, eventPos.z)]
	local veh = GetVehiclePedIsUsing(ped)
	local class = GetVehicleClass(veh)
	local plate = GetVehicleNumberPlateText(veh)
	local pColour, sColour = GetVehicleColours(veh)
	local pcname, scname = colourNames[tostring(pColour)], colourNames[tostring(sColour)]
	local display = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
	local vehName = GetLabelText(display)
	if zone == nil then
		zone = "San Andreas"
	end
	if receiver == Jurisdiction then
		receiver = Config.Zones[zone].Jurisdiction
	end
	if IsPedMale(ped) then
		sex = "Male"
	elseif not IsPedMale(ped) then
		sex = "Female"
	end
	if Config.Events[event].Populated == false or Config.Zones[zone].Populated or sender == "Officer" then
		if ownerCheck(event, plate) then
			ac = (Config.Events[event].Chance/Config.stealOwnChance)
		else
			ac = Config.Events[event].Chance
		end
		if alertChance(ac) or sender == "Officer" then
			if Config.Events[event].Outlaw and sender ~= "Officer" then
				TriggerServerEvent('dd_outlawalerts:setOutlaw', event)
			end
			TriggerServerEvent('dd_outlawalerts:eventInProgress', event, zone, sender, receiver, eventPos, street1, street2, sex, vehName, plate, pcname, scname, class)
		end
	end
	TriggerEvent('dd_outlawalerts:waitLoop', event)
end

RegisterNetEvent('dd_outlawalerts:triggerAlert')
AddEventHandler('dd_outlawalerts:triggerAlert', function(event, sender, receiver, eventPos)
	alert(event, sender, receiver, eventPos)
end)
