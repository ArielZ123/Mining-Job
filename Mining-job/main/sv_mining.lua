if Config.OldEsx == true then
   ESX = nil
   TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

---- Script Settings ----
local Stones_remove_table = { -- The stones name and the numbers to remove after smelt, add more as your stones list.
	  { Stone = "Granite", Amount = 15 },
	  { Stone = "Limestone", Amount = 15 },
	  { Stone = "Marble", Amount = 15 },
	  { Stone = "Onyx", Amount = 15 },
}

local Rocks_remove_table = { -- The rocks name and the numbers to remove after smelt, add more as your rocks list.
	  { Rock = "Emerald", Amount = 15 },
	  { Rock = "Jadeite", Amount = 15 },
	  { Rock = "Diamond", Amount = 15 },
	  { Rock = "Taaffeite", Amount = 15 },
	  { Rock = "Grandidierite", Amount = 15 },
	  { Rock = "Serendibite", Amount = 15 },
	  { Rock = "Musgravite", Amount = 15 },
}

local Stones_list = { -- Add more stones to list.
  "Granite",
  "Limestone",
  "Marble",
  "Onyx"
}

local Rocks_list = { -- Add more rocks to list. 
  "Emerald",
  "Jadeite",
  "Diamond",
  "Taaffeite",
  "Grandidierite",
  "Serendibite",
  "Musgravite"
}
---- Script Settings ----

