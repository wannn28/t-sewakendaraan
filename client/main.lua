-- local playerPed = PlayerPedId()
-- local planeModel = GetHashKey("luxor")
-- local taxiModel = GetHashKey("taxi")
-- local driverModel = GetHashKey("a_m_m_hasjew_01")
-- local taxiMaxSpeed = 20.0 -- Adjust this value as needed
-- local landingCoords = vector4(-1214.86, -3018.79, 13.94, 239.87)
-- local landingCoords2 = vector4(-1207.07, -3023.25, 13.94, 237.28)
-- local landingCoords3 = vector4(-1180.88, -2977.12, 13.95, 330.66)
-- local landingCoords4 = vector4(-1088.57, -3023.11, 13.95, 322.25)
-- local landingCoords5 = vector4(-1055.29, -2964.12, 13.96, 327.25)
-- local landingCoords6 = vector4(-986.1, -2998.91, 13.95, 238.57)
-- local posisidiudara = vector4(-2229.28, -2428.21, 202.6, 239.87)
-- local taxi
-- local driver
-- local plane

-- local destinationCoords = vector4(-1035.63, -2728.27, 20.11, 234.26)
-- local taxiCoords = vector4(-953.82, -2996.65, 13.95, 61.44)
-- RegisterNetEvent('t-multicharacter:client:animasi', function()

--     -- Maximum speed for the taxi in meters per second (e.g., 10 m/s is ~36 km/h)

--     -- Request models for the plane, taxi, and NPC
--     RequestModel(planeModel)
--     RequestModel(taxiModel)
--     RequestModel(driverModel)
--     while not HasModelLoaded(planeModel) or not HasModelLoaded(taxiModel) or not HasModelLoaded(driverModel) do
--         Wait(1)
--     end

--     -- Spawn the plane in the air
--     plane = CreateVehicle(planeModel, posisidiudara.x, posisidiudara.y, posisidiudara.z, posisidiudara.w, true,
--         false)
--     SetEntityHeading(plane, posisidiudara.w)
--     SetVehicleForwardSpeed(plane, 30.0)
--     NetworkSetEntityInvisibleToNetwork(plane, true)

--     -- Put player into the plane as a passenger
--     SetPedIntoVehicle(playerPed, plane, -1)
--     NetworkSetEntityInvisibleToNetwork(playerPed, true)

--     -- Create several cameras around the plane
--     local cameras = {}
--     cameras[1] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     AttachCamToEntity(cameras[1], plane, 0.0, -20.0, 2.8, true)
--     SetCamRot(cameras[1], 0.0, 0.0, 239.87)
--     SetCamFov(cameras[1], 70.0)

--     cameras[2] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     AttachCamToEntity(cameras[2], playerPed, 8.0, 4.5, 1.8, true)
--     SetCamFov(cameras[2], 170.0)

--     cameras[3] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     AttachCamToEntity(cameras[3], plane, 8.0, 0.0, 5.0, true)
--     SetCamRot(cameras[3], 0.0, 0.0, 322.21)
--     SetCamFov(cameras[3], 100.0)

--     cameras[4] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     AttachCamToEntity(cameras[4], playerPed, 8.0, 4.5, 1.8, true)
--     SetCamFov(cameras[4], 170.0)

--     -- Additional new cameras
--     local newCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     SetCamCoord(newCam, -1469.48, -2843.77, 14.73)
--     SetCamRot(newCam, 0.0, 0.0, 67.73)
--     SetCamFov(newCam, 70.0)

--     local newCam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     SetCamCoord(newCam2, -1114.47, -2988.43, 13.94)
--     SetCamRot(newCam2, 0.0, 0.0, 87.93)
--     SetCamFov(newCam2, 70.0)

--     local newCam3 = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     SetCamCoord(newCam3, -991.29, -2938.79, 50.82)
--     SetCamRot(newCam3, -20.0, -20.0, 118.09)
--     SetCamFov(newCam3, 70.0)

--     local newCam4 = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     SetCamCoord(newCam4, -952.23, -3015.05, 20.88)
--     SetCamRot(newCam4, 0.0, 0.0, 58.3)
--     SetCamFov(newCam4, 70.0)

--     local activeCamIndex = 1
--     local newCamCalled = false
--     local newCam2Called = false
--     local newCam3Called = false
--     local newCam4Called = false
--     SetCamActive(cameras[activeCamIndex], true)
--     RenderScriptCams(true, false, 0, true, false)

--     Citizen.CreateThread(function()
--         while IsPedInVehicle(playerPed, plane, false) do
--             if activeCamIndex == 4 then
--                 Wait(14000)
--             else
--                 Wait(7000)
--             end
--             SetCamActive(cameras[activeCamIndex], false)

--             if activeCamIndex == 2 and not newCamCalled then
--                 SetCamActive(newCam, true)
--                 Wait(8000)
--                 SetCamActive(newCam, false)
--                 newCamCalled = true
--             end

--             if activeCamIndex == 4 and not newCam2Called then
--                 SetCamActive(newCam2, true)
--                 Wait(10000)
--                 SetCamActive(newCam2, false)
--                 newCam2Called = true
--             end
--             if activeCamIndex == 4 and not newCam3Called and newCam2Called then
--                 SetCamActive(newCam3, true)
--                 Wait(10000)
--                 SetCamActive(newCam3, false)
--                 newCam3Called = true
--             end
--             if activeCamIndex == 4 and not newCam4Called and newCam3Called then
--                 SetCamActive(newCam4, true)
--                 Wait(10000)
--                 SetCamActive(newCam4, false)
--                 newCam4Called = true
--                 break
--             end

--             activeCamIndex = (activeCamIndex % #cameras) + 1
--             SetCamActive(cameras[activeCamIndex], true)
--         end
--     end)

--     -- Set plane to fly to the landing point
--     TaskVehicleDriveToCoord(playerPed, plane, landingCoords.x, landingCoords.y, landingCoords.z, landingCoords.w, 0,
--         planeModel, 262144, 15.0, true)

--     -- Wait for plane to reach a certain height for landing
--     while GetEntityHeightAboveGround(plane) > 250.0 do
--         Wait(100)
--     end

--     -- Start lowering the plane and prepare to land

--     SetVehicleEngineOn(plane, false, true, true)
--     Wait(20000)
--     SetVehicleLandingGear(plane, 2)
--     -- Set plane to move to landingCoords2 (Route 2)
--     SetVehicleForwardSpeed(plane, 15.0)
--     SetVehicleEngineOn(plane, true, true, true)
--     TaskVehicleDriveToCoord(playerPed, plane, landingCoords2.x, landingCoords2.y, landingCoords2.z, 15.0, 0, planeModel,
--         262144, 15.0, true)

--     -- Wait for plane to stop at landingCoords2 (Route 2)
--     while Vdist2(GetEntityCoords(plane, true), landingCoords2.xyz) > 1300.0 do
--         Wait(100)
--     end

--     -- Set plane to move to landingCoords3 (Route 3)
--     TaskVehicleDriveToCoord(playerPed, plane, landingCoords3.x, landingCoords3.y, landingCoords3.z, 10.0, 0, planeModel,
--         262144, 15.0, true)

--     -- Wait for plane to stop at landingCoords3 (Route 3)
--     while Vdist2(GetEntityCoords(plane, true), landingCoords3.xyz) > 500 do
--         Wait(100)
--     end

--     -- Set plane to move to landingCoords4 (Route 4)
--     TaskVehicleDriveToCoord(playerPed, plane, landingCoords4.x, landingCoords4.y, landingCoords4.z, 10.0, 0, planeModel,
--         262144, 15.0, true)

--     -- Wait for plane to stop at landingCoords4 (Route 4)
--     while Vdist2(GetEntityCoords(plane, true), landingCoords4.xyz) > 1000 do
--         Wait(100)
--     end

--     -- Create taxi and driver

--     -- Set plane to move to landingCoords5 (Route 5)
--     TaskVehicleDriveToCoord(playerPed, plane, landingCoords5.x, landingCoords5.y, landingCoords5.z, 10.0, 0, planeModel,
--         262144, 15.0, true)

--     -- Wait for plane to stop at landingCoords5 (Route 5)
--     while Vdist2(GetEntityCoords(plane, true), landingCoords5.xyz) > 500.0 do
--         Wait(100)
--     end

--     -- Set plane to move to landingCoords6 (Route 6)
--     TaskVehicleDriveToCoord(playerPed, plane, landingCoords6.x, landingCoords6.y, landingCoords6.z, 10.0, 0, planeModel,
--         262144, 15.0, true)
--         spawnTaxi()
--     -- Wait for plane to stop at landingCoords6 (Route 6)
--     while Vdist2(GetEntityCoords(plane, true), landingCoords6.xyz) > 100.0 do
--         Wait(100)
--     end
--     SetVehicleEngineOn(plane, false, true, true)
--     Wait(3000)

--     -- Stop the plane
--     SetVehicleForwardSpeed(plane, 0.0)

--     -- Wait for the plane to completely stop
--     while not IsVehicleStopped(plane) do
--         Wait(100)
--     end
--     RenderScriptCams(false, false, 0, true, false)
--     for _, cam in pairs(cameras) do
--         DestroyCam(cam, false)
--     end
--     -- Destroy additional cameras
--     DestroyCam(newCam, false)
--     -- Stop and exit the plane
--     TaskLeaveVehicle(playerPed, plane, 0)
--     Wait(1000)
--     TriggerEvent('t-multicharacter:client:spawntaxi')
--     -- Spawn taxi

-- end)
-- function spawnTaxi()
--     RequestModel(planeModel)
--     RequestModel(taxiModel)
--     RequestModel(driverModel)
--     while not HasModelLoaded(planeModel) or not HasModelLoaded(taxiModel) or not HasModelLoaded(driverModel) do
--         Wait(1)
--     end
--     taxi = CreateVehicle(taxiModel, taxiCoords.x, taxiCoords.y, taxiCoords.z, taxiCoords.w, true, false)
--     driver = CreatePedInsideVehicle(taxi, 4, driverModel, -1, true, false)
-- end
-- RegisterNetEvent('t-multicharacter:client:spawntaxi', function()


--     -- Set the max speed for the taxi
--     SetVehicleMaxSpeed(taxi, taxiMaxSpeed)
--     SetPedCanBeTargetted(driver, false)
--     NetworkSetEntityInvisibleToNetwork(taxi, true)
--     NetworkSetEntityInvisibleToNetwork(driver, true)

--     TaskEnterVehicle(playerPed, taxi, -1, 2, 1.0, 1, 0) -- 2 is the front passenger seat    -- Put player into the taxi as a passenger

--     -- Wait for the player to enter the taxi
--     while not IsPedInVehicle(playerPed, taxi, false) do
--         Wait(100)
--     end

--     -- Lock the taxi doors to prevent player exit
--     SetVehicleDoorsLockedForAllPlayers(taxi, true) -- Lock all vehicle doors

--     -- Set taxi to move to destinationCoords
--     TaskVehicleDriveToCoord(driver, taxi, destinationCoords.x, destinationCoords.y, destinationCoords.z,
--         destinationCoords.w, 0, taxiModel, 524604, 10.0)

--     -- Disable the F key (exit)
--     Citizen.CreateThread(function()
--         while true do
--             Citizen.Wait(0)
--             -- Control 23 is input for exiting the vehicle (default: F)
--             if IsPedInVehicle(playerPed, taxi, false) then
--                 DisableControlAction(0, 75, true) -- Disable vehicle exit
--                 DisableControlAction(27, 75, true) -- Disable vehicle exit for rear camera
--             else
--                 break -- Exit the loop if player is no longer in taxi
--             end
--         end
--     end)
--     Wait(5000)
--     DeleteVehicle(plane)
--     while Vdist2(GetEntityCoords(taxi, true), -983.7, -2834.11, 13.96) > 20 do
--         print(Vdist2(GetEntityCoords(taxi, true), -983.7, -2834.11, 13.96))
--         if Vdist2(GetEntityCoords(taxi, true), -983.7, -2834.11, 13.96) < 200 then
--             SetVehicleForwardSpeed(taxi, 8.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -983.7, -2834.11, 13.96) < 100 then
--             SetVehicleForwardSpeed(taxi, 3.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -983.7, -2834.11, 13.96) < 50 then
--             SetVehicleForwardSpeed(taxi, 2.0)
--         end
--         Wait(100)
--     end
--     while Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) > 1 do
--         print(Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96))
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 100 then
--             SetVehicleForwardSpeed(taxi, 8.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 50 then
--             SetVehicleForwardSpeed(taxi, 6.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 10 then
--             SetVehicleForwardSpeed(taxi, 4.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 8 then
--             SetVehicleForwardSpeed(taxi, 0.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 7 then
--             SetVehicleForwardSpeed(taxi, 0.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 6 then
--             SetVehicleForwardSpeed(taxi, 0.0)
--         end
--         if Vdist2(GetEntityCoords(taxi, true), -958.19, -2798.53, 13.96) < 5 then
--             SetVehicleForwardSpeed(taxi, 0.0)
--             Wait(500)
--             SetVehicleForwardSpeed(taxi, 0.0)
--             break
--         end
--         Wait(100)
--     end
--     -- Wait for the taxi to reach the destination
--     while Vdist2(GetEntityCoords(taxi, true), destinationCoords.xyz) > 100.0 do
--         Wait(100)
--     end

--     -- Stop the taxi
--     SetVehicleForwardSpeed(taxi, 0.0)
--     TaskVehicleTempAction(driver, taxi, 27, 5000)

--     -- Wait for the taxi to completely stop
--     while not IsVehicleStopped(taxi) do
--         Wait(100)
--     end

--     -- Unlock the doors and allow the player to exit
--     SetVehicleDoorsLockedForAllPlayers(taxi, false) -- Unlock all vehicle doors

--     -- Stop and exit the taxi
--     TaskLeaveVehicle(playerPed, taxi, 0)
--     Wait(5000)
--     DeleteVehicle(taxi)

--     DeletePed(driver)
--     SetEntityVisible(playerPed, true, 0) -- Make the player visible again
--     NetworkSetEntityInvisibleToNetwork(playerPed, false)

--     -- Deactivate all cameras and return to player camera
-- end)
-- RegisterCommand('tesanimasi', function()
--     TriggerEvent('t-multicharacter:client:animasi')
--     -- TriggerEvent('t-multicharacter:client:spawntaxi')
-- end)
