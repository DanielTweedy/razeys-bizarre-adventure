--require("player")
--require("protoMap")

local abs = math.abs
ASSET_PATH = "Assets/characters/"

razey = {}
razey.x = 2 -- board razeys
razey.y = 4 -- board razeys

razey.health = 20 -- base health points
razey.strength = 7 -- base damage  done
razey.defense = 2 -- damage reduction
razey.avoid = 15 -- how easy to hit razey

-- Some razeys can not attack when too close
razey.minRange = 1 -- number of spaces away a razey can attack
razey.maxRange = 2 -- maximum reach of razey's weapon

razey.stamina = 4
razey.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")

cavalryman = {}
cavalryman.x = 5 -- board razeys
cavalryman.y = 3 -- board razeys

cavalryman.health = 20 -- base health points
cavalryman.strength = 7 -- base damage  done
cavalryman.defense = 2 -- damage reduction
cavalryman.avoid = 15 -- how easy to hit razey

-- Some razeys can not attack when too close
cavalryman.minRange = 1 -- number of spaces away a razey can attack
cavalryman.maxRange = 2 -- maximum reach of razey's weapon

cavalryman.stamina = 4
cavalryman.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")

archer = {}
archer.x = 1 -- board razeys
archer.y = 6 -- board razeys

archer.health = 20 -- base health points
archer.strength = 7 -- base damage  done
archer.defense = 2 -- damage reduction
archer.avoid = 15 -- how easy to hit razey

-- Some razeys can not attack when too close
archer.minRange = 1 -- number of spaces away a razey can attack
archer.maxRange = 2 -- maximum reach of razey's weapon

archer.stamina = 4
archer.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")

swordsman = {}
swordsman.x = 3 -- board razeys
swordsman.y = 6 -- board razeys

swordsman.health = 20 -- base health points
swordsman.strength = 7 -- base damage  done
swordsman.defense = 2 -- damage reduction
swordsman.avoid = 15 -- how easy to hit razey

-- Some units can not attack when too close
swordsman.minRange = 1 -- number of spaces away archer can attack
swordsman.maxRange = 2 -- maximum reach of weapon

swordsman.stamina = 4
swordsman.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")


m1 = {}
m1.x = 4 -- board units
m1.y = 6 -- board units

m1.health = 20 -- base health points
m1.strength = 7 -- base damage  done
m1.defense = 2 -- damage reduction
m1.avoid = 15 -- how easy to hit 

-- Some units can not attack when too close
m1.minRange = 1 -- number of spaces away m1 can attack
m1.maxRange = 2 -- maximum reach of weapon
m1.stamina = 4
m1.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")

m2 = {}
m2.x = 5 -- board units
m2.y = 5 -- board units

m2.health = 20 -- base health points
m2.strength = 7 -- base damage  done
m2.defense = 2 -- damage reduction
m2.avoid = 15 -- how easy to hit 

-- Some units can not attack when too close
m2.minRange = 1 -- number of spaces away m2 can attack
m2.maxRange = 2 -- maximum reach of weapon
m2.stamina = 4
m2.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")


leader = {}
leader.x = 6 -- board units
leader.y = 5 -- board units

leader.health = 20 -- base health points
leader.strength = 7 -- base damage  done
leader.defense = 2 -- damage reduction
leader.avoid = 15 -- how easy to hit 

-- Some units can not attack when too close
leader.minRange = 1 -- number of spaces away m2 can attack
leader.maxRange = 2 -- maximum reach of weapon
leader.stamina = 4
leader.sprite = love.graphics.newImage(ASSET_PATH .. "sprite_Razey0.png")


unit = {}

function unit.move(character, dx, dy)
    local totalDistance = abs(dx) + abs(dy)
    if(totalDistance <= stamina) then
        character.x = character.x + dx
        character.y = character.y + dy
        character.stamina = character.stamina - totalDistance
    end
end

function unit.draw(character)
    local TILE_SIZE = 32
    love.graphics.draw(character.sprite, TILE_SIZE * character.y, TILE_SIZE * character.x)
end
