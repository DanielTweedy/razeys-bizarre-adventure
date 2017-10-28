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






function map.getTile(xVal, yVal) 
  return map.tile[xVal][yVal]
end
function map.getUnit(xVal, yVal)
  return map.tile[xVal][yVal]
end
function map.setUnit(xVal, yVal, unit)
  map.Units[xVal][yVal]
end
function map.setTile(xVal, Yval, tile)
  map.Tiles[xVal][Yval]
end
function moveUnit(xOld, yOld, xNew, yNew, unit)
  map.Units[xOld][yOld] = {}
  map.Units[xNew][yNew] = unit
end

