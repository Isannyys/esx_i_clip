ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem(I.itemName, function(source)
    TriggerClientEvent('esx_i_clip_LoadWeapon', source)
end)

RegisterServerEvent('esx_i_clip_AddAmmos')
AddEventHandler('esx_i_clip_AddAmmos', function(hash, ammoToAdd)
	local xPlayer = ESX.GetPlayerFromId(source)
	local weaponName = ESX.GetWeaponFromHash(hash)
  
    xPlayer.addWeaponAmmo(weaponName.name, ammoToAdd)
    xPlayer.removeInventoryItem(I.itemName, 1)
end)