local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx_i_clip_LoadWeapon')
AddEventHandler('esx_i_clip_LoadWeapon', function()
    local ped = GetPlayerPed(-1)

    if IsPedArmed(ped, 4) then
        local hash = GetSelectedPedWeapon(ped)
        local currentAmmo = GetAmmoInPedWeapon(ped, hash)
        local maxAmmo = 250 -- Usually default max ammos
        local ammoToAdd = I.ammoCount

        if hash ~= nil then

            if currentAmmo < maxAmmo then
                if currentAmmo + ammoToAdd > maxAmmo then
                    ammoToAdd = maxAmmo - currentAmmo
                end

                TriggerServerEvent('esx_i_clip_AddAmmos', hash, ammoToAdd)
                ESX.ShowNotification(I.gunLoaded)
            else
                ESX.ShowNotification(I.cantFit)
            end
        end
    else
        ESX.ShowNotification(I.needGun)
    end
end)