local allowPassengersToDriveBy = true

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				local speed = GetEntitySpeed(car) * 3.6
				if speed >= 50 then
					SetPlayerCanDoDriveBy(PlayerId(), false)
				else
					if GetVehicleCurrentAcceleration(car) >= 1 then
						SetPlayerCanDoDriveBy(PlayerId(), false)	
					else
						SetPlayerCanDoDriveBy(PlayerId(), true)	
					end
				end
			elseif allowPassengersToDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)