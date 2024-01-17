local RedTrainer = exports["RedTrainer"]:Core() 

RegisterNetEvent("vehicleWipe") -- Adding radius to this later just cba just woke up
AddEventHandler("vehicleWipe", function()
    local playerPed = cache.ped
    local playerCoords = GetEntityCoords(playerPed)

    local radius = 20.0 

    local vehiclePool = GetGamePool('CVehicle')

    for i = 1, #vehiclePool do
        local distance = #(GetEntityCoords(vehiclePool[i]) - playerCoords)

        if distance < radius then
            DeleteEntity(vehiclePool[i])
        end
    end

    RedTrainer.Notify("Entity Wipe", "Vehicles wiped in a 20.0 radius.", 'info')
end)

RegisterNetEvent("entityWipe")
AddEventHandler("entityWipe", function(radius)
    local playerPed = cache.ped
    local playerCoords = GetEntityCoords(playerPed)

    radius = tonumber(radius) or 20.0

    local entityPool = GetGamePool('CPed')

    for i = 1, #entityPool do
        local distance = #(GetEntityCoords(entityPool[i]) - playerCoords)

        if distance < radius then
            if entityPool[i] ~= playerPed then
                DeleteEntity(entityPool[i])
            end
        end
    end

    RedTrainer.Notify("Entity Wipe", string.format("%.1f Radius Wiped.", radius), 'info')
end)



TriggerEvent('chat:addSuggestion', '/entitywipe', 'Wipe entities within a specified radius.',
    {
        { name="radius", help="Radius for wiping entities (default is 20.0)." }
    }
)

TriggerEvent('chat:addSuggestion', '/vehiclewipe', 'Wipe entities within a specified radius.',
    {
        { name="radius", help="Radius for wiping entities (default is 20.0)." }
    }
)
