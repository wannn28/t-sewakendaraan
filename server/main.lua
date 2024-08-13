local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('t-general:sewakendaraan:server:removecash', function (price, modelvehicle,location)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName('cash')
    -- print(item.amount)
    if item.amount >= price then
        Player.Functions.RemoveItem('cash', price)
        TriggerClientEvent('t-general:sewakendaraan:client:spawnkendaraan',source, modelvehicle,location)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Duit Anda Kurang', 'error', 5000)
    end
    
end)

-- QBCore.Functions.CreateCallback("t-general:sewakendaraan:server:getnamegudang", function(source, cb)
--     local src = source
--     local Citizenid = QBCore.Functions.GetPlayerByCitizenId(source)
--     print(Citizenid)
--     MySQL.query('SELECT * FROM t_gudang WHERE citizenid = ?', {Citizenid}, function(result)
--         cb(result)
--     end)
-- end)