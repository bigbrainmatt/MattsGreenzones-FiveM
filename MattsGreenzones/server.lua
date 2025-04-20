tempGreenzone = {}
local greenZones = {}

RegisterCommand("greenzone", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent("MattsGreenzones:triggerGreenzone", source, args[1])
    end
end, true)

RegisterCommand("removeGreenzone", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent("MattsGreenzones:triggerRemoveTempGreenzone", source, args[1])
    end
end, true)

RegisterCommand("removeAllGreenzones", function(source, args, rawCommand)
    if (source > 0) then
        SaveResourceFile(GetCurrentResourceName(), "zones.json", "", -1)
        TriggerClientEvent("MattsGreenzones:triggerRemoveAllTempGreenzone", source)
    end
end, true)

RegisterNetEvent("MattsGreenzones:addZone", function(data)
    if not IsPlayerAceAllowed(source, "greenzone.add") then
        DropPlayer(source, "Unauthorized green zone trigger.")
        return
    end

    if type(data) == "table" and data.x and data.y and data.z and data.radius then
        table.insert(tempGreenzone, data)
        saveGreenZones()
    end
end)

RegisterNetEvent("MattsGreenzones:deleteZone", function(zoneToDelete)
    if not IsPlayerAceAllowed(source, "greenzone.remove") then
        DropPlayer(source, "Unauthorized green zone trigger.")
        return
    end

    local deleted = false
    for index, zone in ipairs(greenZones) do
        if zone.x == zoneToDelete.x and
           zone.y == zoneToDelete.y and
           zone.z == zoneToDelete.z and
           zone.radius == zoneToDelete.radius then
            table.remove(greenZones, index)
            deleted = true
            break
        end
    end

    if deleted then
        saveGreenZones()
    end
end)

function saveGreenZones()
    greenZones = tempGreenzone
    local formattedData = {}

    for _, zone in pairs(greenZones) do
        table.insert(formattedData, {
            x = zone.x,
            y = zone.y,
            z = zone.z,
            radius = zone.radius
        })
    end

    local jsonData = json.encode(formattedData, { indent = true })

    SaveResourceFile(GetCurrentResourceName(), "zones.json", jsonData, -1)
end

function loadGreenZones()
    local content = LoadResourceFile(GetCurrentResourceName(), "zones.json")
    if content then
        greenZones = json.decode(content)
    else
        greenZones = {}
    end
end

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        loadGreenZones()
        Wait(500)
        TriggerClientEvent("MattsGreenzones:syncZones", -1, greenZones)
    end
end)

AddEventHandler("playerJoining", function()
    local player = source
    TriggerClientEvent("MattsGreenzones:syncZones", player, greenZones)
end)