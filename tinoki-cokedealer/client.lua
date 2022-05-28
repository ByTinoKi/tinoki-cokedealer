ESX              = nil
local PlayerData = {}
local active = false
local hasBox = false
local canKnock = true


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


RegisterNetEvent("onCommand")
AddEventHandler("onCommand", function ()
  Citizen.CreateThread(function()
    if not active then 
      active = true

    exports.rprogress:Custom({
      Label = "Looking for a sale",
      Duration = Config.TimeToGetDeal * 1000,
      Animation = {
          scenario = "WORLD_HUMAN_STAND_MOBILE", -- https://pastebin.com/6mrYTdQv
          animationDictionary = "", -- https://alexguirre.github.io/animations-list/
          animationName = "",
      },
      DisableControls = {
          Mouse = false,
          Player = false,
          Vehicle = false
      },    
      onComplete = function(cancelled)
        exports.pNotify:SendNotification({
          text = "You found a customer, the customer is marked on your gps.", 
          type = "success", 
          timeout = math.random(2500, 3000), 
          layout = "centerLeft", 
          queue = "left"
      })
        local buyerChoice = math.random(1,5)
        if buyerChoice == 1 then 
          TriggerEvent("JobLocation1", PlayerPedId())
          SetNewWaypoint(1218.14, 2398.12)
         
       
        elseif buyerChoice == 2  then
          TriggerEvent("JobLocation2", PlayerPedId())
          SetNewWaypoint(-1117.74,-1488.2)
        elseif buyerChoice == 3 then
          TriggerEvent("JobLocation3", PlayerPedId())
          SetNewWaypoint(1321.39,-1746.13)
        elseif buyerChoice == 4 then 
          TriggerEvent("JobLocation4", PlayerPedId())
          SetNewWaypoint(-615.89,476.87)
        elseif buyerChoice == 5 then
          TriggerEvent("JobLocation5", PlayerPedId())
          SetNewWaypoint(-57.92,6647.46)
        end 
      end
  })
else
  exports.pNotify:SendNotification({
    text = "You need to finsish the job first.", 
    type = "error", 
    timeout = math.random(2500, 3000), 
    layout = "centerLeft", 
    queue = "left"
})
end
    
  end)
end)

RegisterNetEvent("onPlug")
AddEventHandler("onPlug", function ()
  Citizen.CreateThread(function()
    if not active then 
      active = true
    exports.rprogress:Custom({
      Label = "Calling plug...",
      Duration = Config.TimeToCallPlug* 1000,
      Animation = {
          scenario = "WORLD_HUMAN_STAND_MOBILE", -- https://pastebin.com/6mrYTdQv
          animationDictionary = "", -- https://alexguirre.github.io/animations-list/
          animationName = "",
      },
      DisableControls = {
          Mouse = false,
          Player = false,
          Vehicle = false
      },    
      onComplete = function(cancelled)
        exports.pNotify:SendNotification({
          text = "You can meet the plug.", 
          type = "success", 
          timeout = math.random(4500, 5000), 
          layout = "centerLeft", 
          queue = "left"
      })
          TriggerEvent("callPlug", PlayerPedId())
          SetNewWaypoint(124.91,-3119.02)
      end
  })
else
  exports.pNotify:SendNotification({
    text = "You need to finsish the job first.", 
    type = "error", 
    timeout = math.random(2500, 3000), 
    layout = "centerLeft", 
    queue = "left"
})
end
    
  end)
end)

