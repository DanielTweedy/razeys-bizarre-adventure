require("map")
require("unit")

player = {}
player.units = {}
player.selectedUnit = {}

function player.new(o) 
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function player.selectUnit(x, y) 
    if map.Units[x][y] == nil then
      --insert menu functionality here.
    end
      else
        player.selectedUnit = map.Units[x][y]
      end
end
  
function player.moveUnit(x, y) 
    if player.selectedUnit ~= nil then
        x = x-selectedUnit.x
        y = y-selectedUnit.y
        unit.move(x, y)
    end
    else 
        self.selectUnit(x, y)
    end
end

function player.attackUnit(x, y)
    if map.getUnit(x, y) ~= nil then
    
  end
end