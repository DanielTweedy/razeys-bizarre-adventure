map = {}
require("tile")
require("unit")
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
map.Units[razey.y][razey.x] = razey
map.Units[calvaryman.y][calvaryman.x] = cavalryman
map.Units[archer.y][archer.x] = archer
map.Units[swordsman.y][swordsman.x] = swordsman
map.Units[m1.y][m1.x] m1
map.Units[m2.y][m2.x] = m2
map.Units[leader.y][leader.x] = leader

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
