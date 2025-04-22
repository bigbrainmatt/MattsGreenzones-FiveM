local inGreenZone = false
local slowedVehicles = {}

local function enterGreenZone()
    if not inGreenZone then
        inGreenZone = true
        if Config.GreenZoneNotification then
            lib.notify({
                title = 'Greenzone entered',
                description = 'You are in a green zone',
                type = 'success'
            })
        end
    end
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
    if inGreenZone then
        inGreenZone = false

        if Config.GreenZoneNotification then
            lib.notify({
                title = 'Greenzone exited',
                description = 'You left the green zone',
                type = 'warning'
            })
        end

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        SetEntityProofs(ped, false, false, false, false, false, false, false, false)
        DisablePlayerFiring(ped, false)

        if vehicle ~= 0 then
            SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel"))
            slowedVehicles[vehicle] = nil
        end
    end
end

CreateThread(function()
    for _, points in pairs(Config.Coords) do
        lib.zones.poly({
            points = points,
            thickness = Config.GreenZoneHight,
            debug = false,
            inside = enterGreenZone,
            onExit = exitGreenZone
        })
    end
end)