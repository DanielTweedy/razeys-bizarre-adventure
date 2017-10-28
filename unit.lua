require("controller")
require("player")
require("ai")

unit = {}
unit.x = 0 -- board units
unit.y = 0 -- board units

unit.health = 20
unit.strength = 7
unit.defense = 2

-- Some units can not attack when too close
unit.minRange = 1 -- number of spaces away a unit can attack
unit.maxRange = 2 -- maximum reach of unit's weapon

unit.stamina = 4
unit.contoller = player

function unit.move(dx, dy)
    local totalDistance = math.abs(dx) + math.abs(dy)
    if(totalDistance <= stamina) then
        unit.x = unit.x + dx
        unit.y = unit.y + dy
    end
end

function unit.attack(dx, dy)
    if(stamina > 0) then
        local unitFighting = map[unit.y + dy][unit.x + dx].unit
        unit.fight(unitFighting)
    end
end

function unit.fight(enemy)
    -- TODO
end