AddEventHandler("JobLocation1", function()
  Citizen.CreateThread(function()
    while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, 1218.14, 2398.12, 66.1)
     if dist <= 10 then
       ShowFloatingHelpNotification("Call Kyle outside",vector3(1218.14, 2398.12, 66.1))
      end
      if IsControlJustReleased(1, 38) and dist <=10 then
        RequestAnimDict("timetable@jimmy@doorknock@")
      while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'timetable@jimmy@doorknock@' , 'knockdoor_idle' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
        local ped_hash = GetHashKey("cs_floyd")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
          him = CreatePed(1, ped_hash, 1222.34, 2397.19, 66.11, 111.1, false, false)
          break
      end
        
     end

     while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
     
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, 1222.34, 2397.19, 66.11)
     if dist <= 10 then
       ShowFloatingHelpNotification("Speak with Kyle",vector3(1222.34, 2397.19, 66.11))
      end
      if IsControlJustReleased(1, 38) and dist <=3 then
        RequestAnimDict("mp_common")
      while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(him, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
      DeleteEntity(him)
      TriggerServerEvent("PayOut1", ped)
      exports.pNotify:SendNotification({
        text = "Thanks, here's your money!.", 
        type = "success", 
        timeout = math.random(4500, 5000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      break
      end
    end
  end)
end)

AddEventHandler("JobLocation2", function()
  Citizen.CreateThread(function()
    while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -1117.74, -1488.2, 4.73)
     if dist <= 10 then
       ShowFloatingHelpNotification("Call Chyenne outside",vector3(-1117.74, -1488.2, 4.73))
      end
      if IsControlJustReleased(1, 38) and dist <=10 then
        RequestAnimDict("timetable@jimmy@doorknock@")
      while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'timetable@jimmy@doorknock@' , 'knockdoor_idle' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
        local ped_hash = GetHashKey("a_f_m_downtown_01")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
          her = CreatePed(1, ped_hash, -1120.69, -1489.61, 4.7, 302.55, false, false)
          break
      end
        
     end

     while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -1120.69, -1489.61, 4.7)
     if dist <= 10 then
       ShowFloatingHelpNotification("Speak with Chyenne",vector3(-1120.69, -1489.61, 4.7))
      end
      if IsControlJustReleased(1, 38) and dist <=2 then
        RequestAnimDict("mp_common")
      while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(her, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
      DeleteEntity(her)
      TriggerServerEvent("PayOut2", ped)
      exports.pNotify:SendNotification({
        text = "Nice dude, take my money!.", 
        type = "success", 
        timeout = math.random(4500, 5000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      break
      end
    end
  end)
end)


AddEventHandler("JobLocation3", function()
  Citizen.CreateThread(function()
    while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, 1323.6, -1746.38, 54.35)
     if dist <= 10 then
       ShowFloatingHelpNotification("Call Jose outside",vector3(1321.39, -1746.38, 54.7))
      end
      if IsControlJustReleased(1, 38) and dist <=10 then
        RequestAnimDict("timetable@jimmy@doorknock@")
      while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'timetable@jimmy@doorknock@' , 'knockdoor_idle' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
        local ped_hash = GetHashKey("g_m_y_mexgoon_03")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
          her = CreatePed(1, ped_hash, 1323.6, -1746.38, 54.35, 117.51, false, false)
          break
      end
        
     end

     while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, 1323.6, -1746.38, 54.35)
     if dist <= 10 then
       ShowFloatingHelpNotification("Speak with Jose",vector3(1323.6, -1746.38, 54.35))
      end
      if IsControlJustReleased(1, 38) and dist <=2 then
        RequestAnimDict("mp_common")
      while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(her, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
      DeleteEntity(her)
      TriggerServerEvent("PayOut1", ped)
      exports.pNotify:SendNotification({
        text = "Fuck yeah bro!.", 
        type = "success", 
        timeout = math.random(4500, 5000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      break
      end
    end
  end)
end)


AddEventHandler("JobLocation4", function()
  Citizen.CreateThread(function()
    while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -615.89, 476.87, 109.07)
     if dist <= 10 then
       ShowFloatingHelpNotification("Call Jackson",vector3(-615.89, 476.87, 109.07))
      end
      if IsControlJustReleased(1, 38) and dist <=10 then
        RequestAnimDict("timetable@jimmy@doorknock@")
      while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'timetable@jimmy@doorknock@' , 'knockdoor_idle' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
        local ped_hash = GetHashKey("cs_tom")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
          her = CreatePed(1, ped_hash, -615.99,470.95, 108.86, 334,33, false, false)
          break
      end
        
     end

     while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -615.99,470.95, 108.86)
     if dist <= 10 then
       ShowFloatingHelpNotification("Speak with Jackson",vector3(-615.99,470.95, 108.86))
      end
      if IsControlJustReleased(1, 38) and dist <=2 then
        RequestAnimDict("mp_common")
      while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(her, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
      DeleteEntity(her)
      TriggerServerEvent("PayOut3", ped)
      exports.pNotify:SendNotification({
        text = "Damn bro, i hope its some good stuff!.", 
        type = "success", 
        timeout = math.random(4500, 5000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      break
      end
    end
  end)
end)

AddEventHandler("JobLocation5", function()
  Citizen.CreateThread(function()
    while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -57.92, 6647.46, 31.08)
     if dist <= 10 then
       ShowFloatingHelpNotification("Call 'The Guy'",vector3(-57.92, 6647.46, 31.08))
      end
      if IsControlJustReleased(1, 38) and dist <=10 then
        RequestAnimDict("timetable@jimmy@doorknock@")
      while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'timetable@jimmy@doorknock@' , 'knockdoor_idle' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
        local ped_hash = GetHashKey("ig_lestercrest")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
          her = CreatePed(1, ped_hash, -56.75,6650.88, 29.75, 134.0, false, false)
          break
      end
        
     end

     while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -56.75,6650.88, 29.75)
     if dist <= 10 then
       ShowFloatingHelpNotification("Speak with 'The Guy'",vector3(-56.75,6650.88, 29.75))
      end
      if IsControlJustReleased(1, 38) and dist <=2 then
        RequestAnimDict("mp_common")
      while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(her, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      Wait(5000)
      DeleteEntity(her)
      TriggerServerEvent("PayOut4", ped)
      exports.pNotify:SendNotification({
        text = "Thanks, i need this hard!.", 
        type = "success", 
        timeout = math.random(4500, 5000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      break
      end
    end
  end)
end)

AddEventHandler("callPlug", function()
  Citizen.CreateThread(function()
    while true do
      Wait(0)
      local ped_hash = GetHashKey("g_m_m_korboss_01")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
       her = CreatePed(1, ped_hash, 124.91, -3110.02, 5.96, 319.83, false, false)
       break
    end
    while true do
      canBoss = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, 124.91, -3110.02, 5.96)
      
     if dist <= 20 then
       ShowFloatingHelpNotification("Speak with The Plug",vector3(124.91, -3110.02, 5.96))
       
      end
      if IsControlJustReleased(1, 38) and dist <=10 then
        RequestAnimDict("gestures@m@standing@casual")
      while (not HasAnimDictLoaded("gestures@m@standing@casual")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'gestures@m@standing@casual' , 'gesture_no_way' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(her, 'gestures@f@standing@casual' , 'gesture_point' ,8.0, -8.0, -1, 0, 0, false, false, false )
      exports.pNotify:SendNotification({
        text = "Take this note and give it to Miguel at the airport. He is on the third level.", 
        type = "success", 
        timeout = math.random(7500, 8000), 
        layout = "centerLeft", 
        queue = "left"
    })
      Wait(1000)
      TriggerServerEvent("GiveNote", ped)
      SetNewWaypoint(-1043.82, -2635.57)
      Wait(7000)
      DeleteEntity(her)
          break
      end
     end

     while true do
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -1043.82,-2635.57, 26.6)
      local ped_hash = GetHashKey("g_m_y_mexgoon_01")
        RequestModel(ped_hash)
          while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
          end
          if dist >= 10 then
            local vehCrds = vector3(-1051.03, -2634.18, 26.6)
            her = CreatePed(1, ped_hash, -1043.82,-2635.57, 26.6, 319.83, false, false)
            ESX.Game.SpawnVehicle("burrito", vehCrds, 271.18, function() 
            end)
          end
       break
    end
     while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
      
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -1043.82,-2635.57, 26.6)
     if dist <= 10 then
       ShowFloatingHelpNotification("Speak with Miguel'",vector3(-1043.82,-2635.57, 26.6))
      end
      if IsControlJustReleased(1, 38) and dist <=2 then
        RequestAnimDict("mp_common")
      while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TaskPlayAnim(her, 'mp_common' , 'givetake1_a' ,8.0, -8.0, -1, 0, 0, false, false, false )
      TriggerServerEvent("TakeNote", ped)
      Wait(5000)
      DeleteEntity(her)
      exports.pNotify:SendNotification({
        text = "I have the stuff, take it from the van.", 
        type = "success", 
        timeout = math.random(9500, 10000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      break
      end
    end


    while true do
      canKnock = true
      Wait(0)
      local ped = PlayerPedId()
      local pCrds = GetEntityCoords(ped)
      local vehicle = ESX.Game.GetVehicleInDirection()
    
      
      local dist = Vdist(pCrds.x, pCrds.y, pCrds.z, -1054.17,-2634.22, 26.6)
     if dist <= 10 then
       ShowFloatingHelpNotification("Grab the packages.",vector3(-1054.17,-2634.22, 26.6))
      end
      if IsControlJustReleased(1, 38) and dist <=2 then
        RequestAnimDict("mini@repair")
      while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
      TaskPlayAnim(ped, 'mini@repair' , 'fixing_a_ped' ,8.0, -8.0, 5000, 0, 0, false, false, false )
      SetVehicleDoorOpen(vehicle, 2, 0, true)
      SetVehicleDoorOpen(vehicle, 3, 0, true)
      Wait(5000)
      DeleteVehicle(vehicle)
        TriggerServerEvent("GivePack", ped)
      Wait(5000)      
      exports.pNotify:SendNotification({
        text = "Get out the area.", 
        type = "success", 
        timeout = math.random(9500, 10000), 
        layout = "centerLeft", 
        queue = "left"
    })
      active = false
      hasBox = true
      break
      end
    end
  end)
end)


function ShowFloatingHelpNotification(msg, coords)
  SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
  SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
  BeginTextCommandDisplayHelp('STRING')
  AddTextComponentSubstringPlayerName(msg)
  EndTextCommandDisplayHelp(2, false, true, 0)
end

