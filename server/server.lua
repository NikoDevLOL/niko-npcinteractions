ESX.RegisterServerCallback('niko-drugfirst', function(source, cb, sellPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(Config.DrugsItems[1])
    local randomcash = math.random(Config.DrugOneMaxPrice[1], Config.DrugOneMaxPrice[2])
    local sellPriceNumber = tonumber(sellPrice)
    if sellPriceNumber <= randomcash then
        local costam = math.random(1, 100)
        if costam >= 40 then
            if item.count >= 1 then
                TriggerClientEvent('niko-endlolz', source)
                xPlayer.removeInventoryItem(Config.DrugsItems[1], 1)
                xPlayer.addInventoryItem('money', sellPriceNumber)
            else
                xPlayer.showNotification('Czemu próbujesz zrobić mnie w chuja?')
            end
        else
            xPlayer.showNotification('Spierdalaj')
            TriggerClientEvent('niko-endlolz', source)
        end
    else
        local nikorand = math.random(1, 2)
        if nikorand == 1 then
            xPlayer.showNotification('Stary nie mam tyle cashu!')
        else
            xPlayer.showNotification('Spierdalaj')
            TriggerClientEvent('niko-endlolz', source)
        end
    end
end)

ESX.RegisterServerCallback('niko-drugsecond', function(source, cb, sellPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(Config.DrugsItems[2])
    local randomcash = math.random(Config.DrugTwoMaxPrice[1], Config.DrugTwoMaxPrice[2])
    local sellPriceNumber = tonumber(sellPrice)
    if sellPriceNumber <= randomcash then
        local costam = math.random(1, 100)
        if costam >= 40 then
            if item.count >= 1 then
                TriggerClientEvent('niko-endlolz', source)
                xPlayer.removeInventoryItem(Config.DrugsItems[2], 1)
                xPlayer.addInventoryItem('money', sellPriceNumber)
            else
                xPlayer.showNotification('Czemu próbujesz zrobić mnie w chuja?')
            end
        else
            xPlayer.showNotification('Spierdalaj')
            TriggerClientEvent('niko-endlolz', source)
        end
    else
        local nikorand = math.random(1, 2)
        if nikorand == 1 then
            xPlayer.showNotification('Stary nie mam tyle cashu!')
        else
            xPlayer.showNotification('Spierdalaj')
            TriggerClientEvent('niko-endlolz', source)
        end
    end
end)

ESX.RegisterServerCallback('niko-drugthird', function(source, cb, sellPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(Config.DrugsItems[3])
    local randomcash = math.random(Config.DrugThreeMaxPrice[1], Config.DrugThreeMaxPrice[2])
    local sellPriceNumber = tonumber(sellPrice)
    if sellPriceNumber <= randomcash then
        local costam = math.random(1, 100)
        if costam >= 40 then
            if item.count >= 1 then
                TriggerClientEvent('niko-endlolz', source)
                xPlayer.removeInventoryItem(Config.DrugsItems[3], 1)
                xPlayer.addInventoryItem('money', sellPriceNumber)
            else
                xPlayer.showNotification('Czemu próbujesz zrobić mnie w chuja?')
            end
        else
            xPlayer.showNotification('Spierdalaj')
            TriggerClientEvent('niko-endlolz', source)
        end
    else
        local nikorand = math.random(1, 2)
        if nikorand == 1 then
            xPlayer.showNotification('Stary nie mam tyle cashu!')
        else
            xPlayer.showNotification('Spierdalaj')
            TriggerClientEvent('niko-endlolz', source)
        end
    end
end)

ESX.RegisterServerCallback('niko-checkOptionDrug', function(source, cb)
    local drugOption = false
    local xPlayer = ESX.GetPlayerFromId(source)
    local item1 = xPlayer.getInventoryItem(Config.DrugsItems[1])
    local item2 = xPlayer.getInventoryItem(Config.DrugsItems[2])
    local item3 = xPlayer.getInventoryItem(Config.DrugsItems[3])

    if item1.count >= 1 or item2.count >= 1 or item3.count >= 1 then
        drugOption = true
    else
        drugOption = false
    end

    cb({
        data = drugOption
    })
end)