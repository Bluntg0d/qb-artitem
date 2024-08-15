-- Inside your custom server script (e.g., qb-artitem/server/main.lua)
QBCore.Functions.CreateUseableItem("painting", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('qb-artitem:client:usePainting', source)
    end
end)
