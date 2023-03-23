RegisterCommand("car", function (source, args)
    local ped = PlayerPedId()
    local carname = args[1]
    local playercords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    if not IsModelInCdimage(carname) then
        TriggerEvent('chat:addMessage',{
            color = {255, 0, 0},
            multiline = true,
            args = {"System", carname .. " Is not a car"}
        })
        return
    end

    RequestModel(carname)

    while not HasModelLoaded(carname) do
        Wait(10)
    end
    print(playercords)
    local car = CreateVehicle(
        carname,
        playercords,
        heading,
        true
    )
    SetPedIntoVehicle(ped,car,-1)
    SetModelAsNoLongerNeeded(car)
end, false)