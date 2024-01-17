RegisterCommand("vehiclewipe", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "RedTrainer.entitywipe") then
        TriggerClientEvent("vehicleWipe", source)
    else
        TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You don't have permission to use this command.")
    end
end, false)

RegisterCommand("entitywipe", function(source, args, rawCommand)
    local radius = args[1] or "20.0"
    if IsPlayerAceAllowed(source, "RedTrainer.entitywipe") then
        TriggerClientEvent("entityWipe", source, radius)
    else
        TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You don't have permission to use this command.")
    end
end, false)
