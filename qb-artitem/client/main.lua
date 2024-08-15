local isHoldingPainting = false
local paintingProp = nil

RegisterNetEvent('qb-artitem:client:usePainting', function()
    local playerPed = PlayerPedId()

    if isHoldingPainting then
        ClearPedTasks(playerPed)
        DeleteObject(paintingProp)
        isHoldingPainting = false
    else
        RequestAnimDict("amb@world_human_bum_freeway@male@base")
        while not HasAnimDictLoaded("amb@world_human_bum_freeway@male@base") do
            Wait(100)
        end

        TaskPlayAnim(playerPed, "amb@world_human_bum_freeway@male@base", "base", 8.0, -8.0, -1, 49, 0, false, false, false)
        
        local model = GetHashKey('prop_beggers_sign_04') -- Replace with your chosen model
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
        
        local x, y, z = table.unpack(GetEntityCoords(playerPed))
        paintingProp = CreateObject(model, x, y, z, true, true, true)
        AttachEntityToEntity(paintingProp, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.08, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        isHoldingPainting = true
    end
end)

RegisterCommand('holdpainting', function()
    TriggerEvent('qb-artitem:client:usePainting')
end)
