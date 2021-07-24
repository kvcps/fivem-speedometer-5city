local ind = {l = false, r = false}

Citizen.CreateThread(function()
	while true do
		local Ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then

				-- Licznik itp.
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 2.236936)
				SendNUIMessage({
					showhud = true,
					speed = carSpeed
				})

			else
				SendNUIMessage({
					showhud = false
				})
			end
		else
			SendNUIMessage({
				showhud = false
			})
		end

		Citizen.Wait(1)
	end
end)

-- Paliwo
Citizen.CreateThread(function()
	while true do
		local Ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
				fuel = GetVehicleFuelLevel(PedCar)
				rpm = GetVehicleCurrentRpm(PedCar)
				rpmfuel = 0

				if rpm > 0.9 then
					rpmfuel = fuel - rpm / 1.8
					Citizen.Wait(1000)
				elseif rpm > 0.8 then
					rpmfuel = fuel - rpm / 2.1
					Citizen.Wait(1500)
				elseif rpm > 0.7 then
					rpmfuel = fuel - rpm / 3.2
					Citizen.Wait(2000)
				elseif rpm > 0.6 then
					rpmfuel = fuel - rpm / 1.1
					Citizen.Wait(3000)
				elseif rpm > 0.5 then
					rpmfuel = fuel - rpm / 1.7
					Citizen.Wait(4000)
				elseif rpm > 0.4 then
					rpmfuel = fuel - rpm / 1.4
					Citizen.Wait(5000)
				elseif rpm > 0.3 then
					rpmfuel = fuel - rpm / 6.9
					Citizen.Wait(6000)
				elseif rpm > 0.2 then
					rpmfuel = fuel - rpm / 7.3
					Citizen.Wait(8000)
				else
					rpmfuel = fuel - rpm / 7.5
					Citizen.Wait(15000)
				end

				carFuel = SetVehicleFuelLevel(PedCar, rpmfuel)

				SendNUIMessage({
			showfuel = true,
					fuel = fuel
				})
			end
		end

		Citizen.Wait(1)
	end
end)