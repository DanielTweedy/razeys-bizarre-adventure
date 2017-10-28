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

function player.selectUnit(y, x) 
    if map.getUnit(t, x) == nil then
      --insert menu functionality here.
    end
      else
        player.selectedUnit = map.getUnit(y, x)
      end
end
  
function player.moveUnit(y, x) 
    if player.selectedUnit ~= nil then
        x = x-selectedUnit.x
        y = y-selectedUnit.y
        map.moveUnit(y, x, selectedUnit)
    end
    else 
        self.selectUnit(y, x)
    end
end

function player.attackUnit(y, x)
    if math.abs(dx) + math.abs(dy) >= selectedUnit.minRange and math.abs(dx) + math.abs(dy) <= maxRange then
      map.getUnit(y, x).health = map.getUnit(y, x).health - selectedUnit.strength + map.getUnit(y, x).defense
      if map.getUnit(y, x).stamina >= 1 then
        selectedUnit.health = selectedUnit.health - map.getUnit(y, x) + selectedUnit.defense
      end
  end
end