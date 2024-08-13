local QBCore = exports["qb-core"]:GetCoreObject()

CreateThread(function()
    for k, v in pairs(Config.vehicle) do
        -- print(k)
        local vehicle = v.vehicle
        local spawnlocation = v.spawnlocation
        local pedlocation = v.pedlocation
        local model = GetHashKey(v.pedmodel)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(500)
        end
        local ped = CreatePed(4, model, pedlocation.x, pedlocation.y, pedlocation.z - 1, pedlocation.w, false, true)
        FreezeEntityPosition(ped, true)
        exports['qb-target']:AddBoxZone("sewakendaraan"..k, vector3(pedlocation.x, pedlocation.y, pedlocation.z), 1.5, 1.6,
            { -- The name has to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
                name = "sewakendaraan"..k, -- This is the name of the zone recognized by PolyZone, this has to be unique so it doesn't mess up with other zones
                heading = pedlocation.w, -- The heading of the boxzone, this has to be a float value
                debugPoly = false, -- This is for enabling/disabling the drawing of the box, it accepts only a boolean value (true or false), when true it will draw the polyzone in green
                minZ = pedlocation.z - 2, -- This is the bottom of the boxzone, this can be different from the Z value in the coords, this has to be a float value
                maxZ = pedlocation.z + 2 -- This is the top of the boxzone, this can be different from the Z value in the coords, this has to be a float value
            }, {
                options = { -- This is your options table, in this table all the options will be specified for the target to accept
                { -- This is the first table with options, you can make as many options inside the options table as you want
                    type = "client", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
                    -- event = "t-general:sewakendaraan:client:listkendaraan", -- This is the event it will trigger on click, this can be a client event, server event, command or qbcore registered command, NOTICE: Normal command can't have arguments passed through, QBCore registered ones can have arguments passed through
                    icon = 'fas fa-example', -- This is the icon that will display next to this trigger option
                    label = 'Test', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
                    action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                        -- This will return false if the entity interacted with is a player and otherwise returns true
                        TriggerEvent('t-general:sewakendaraan:client:menu', vehicle, spawnlocation) -- Triggers a client event called testing:event and sends the argument 'test' with it
                    end
                }},
                distance = 2.5 -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
            })
    end
end)


RegisterNetEvent('t-general:sewakendaraan:client:menu', function(vehicle, spawnlocation)
    local options = {}

    for modelvehicle, data in pairs(vehicle) do
        local price = data.price
        local label = data.label
        table.insert(options, {
            title = label, 
            description = 'Harga: $' .. price, 
            icon = 'car', 
            event = 't-general:sewakendaraan:client:sewa',
            args = {
                price = price,
                modelvehicle = modelvehicle,
                spawnlocation = spawnlocation
            }
        })
    end
    lib.registerContext({
        id = 'sewakendaraan',
        title = 'Pilih Kendaraan',
        options = options
    })
    lib.showContext('sewakendaraan')
end)

RegisterNetEvent('t-general:sewakendaraan:client:sewa', function(data)
    local modelvehicle = data.modelvehicle
    local price = data.price
    local location = data.spawnlocation 
    TriggerServerEvent('t-general:sewakendaraan:server:removecash', price, modelvehicle,location)
end)

RegisterNetEvent('t-general:sewakendaraan:client:spawnkendaraan', function (modelvehicle, location)
    RequestModel(modelvehicle)
    -- print(modelvehicle)
    local location = location
    local vehicle = CreateVehicle(modelvehicle, location.x, location.y, location.z, location.w, false, true)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
end)

