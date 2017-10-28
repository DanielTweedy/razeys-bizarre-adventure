map = {}
require("tile")
require("unit")
map.x = 10
map.y = 10



map.Tiles = {{field, field, field, field, field, field, field, mountain, mountain, mountain} ,
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
--[[map.Units[2][4] = razey
map.Units[5][3] = cavalryman
map.Units[6][1] = archer
map.Units[6][3] = swordsman
map.units[6][4] = monster
map.units[5][5] = monster
]]--
function map.getTile(yVal, xVal) 
  return map.tile[yVal][xVal]
end

function map.getUnit(yVal, xVal)
  return map.tile[yVal][xVal]
end

function map.setUnit(yVal, xVal, cunit)
  map.Units[yVal][xVal] = cunit
end

function map.setTile(yVal, xVal, tile)
  map.Tiles[yVal][xVal] = tile
end

function map.moveUnit(dy, dx, cunit)
  
  map.Units[cunit.y][cunit.x] = {}
  map.Units[cunit.y+dy][cunit.x+dx] = cunit
  unit.move(yNew - yOld, xNew - xOld, cunit)
  
end

function map.draw()
    for y=1, #map.Tiles do
        for x=1, #map.Tiles[y] do
            tile.draw(map.Tiles[y][x], y, x)
        end
    end
end
