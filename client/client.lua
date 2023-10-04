local dragTypes = ""
local pedModel = nil
local pedsInteract = {}

RegisterNetEvent('npc-interactions', function(data)
    pedModel = data.entity
        pedsInteract[data.entity] = true
        FreezeEntityPosition(pedModel, true)
        SetEntityInvincible(pedModel, true)
        SetBlockingOfNonTemporaryEvents(pedModel, true)
        SetEntityVelocity(pedModel, 0.0, 0.0, 0.0)
        ClearPedTasks(pedModel)
        TaskStandStill(pedModel, 10000000)
    
        ESX.TriggerServerCallback('niko-checkOptionDrug', function(cb)
            if cb.data then
                SendNUIMessage({
                    action = 'open',
                })
                SetNuiFocus(true, true)
            else
                SendNUIMessage({
                    action = 'nodrugopen',
                })
                SetNuiFocus(true, true)
            end
        end)
end)

RegisterNuiCallback("sellDrugs", function(data)
    if data.dragtype == 1 then
        dragTypes = 1
    elseif data.dragtype == 2 then
        dragTypes = 2
    elseif data.dragtype == 3 then
        dragTypes = 3
    end
end)

RegisterNuiCallback("sellPrice", function(data)
    local sellPrice = data.sellPrice
    if dragTypes == 1 then
        ESX.TriggerServerCallback('niko-drugfirst', function(cb)
        end, sellPrice)
    elseif dragTypes == 2 then
        ESX.TriggerServerCallback('niko-drugsecond', function(cb)
        end, sellPrice)
    elseif dragTypes == 3 then
        ESX.TriggerServerCallback('niko-drugthird', function(cb)
        end, sellPrice)
    end
end)

RegisterNUICallback("close", function()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    TaskWanderStandard(pedModel, 10, 10)
    TaskGoStraightToCoord(pedModel, playerCoords.x + 100.0, playerCoords.y, playerCoords.z, 1.0, -1, 0.0, 0.0)
    FreezeEntityPosition(pedModel, false)
	SetNuiFocus(false, false)
end)

RegisterNUICallback("closetexting", function()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    ESX.ShowNotification('Dobra stary, bo czas mnie goni siemanko!')
	SetNuiFocus(false, false)
    FreezeEntityPosition(pedModel, false)
    TaskWanderStandard(pedModel, 10, 10)
end)

RegisterNUICallback("agresiveclose", function()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
	SetNuiFocus(false, false)
    FreezeEntityPosition(pedModel, false)
    TaskWanderStandard(pedModel, 10, 10)
end)

RegisterNetEvent('niko-endlolz', function()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    TaskWanderStandard(pedModel, 10, 10)
    TaskGoStraightToCoord(pedModel, playerCoords.x + 100.0, playerCoords.y, playerCoords.z, 1.0, -1, 0.0, 0.0)
    FreezeEntityPosition(pedModel, false)
    SendNUIMessage({
        action = 'nikoend',
    })
    SetNuiFocus(false, false)
    selling = true
    Wait(15000)
    selling = false
end)

Citizen.CreateThread(function()
    for _, pedModel in ipairs(Config.PedsModels) do
        exports.qtarget:AddTargetModel(pedModel, {
            options = {
                {
                    event = "npc-interactions",
                    icon = "fas fa-user",
                    label = "Porozmawiaj",
                    canInteract = function(entity)
                        if pedsInteract[entity] == true then
                            return false
                        else
                            return true
                        end
                    end
                }
            },
            distance = 2.0
        })
    end
end)