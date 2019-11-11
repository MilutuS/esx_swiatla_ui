-- esx_colorfullheadlights by MilutuS
-- https://discord.gg/GgaMnNC


local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local pic = 'CHAR_CARSITE'
local MenuGUI               = false
local PlayerData              = {}
local CurrentTask             = {}

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	Citizen.Wait(5000)
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



local x = false


Citizen.CreateThread(function()	

	while true do
		Citizen.Wait(10000)
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		_,lightson,highbeams = GetVehicleLightsState(veh)
		local color =GetVehicleHeadlightsColour(veh)
		local plate = GetVehicleNumberPlateText(veh)
		if plate == nil then

		else

			ESX.TriggerServerCallback("esx_swiatla:pobierz_swiatla", function(isPurchasable)
				if isPurchasable == color then

				else
					if MenuGUI == false then
						ToggleVehicleMod(veh, 22, true)
						SetVehicleHeadlightsColour(veh, isPurchasable)
					end
				end
			end, plate)
		end
	end
end)


IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end 

RegisterNetEvent("esx_swiatla:otworz")
AddEventHandler("esx_swiatla:otworz", function()
	local playerPed = GetPlayerPed(-1)
	local vehicle = nil
	local ped = GetPlayerPed(-1)
	local car = GetVehiclePedIsIn(ped)
	local car_drive = GetVehiclePedIsIn(ped, true)
	if IsPedInVehicle(ped, car, false) then
		if not MenuGUI then
			SetNuiFocus(true, true)
			SendNUIMessage({type = 'open'})
			MenuGUI = true
			ESX.UI.Menu.CloseAll()
			SetVehicleNumberPlateText(car, text)
		end
	else
		ESX.ShowAdvancedNotification('Swiatła', '', "~y~Musisz siedzieć w aucie aby zmienić kolor świateł", pic, 1)
	end
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'close'})
	MenuGUI = false
end)





RegisterNUICallback('save', function(data, cb)
	
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'close'})
	MenuGUI = false
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	local plate = GetVehicleNumberPlateText(veh)
	local color =GetVehicleHeadlightsColour(veh)
	if color > 13 then
		color = 13
	end
	TriggerServerEvent('esx_swiatla:usun_swiatla')
	ESX.TriggerServerCallback("esx_swiatla:zapisz_swiatla", function(isPurchasable)
		if isPurchasable then
			ESX.ShowAdvancedNotification('Swiatła', '', "~y~Żarówki zosatły założone", pic, 1)
		else
			ESX.ShowAdvancedNotification('Swiatła', '', "~y~Wystapił błąd", pic, 1)
		end
	end, ESX.Game.GetVehicleProperties(veh),color)
end)


RegisterNUICallback('change_color_blue', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 12)
end)

RegisterNUICallback('change_color_0', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 0)
end)
RegisterNUICallback('change_color_1', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 1)
end)
RegisterNUICallback('change_color_2', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 2)
end)
RegisterNUICallback('change_color_3', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 3)
end)
RegisterNUICallback('change_color_4', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 4)
end)
RegisterNUICallback('change_color_5', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 5)
end)
RegisterNUICallback('change_color_6', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 6)
end)
RegisterNUICallback('change_color_7', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 7)
end)
RegisterNUICallback('change_color_8', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 8)
end)
RegisterNUICallback('change_color_9', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 9)
end)
RegisterNUICallback('change_color_10', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 10)
end)
RegisterNUICallback('change_color_11', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 11)
end)
RegisterNUICallback('change_color_12', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 12)
end)
RegisterNUICallback('change_color_13', function(data, cb)
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	ToggleVehicleMod(veh, 22, true)
	SetVehicleHeadlightsColour(veh, 13)
end)