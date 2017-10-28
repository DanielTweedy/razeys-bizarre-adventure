map = {}
require("tile")
require("unit")
map.x = 10
map.y = 10



map.tiles = {{field, field, field, field, field, field, field, mountain, mountain, mountain} ,
             {field, field, field, forest, field, field, mountain, field, field, field} ,
             {field, field, field, field, field, mountain, field, field, field, field} ,
             {field, field, forest, field, forest, field, field, field, field, field} ,
             {field, field, field, field, field, field, field, field, field, field} ,
             {field, field, field, field, field, field, field, field, field, field} ,
             {field, field, hill, field, field, mountain, field, field, field, field} ,
             {field, field, field, field, field, field, mountain, field, field, field} ,
             {field, field, field, hill, field, field, field, mountain, field, field} ,
             {field, field, field, field, field, field, field, field, mountain, mountain}}



map.Units = {}
map.Units[2][4] = razey
map.Units[5][3] = cavalryman
map.Units[6][1] = archer
map.Units[6][3] = swordsman
map.units[6][4] = monster
map.units[5][5] = monster






function map.getTile(yVal, xVal) 
  return map.tile[yVal][xVal]
end
function map.getUnit(yVal, xVal)
  return map.tile[yVal][xVal]
end
function map.setUnit(yVal, xVal, unit)
  map.Units[yVal][xVal]
end
function map.setTile(yVal, xVal, tile)
  map.Tiles[yVal][xVal]
end
function moveUnit(dy, dx, unit)
  
  map.Units[unit.y][unit.x] = {}
  map.Units[unit.y+dy][unit.x+dx] = unit
  unit.move(yNew - yOld, xNew - xOld)
  
end

