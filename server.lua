local RSGCore = exports['rsg-core']:GetCoreObject()
local DropCount = 0

-- SENDS DROP COUNT TO SERVER FOR CORRECT PAYMENT --
RegisterNetEvent('danglr-construction:GetDropCount', function(count)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    DropCount = count
end)

-- CHECKS IF PLAYER WAS PAID TO PREVENT EXPLOITS --
RSGCore.Functions.CreateCallback('danglr-construction:CheckIfPaycheckCollected', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src) 
    local payment = (DropCount * Config.PayPerDrop)
    if Player.Functions.AddMoney(Config.Moneytype, payment) then
        DropCount = 0
        cb(true)
    else
        cb(false)
    end
end)
