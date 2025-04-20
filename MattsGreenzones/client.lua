local inGreenZone = false
local slowedVehicles = {}
local customGreenzone = {}

local function playerInCords(point, zones)
    local maxHight = Config.GreenZoneHight
    local x, y, z = point.x, point.y, point.z

    for _, setCoords in pairs(zones) do
        local inside = false
        local j = #setCoords

        local lowestZ = setCoords[1].z
        for i = 2, #setCoords do
            if setCoords[i].z < lowestZ then
                lowestZ = setCoords[i].z
            end
        end

        if z > lowestZ + 300 then
            goto continue 
        end

        for i = 1, #setCoords do
            local xi, yi = setCoords[i].x, setCoords[i].y
            local xj, yj = setCoords[j].x, setCoords[j].y

            if ((yi > y) ~= (yj > y)) and (x < (xj - xi) * (y - yi) / (yj - yi) + xi) then
                inside = not inside
            end

            j = i
        end

        if inside then
            return true
        end

        ::continue::
    end

    return false
end

RegisterNetEvent("MattsGreenzones:triggerGreenzone", function(radius)
    if(inGreenZone) then
        return
    end

    if not radius then
        radius = Config.SpawnRadius
    end

    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)

    local newZone = {
        x = playerCoords.x,
        y = playerCoords.y,
        z = playerCoords.z,
        radius = radius
    }
    
    customGreenzone[#customGreenzone + 1] = newZone
    
    TriggerServerEvent("MattsGreenzones:addZone", newZone)
end)

RegisterNetEvent("MattsGreenzones:triggerRemoveTempGreenzone", function()
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)
    
end)

RegisterNetEvent("MattsGreenzones:triggerRemoveAllTempGreenzone", function()
    customGreenzone = {}
end)

RegisterNetEvent("MattsGreenzones:syncZones", function(zones)
    if not zones then return end
    for _, zone in pairs(zones) do
        table.insert(customGreenzone, {
            x = zone.x,
            y = zone.y,
            z = zone.z,
            radius = zone.radius
        })
    end
end)

local function enterGreenZone()
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)

    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
    DisablePlayerFiring(ped, true)

    if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
        if not slowedVehicles[vehicle] then
            SetEntityMaxSpeed(vehicle, 4.47)
            slowedVehicles[vehicle] = true
        end
    end
end

local function exitGreenZone()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    SetEntityProofs(ped, false, false, false, false, false, false, false, false)
    DisablePlayerFiring(ped, false)

    if vehicle ~= 0 then
        SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel"))
        slowedVehicles[vehicle] = nil
    end
end

local function drawText()
    local screenW, screenH = GetScreenResolution()
    local x = screenW / 2
    local y = screenH - 50
    local normX = x / screenW
    local normY = y / screenH

    SetTextScale(Config.TextScale , Config.TextSize)
    SetTextColour(Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, Config.TextColor.a)
    SetTextOutline()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(Config.GreenzoneText)
    EndTextCommandDisplayText(normX, normY)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)

        if playerInCords(playerCoords, Config.Coords) then
            inGreenZone = true

            if Config.ShowText then
                drawText()
            end

            enterGreenZone()
        else

            for _, GZCoord in pairs(customGreenzone) do
                if Config.Marker then 
                    DrawMarker(Config.MarkerType, 
                        GZCoord.x, GZCoord.y, GZCoord.z - 1.0,
                        0.0, 0.0, 0.0, 
                        0.0, 0.0, 0.0, 
                        1.0, 1.0, 1.0, 
                        Config.MarkerColor.r , Config.MarkerColor.g, Config.MarkerColor.b , Config.MarkerColor.a, 
                        false, true, 2, nil, nil, false
                    )
                end
                local distance = #(vector3(playerCoords.x, playerCoords.y, playerCoords.z) - vector3(GZCoord.x, GZCoord.y, GZCoord.z))
                if distance <= tonumber(GZCoord.radius) then
                    inGreenZone = true    
                    if Config.ShowText then
                        drawText()
                    end
        
                    enterGreenZone()
                else
                    if(inGreenZone) then
                        inGreenZone = false
                        exitGreenZone()
                    end
                end
            end
        end
    end
end)