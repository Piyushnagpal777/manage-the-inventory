--[[
*****************************************************************************************
*
*
*  This script is code stub for CodeChef problem code INV_LUA
*  under contest PYLT20TS in Task 0 of Nirikshak Bot (NB) Theme (eYRC 2020-21).
*
*  Filename:            INV_LUA.lua
*  Created:             07/10/2020
*  Last Modified:       07/10/2020
*  Author:              e-Yantra Team
*
*****************************************************************************************
]]--

--[[
1
3
Servo 3
Drone 6
Board 7
3
ADD LEDs 4
DELETE Board 4
DELETE Servo 4
]]
 
-- manageInventory function to add, update / delete items to / from the Inventory
function manageInventory()
    -- reading total Items N
    N = tonumber(io.read())
    inv = {}
    values = {}
    keys = {}
    for i = 1, N do
      s = io.read()
      for substring in s:gmatch("%S+") do
        table.insert(inv, substring)
      end
    end

    for i = 1, #inv do
      if(i%2 == 0) then
        table.insert(keys, tonumber(inv[i]))
      else
        table.insert(values, inv[i])
      end
      i = i + 1
    end

    M = tonumber(io.read())
    inv = {}
    operator = {}
    values1 = {}
    keys1 = {}
    for i = 1, M do
      s = io.read()
      for substring in s:gmatch("%S+") do
        table.insert(inv, substring)
      end
    end

    j = 0

    for i = 1, M do
      table.insert(operator, inv[i + j]) -- 1 + 0, 2+2
      j = j + 1
      table.insert(values1, inv[i + j]) -- 1+1, 2+3
      j = j + 1
      table.insert(keys1, inv[i + j]) -- 1+2, 2+4
      i = i + 1
    end
    flag = 0
    for i = 1, M do
      if(operator[i] == "ADD") then -- operator = ADD
        for j = 1, N do -- 1, 2   
          if(values1[i] == values[j]) then --LEDs 
            keys[j] = keys[j] + keys1[i]
            print(string.format("ADDED Item %s", tostring(values1[i])))
            flag = flag + 1
          end
        end
        if(flag ~= 1) then
          table.insert(keys, tonumber(keys1[i]))
          table.insert(values, values1[i])
          print(string.format("ADDED Item %s", tostring(values1[i])))
        end
      elseif(operator[i] == "DELETE") then
        for j = 0, N do
          if(values1[i] == values[j]) then
            if(tonumber(keys[j]) >= tonumber(keys1[i])) then
              keys[j] = keys[j] - keys1[i]
              print(string.format("DELETED Item %s", tostring(values1[i])))
            else
              print(string.format("Item %s could not be DELETED", tostring(values1[i])))
            end
          end
        end
      end
      i = i + 1
    end
    sum = 0
    for i=1, #keys do
      sum = sum + tonumber(keys[i])
    end
    print(math.floor(sum))

end
 
-- for each case, call the manageInventory function to add, update / delete items to / from the Inventory
tc = tonumber(io.read())
i = 0
while i < tc do
    manageInventory()
    i = i + 1
end
 