-- Pickaxe check --
ESX.RegisterServerCallback('mining:server:haspickaxe', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PickaxeQuantity = xPlayer.getInventoryItem('Pickaxe').count
    if PickaxeQuantity >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

function Stones_amount()
	return math.random(1,2) -- numbers of the stones that a player can get.
end

function Rocks_amount()
	return math.random(1,2) -- numbers of the rocks that a player can get.
end

function Random_stones()
  return Stones_list[math.random(#Stones_list)]
end

function Random_rocks()
  return Rocks_list[math.random(#Rocks_list)]
end

RegisterServerEvent('mining:stones:find')
AddEventHandler('mining:stones:find', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local Stones_chance = math.random(100)
  if Stones_chance > 40 then -- The chance of the stones find, you can change to higher number for hard chance.
      math.randomseed(GetGameTimer())
      xPlayer.addInventoryItem(Random_stones(), Stones_amount())
      TriggerClientEvent("pNotify:SendNotification", source, {
         text = "You found some stones.",
         type = "success",
         queue = "lmao",
         timeout = 7000,
         layout = "Centerleft"
      })
  else
      TriggerClientEvent("pNotify:SendNotification", source, {
         text = "You didnt find any stones.",
         type = "success",
         queue = "lmao",
         timeout = 7000,
         layout = "Centerleft"
      })
  end
end)


RegisterServerEvent('mining:rocks:find')
AddEventHandler('mining:rocks:find', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local Rocks_chance = math.random(100)
  if Rocks_chance > 40 then -- The chance of the rocks find, you can change to higher number for hard chance or reduce the number.
      math.randomseed(GetGameTimer())
      xPlayer.addInventoryItem(Random_rocks(), Rocks_amount())
      TriggerClientEvent("pNotify:SendNotification", source, {
         text = "You found some rocks.",
         type = "success",
         queue = "lmao",
         timeout = 7000,
         layout = "Centerleft"
      })
  else
      TriggerClientEvent("pNotify:SendNotification", source, {
         text = "You didnt find any rocks.",
         type = "success",
         queue = "lmao",
         timeout = 7000,
         layout = "Centerleft"
      })
  end
end)


RegisterServerEvent('mining:stones:smelt')
AddEventHandler('mining:stones:smelt', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local GraniteQuantity = xPlayer.getInventoryItem('Granite').count
    local LimestoneQuantity = xPlayer.getInventoryItem('Limestone').count
    local MarbleQuantity = xPlayer.getInventoryItem('Marble').count
    local OnyxQuantity = xPlayer.getInventoryItem('Onyx').count
    -- 15 of stones types are needed for smelt, you can change the numbers of each stone to lesser or higher.
    if GraniteQuantity >= 15 and LimestoneQuantity >= 15 and MarbleQuantity >= 15 and OnyxQuantity >= 15 then
        for k,v in pairs(Stones_remove_table) do
            xPlayer.removeInventoryItem(v.Stone, v.Amount)
        end
        xPlayer.addInventoryItem('Smelted_stones_pack', 1)
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "You smelted your stones, and got a pack of your smelted stones.",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    elseif GraniteQuantity and LimestoneQuantity and MarbleQuantity and OnyxQuantity then
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "<b style=color:#ff0000>error: <b style=color:#e3a010> you dont have enough stones, you have: <b style=color:#9ef507> Granite "  .. GraniteQuantity .." <b style=color:#edf507> -> Limestone -> " .. LimestoneQuantity .. " <b style=color:#1388e8> Marble ->  " .. MarbleQuantity   ..   "  <b style=color:#e84c13>  Onyx -> " .. OnyxQuantity .. "</b>",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "15 of stones types are needed for smelt.",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    end
end)

RegisterServerEvent('mining:rocks:smelt')
AddEventHandler('mining:rocks:smelt', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local EmeraldQuantity = xPlayer.getInventoryItem('Emerald').count
    local JadeiteQuantity = xPlayer.getInventoryItem('Jadeite').count
    local DiamondQuantity = xPlayer.getInventoryItem('Diamond').count
    local TaaffeiteQuantity = xPlayer.getInventoryItem('Taaffeite').count
    local GrandidieriteQuantity = xPlayer.getInventoryItem('Grandidierite').count
    local SerendibiteQuantity = xPlayer.getInventoryItem('Serendibite').count
    local MusgraviteQuantity = xPlayer.getInventoryItem('Musgravite').count
    -- 15 of rocks types are needed for smelt, you can change the numbers of each rock to lesser or higher.
    if EmeraldQuantity >= 15 and JadeiteQuantity >= 15 and DiamondQuantity >= 15 and TaaffeiteQuantity >= 15 and GrandidieriteQuantity >= 15 and SerendibiteQuantity >= 15 and MusgraviteQuantity >= 15 then
        for k,v in pairs(Rocks_remove_table) do
            xPlayer.removeInventoryItem(v.Rock, v.Amount)
        end
        xPlayer.addInventoryItem('Smelted_rocks_pack', 1)
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "You smelted your rocks, and got a pack of your smelted rocks.",
           type = "success",
           queue = "lmao",
           timeout = 10000,
           layout = "Centerleft"
        })
    elseif EmeraldQuantity and JadeiteQuantity and DiamondQuantity and TaaffeiteQuantity and GrandidieriteQuantity and SerendibiteQuantity and MusgraviteQuantity then
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "<b style=color:#ff0000>error: <b style=color:#e3a010> you dont have enough rocks, you have: <b style=color:#9ef507> Emerald "  .. EmeraldQuantity .." <b style=color:#edf507> -> Jadeite -> " .. JadeiteQuantity .. " <b style=color:#1388e8> Diamond ->  " .. DiamondQuantity   ..   "  <b style=color:#e84c13>  Taaffeite -> " .. TaaffeiteQuantity .. "  <b style=color:#0D98BA>  Grandidierite -> " .. GrandidieriteQuantity .. "  <b style=color:#8fa3a1>  Serendibite -> " .. SerendibiteQuantity .. "  <b style=color:#75816b>  Musgravite -> " .. MusgraviteQuantity .. "</b>",
           type = "success",
           queue = "lmao",
           timeout = 10000,
           layout = "Centerleft"
        })
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "15 of rocks types are needed for smelt.",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    end
end)

RegisterServerEvent('mining:stones:sell')
AddEventHandler('mining:stones:sell', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local Stones_pack = xPlayer.getInventoryItem('Smelted_stones_pack').count
    local Stones_payment = math.random (7000, 8900) -- Change the amount of the random payment to your choice.
    if Stones_pack >= 1 then -- The stone pack for sell, change the number to lesser or higher.
        xPlayer.removeInventoryItem('Smelted_stones_pack', 1)
        xPlayer.addMoney(Stones_payment)
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "<b style=color:#d1d1d1> You sold your stone pack for <b style=color:#1588d4>"  .. Stones_payment .. "$ <b style=color:#d1d1d1> keep working</b>",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    elseif Stones_pack then
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "<b style=color:#ff0000>error: <b style=color:#e3a010> you dont have a stone pack, you have: <b style=color:#9ef507>  "  .. Stones_pack .. " <b style=color:#e3a010> stone pack </b>",
           type = "success",
           queue = "lmao",
           timeout = 10000,
           layout = "Centerleft"
        })
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "1 stone pack is needed for sell.",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    end
end)

RegisterServerEvent('mining:rocks:sell')
AddEventHandler('mining:rocks:sell', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local Rocks_pack = xPlayer.getInventoryItem('Smelted_rocks_pack').count
    local Rocks_payment = math.random (8000, 9800) -- Change the amount of the random payment to your choice.
    if Rocks_pack >= 1 then -- The rock pack for sell, change the number to lesser or higher.
        xPlayer.removeInventoryItem('Smelted_rocks_pack', 1)
        xPlayer.addMoney(Rocks_payment)
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "<b style=color:#d1d1d1> You sold your rock pack for <b style=color:#1588d4>"  .. Rocks_payment .. "$ <b style=color:#d1d1d1> keep working</b>",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    elseif Rocks_pack then
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "<b style=color:#ff0000>error: <b style=color:#e3a010> you dont have a rock pack, you have: <b style=color:#9ef507>  "  .. Rocks_pack .. " <b style=color:#e3a010> rock pack </b>",
           type = "success",
           queue = "lmao",
           timeout = 10000,
           layout = "Centerleft"
        })
        TriggerClientEvent("pNotify:SendNotification", source, {
           text = "1 rock pack is needed for sell.",
           type = "success",
           queue = "lmao",
           timeout = 7000,
           layout = "Centerleft"
        })
    end
end)