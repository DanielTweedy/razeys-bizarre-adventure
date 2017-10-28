 
-- Base abstract class for tiles
tile = {}
tile.avoidBonus = {} -- bonus to not being hit
tile.defenseBonus = {} -- bonus against attack damage
tile.staminaCost = {} -- cost  of moving through tiles

local TILE_SIZE = 32 -- 32x32 tiles

-- Different tile types
field = {}
forest = {}
hill = {}
cave = {}
mountain = {}

-- Loads all the different tile types
--[[function tile.load()
    field.load()
    forest.load()
    hill.load()
    cave.load()
    mountain.load()
end]]--

--function field.load()
    field.defenseBonus = 0
    field.avoidBonus = 0
    field.staminaCost = 0
--end

--function forest.load()
    forest.defenseBonus = 0
    forest.avoidBonus = 5
    forest.staminaCost = 1
--end

--function hill.load()
    hill.defenseBonus = 1
    hill.avoidBonus = 0
    hill.staminaCost = 1
--end

--function cave.load()
    cave.defenseBonus = 0
    cave.avoidBonus = 0
    cave.staminaCost = 0
--end

--function mountain.load()
    mountain.defenseBonus = 2
    mountain.avoidBonus = 10
    mountain.staminaCost = 10
--end
