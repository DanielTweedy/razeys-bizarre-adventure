require("tile")
require("unit")

map = {}
map.x = 10
map.y = 10



map.Tiles = {{field, field, field, field, field, field, field, field, mountain, mountain} ,
             {field, field, field, forest, field, field, field, mountain, cave, cave} ,
             {field, field, field, field, field, field, mountain, cave, cave, cave} ,
             {field, field, forest, field, forest, mountain, cave, cave, cave, cave} ,
             {field, field, field, field, field, cave, cave, cave, cave, cave} ,
             {field, field, field, field, field, cave, cave, cave, cave, cave} ,
             {field, field, hill, field, field, mountain, cave, cave, cave, cave} ,
             {field, field, field, field, field, field, mountain, cave, cave, cave} ,
             {field, field, field, hill, field, field, field, mountain, cave, cave} ,
             {field, field, field, field, field, field, field, field, mountain, mountain}}

map.Units = {}

map.Units[1] = razey
map.Units[2] = cavalryman
map.Units[3] = archer
map.Units[4] = swordsman
map.Units[5] = m1
map.Units[6] = m2
map.Units[7] = leader

function map.getTile(yVal, xVal) 
  return map.tile[yVal][xVal]
end

function map.getUnit(yVal, xVal)
  return map.Units[yVal][xVal]
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
    for i=1, #map.Units do
        unit.draw(map.Units[i])
    end
end
