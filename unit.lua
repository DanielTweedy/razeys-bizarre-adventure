--require("player")
--require("protoMap")

local abs = math.abs

razey = {}
razey.x = 0 -- board razeys
razey.y = 0 -- board razeys

razey.health = 20 -- base health points
razey.strength = 7 -- base damage  done
razey.defense = 2 -- damage reduction
razey.avoid = 15 -- how easy to hit razey

-- Some razeys can not attack when too close
razey.minRange = 1 -- number of spaces away a razey can attack
razey.maxRange = 2 -- maximum reach of razey's weapon

razey.stamina = 4
--razey.contoller = player

unit = {}

function unit.move(character, dx, dy)
    local totalDistance = abs(dx) + abs(dy)
    if(totalDistance <= stamina) then
        character.x = character.x + dx
        character.y = character.y + dy
        character.stamina = character.stamina - totalDistance
    end
end
