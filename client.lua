local Armor
local Health


CreateThread(function()
    while true do 
        local playerPed = PlayerPedId()
        SendNUIMessage({
            action = 'update',
            Health = (((GetEntityHealth(playerPed) - 100) / (GetEntityMaxHealth(playerPed) - 100)) * 100),
            Armor = GetPedArmour(playerPed)
        })
        -- print(GetEntityHealth(playerPed))
        Wait(800)
    end
end)

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId())  and true then
            DisplayRadar(true)
            SendNUIMessage({
                action = "car",
                show = true,
            })
            radarActive = true
        else
            DisplayRadar(false)

            radarActive = false
        end
    end
end)