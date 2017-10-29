require("protoMap")
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
<<<<<<< HEAD
    if map.getUnit(y, x) == nil then
      --insert menu functionality here.
      else
        player.selectedUnit = map.getUnit(y, x)
    end
end
  
function player.moveUnit(y, x) 
    if player.selectedUnit ~= nil then
        x = x-selectedUnit.x
        y = y-selectedUnit.y
        map.moveUnit(y, x, selectedUnit)
    else 
        self.selectUnit(y, x)
    end
end

function player.attackUnit(y, x)
  if map.getUnit(y, x) ~= nil and selectedUnit ~= nil then
    local abs = math.abs(dx) + math.abs(dy)
    
      if abs >= selectedUnit.minRange and abs <= maxRange and selectedUnit.stamina >= 1 then
      selectedUnit.stamina = selectedUnit.stamina-1
        if math.random(100) < 100 - map.getUnit(y, x).avoid - map.getTile(y, x).avoidBonus then
        map.getUnit(y, x).health = map.getUnit(y, x).health - selectedUnit.strength + map.getUnit(y, x).defense + map.getTile(x, y).defenseBonus
            if map.getUnit(y, x).stamina >= 1 and math.random(100) < 100 - selectedUnit.avoid - map.getTile(selectedUnit.y, selectedUnit.x).avoidBonus then
            selectedUnit.health = selectedUnit.health - map.getUnit(y, x) + selectedUnit.defense + map.getTile(selectedUnit.y, selectedUnit.x).avoidBonus
            end
        end
      end
  end 

end
