ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local xPlayer = ESX.GetPlayerFromId(source)


  
    RegisterCommand('deal', function (source)
      local xPlayer = ESX.GetPlayerFromId(source)
      if xPlayer.getInventoryItem("burnerphone").count and xPlayer.getInventoryItem("cokepack").count >= 1 then 
        TriggerClientEvent("onCommand", source)

      else 
        TriggerClientEvent("pNotify:SendNotification", source, {text = "You need burner phone and coke", timeout = 5000}) 

      end

    end)

    RegisterNetEvent("PayOut1")
    AddEventHandler("PayOut1", function ()
      local xPlayer = ESX.GetPlayerFromId(source)
      local chance = math.random(1,2)
      if xPlayer.getInventoryItem("cokepack").count >= 1 then 
        xPlayer.removeInventoryItem("cokepack", 1)
        xPlayer.addInventoryItem("money", math.random(1300,1500))
       if chance == 1 and Config.BonusItemAllowed then
          xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
      else
        TriggerClientEvent("pNotify:SendNotification", source, {text = "You need coke", timeout = 5000})  
      end
    end)


    RegisterNetEvent("PayOut2")
    AddEventHandler("PayOut2", function ()
      local xPlayer = ESX.GetPlayerFromId(source)
      local chance = math.random(1,2)
      if xPlayer.getInventoryItem("cokepack").count >= 1 then 
        xPlayer.removeInventoryItem("cokepack", 1)
        xPlayer.addInventoryItem("money", math.random(500,900))
       if chance == 1 and Config.BonusItemAllowed then
          xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
      else
        TriggerClientEvent("pNotify:SendNotification", source, {text = "You need coke", timeout = 5000}) 
      end
    end)

    RegisterNetEvent("PayOut3")
    AddEventHandler("PayOut3", function ()
      local xPlayer = ESX.GetPlayerFromId(source)
      local chance = math.random(1,2)
      if xPlayer.getInventoryItem("cokepack").count >= 1 then 
        xPlayer.removeInventoryItem("cokepack", 1)
        xPlayer.addInventoryItem("money", math.random(2000,5300))
       if chance == 1 and Config.BonusItemAllowed then
          xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
      else
        TriggerClientEvent("pNotify:SendNotification", source, {text = "You need coke", timeout = 5000}) 
      end
    end)
    

    RegisterNetEvent("PayOut4")
    AddEventHandler("PayOut4", function ()
      local xPlayer = ESX.GetPlayerFromId(source)
      local chance = math.random(1,2)
      if xPlayer.getInventoryItem("cokepack").count >= 1 then 
        xPlayer.removeInventoryItem("cokepack", 1)
        xPlayer.addInventoryItem("money", math.random(1,6800))
       if chance == 1 and Config.BonusItemAllowed then
          xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
      else
        TriggerClientEvent("pNotify:SendNotification", source, {text = "You need coke", timeout = 5000})  
      end
    end)

    RegisterCommand('callplug', function (source)
      local xPlayer = ESX.GetPlayerFromId(source)
      if xPlayer.getInventoryItem("burnerphone").count then 
        TriggerClientEvent("onPlug", source)

      else 
        TriggerClientEvent("pNotify:SendNotification", source, {text = "You need burner phone", timeout = 5000}) 

      end

    end)

    
    RegisterNetEvent("GiveNote")
    AddEventHandler("GiveNote", function ()
      local xPlayer = ESX.GetPlayerFromId(source)
     
        xPlayer.addInventoryItem("cokenote", 1)
      
      
    end)
    RegisterNetEvent("TakeNote")
    AddEventHandler("TakeNote", function ()
      local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.getInventoryItem("cokenote").count >= 1 then
       xPlayer.removeInventoryItem("cokenote", 1)
     end
    end)
    
    RegisterNetEvent("GivePack")
    AddEventHandler("GivePack", function ()
      local xPlayer = ESX.GetPlayerFromId(source)  
        xPlayer.addInventoryItem("cokepack", math.random(1,4))   
    end)

    ESX.RegisterUsableItem('burnerphone', function(source)
      local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent("onPlug", source)
        TriggerClientEvent("pNotify:SendNotification", source, {text = "Calling plug", timeout = 5000}) 
    end)