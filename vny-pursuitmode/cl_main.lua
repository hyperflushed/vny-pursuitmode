Citizen.CreateThread(function()
    print(Veny.notify)
    if Veny.notify == "qbcorenotify" then
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
            PlayerData = QBCore.Functions.GetPlayerData()
        end
    end
end)

local mode1 = false
local mode2 = false
local mode3 = false
local mode4 = true

CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if IsControlJustPressed(0, 178) then --delete
            if vehicle ~= 0 then
                local vehiclehash = GetEntityModel(vehicle)
                if vehiclehash == Veny.PursuitCar1 or vehiclehash == Veny.PursuitCar2 or vehiclehash == Veny.PursuitCar3 or vehiclehash == Veny.PursuitCar4 then
                    local defaultcarspeed = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
                    if mode4 then
                        mode4 = false
                        mode1 = true
                        if Veny.notify == "notification" then
                            TriggerEvent('notification', "Pursuit Mode: A+" , 1)
                        elseif Veny.notify == "mythicnotify" then
                            exports['mythic_notify']:SendAlert('success', "Pursuit Mode: A+")
                        elseif Veny.notify == "qbcorenotify" then
                            QBCore.Functions.Notify("Pursuit Mode: A+", "success")
                        elseif Veny.notify == "esxshownotification" then
                            ESX.ShowNotification("Pursuit Mode: A+", false, true, 130)
                        end
                        SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierAPlus)
                    elseif mode1 then
                        mode1 = false
                        mode2 = true
                        if Veny.notify == "notification" then
                            TriggerEvent('notification', "Pursuit Mode: S" , 1)
                        elseif Veny.notify == "mythicnotify" then
                            exports['mythic_notify']:SendAlert('success', "Pursuit Mode: S")
                        elseif Veny.notify == "qbcorenotify" then
                            QBCore.Functions.Notify("Pursuit Mode: S", "success")
                        elseif Veny.notify == "esxshownotification" then
                            ESX.ShowNotification("Pursuit Mode: S", false, true, 130)
                        end
                        SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierS)
                    elseif mode2 then
                        mode2 = false
                        mode3 = true
                        if Veny.notify == "notification" then
                            TriggerEvent('notification', "Pursuit Mode: S+" , 1)
                        elseif Veny.notify == "mythicnotify" then
                            exports['mythic_notify']:SendAlert('success', "Pursuit Mode: S+")
                        elseif Veny.notify == "qbcorenotify" then
                            QBCore.Functions.Notify("Pursuit Mode: S+", "success")
                        elseif Veny.notify == "esxshownotification" then
                            ESX.ShowNotification("Pursuit Mode: S+", false, true, 130)
                        end
                        SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierSPlus)
                    elseif mode3 then
                        mode3 = false
                        mode4 = true
                        if Veny.notify == "notification" then
                            TriggerEvent('notification', "Pursuit Mode: A" , 1)
                        elseif Veny.notify == "mythicnotify" then
                            exports['mythic_notify']:SendAlert('success', "Pursuit Mode: A")
                        elseif Veny.notify == "qbcorenotify" then
                            QBCore.Functions.Notify("Pursuit Mode: A", "success")
                        elseif Veny.notify == "esxshownotification" then
                            ESX.ShowNotification("Pursuit Mode: A", false, true, 130)
                        end
                        SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierA)
                    end
                else
                    if Veny.notify == "notification" then
                        TriggerEvent('notification', "You are not in a pursuit car" , 2)
                    elseif Veny.notify == "mythicnotify" then
                        exports['mythic_notify']:SendAlert('error', "You are not in a pursuit car")
                    elseif Veny.notify == "qbcorenotify" then
                        QBCore.Functions.Notify("You are not in a pursuit car", "error")
                    elseif Veny.notify == "esxshownotification" then
                        ESX.ShowNotification("You are not in a pursuit car", false, true, 130)
                    end
                end
            else
                if Veny.notify == "notification" then
                    TriggerEvent('notification', "You are not in a car" , 2)
                elseif Veny.notify == "mythicnotify" then
                    exports['mythic_notify']:SendAlert('error', "You are not in a car")
                elseif Veny.notify == "qbcorenotify" then
                    QBCore.Functions.Notify("You are not in a car", "error")
                elseif Veny.notify == "esxshownotification" then
                    ESX.ShowNotification("You are not in a car", false, true, 130)
                end
            end
        end
        Wait(0)
    end
end)