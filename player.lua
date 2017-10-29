require("protoMap")
require("unit")

player = {}
player.units = {}
player.selectedUnit = nil
local TILE_SIZE = 32 -- 32x32 tiles
function player.new(o) 
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function player.selectUnit(y, x) 
    if map.getUnit(y, x) == nil then
      --insert menu functionality here.
    else
        player.selectedUnit = map.getUnit(y, x)
		sound = love.audio.newSource(SE_PATH .. "true.wav", "static")
		sound:play()		
    end
end
  
function player.moveUnit(y, x) 
    if player.selectedUnit ~= nil then
		if player.selectedUnit.stamina == 0 then
			player.selectedUnit = nil
			sound = love.audio.newSource(SE_PATH .. "return.wav", "static")
			sound:play()
		else
			x = x-player.selectedUnit.x
			y = y-player.selectedUnit.y
			map.moveUnit(y, x, player.selectedUnit)
		end
    end
end

function player.attackUnit(y, x)
    local attacker = player.selectedUnit
    local defenderTile = map.getTile(y,x)
    local defender = map.getUnit(y,x)
    
  if defender ~= nil and attacker ~= nil then
    local dx = x - attacker.x
    local dy = y - attacker.y
    local dist = math.abs(dx) + math.abs(dy)
    
    if unit.inRange(attacker, dist) and unit.canFight(attacker) then
        attacker.stamina = attacker.stamina-1
        if math.random(100) < unit.hitChance(defender.avoid,defenderTile.avoidBonus) then
            local dmg = attacker.strength - defender.defense - defenderTile.defenseBonus
            if (dmg > 0) then defender.health = defender.health - dmg; end
        if unit.canFight(defender) and math.random(100) < unit.hitChance(attacker.avoid,map.getTile(attacker.y, attacker.x).avoidBonus) then
            temp = attacker.health - defender.strength + attacker.defense + map.getTile(attacker.y, attacker.x).avoidBonus
               if (temp < 0) then
                else
                attacker.health = temp;
              end
            end
        end
      end
  end 
end

function player.drawRange()
	for y=0, player.selectedUnit.stamina do
		for x=0, player.selectedUnit.stamina-y do
            if (player.selectedUnit.x+x < 11 and player.selectedUnit.y+y < 11) then
			love.graphics.rectangle("line",(player.selectedUnit.x+x)*TILE_SIZE,(player.selectedUnit.y+y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
            end if (player.selectedUnit.x+x < 11 and player.selectedUnit.y-y >= 1) then
			love.graphics.rectangle("line",(player.selectedUnit.x+x)*TILE_SIZE,(player.selectedUnit.y-y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
            end if (player.selectedUnit.x-x >= 1 and player.selectedUnit.y+y < 11) then
			love.graphics.rectangle("line",(player.selectedUnit.x-x)*TILE_SIZE,(player.selectedUnit.y+y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
            end if (player.selectedUnit.x-x >= 1 and player.selectedUnit.y-y >= 1) then
			love.graphics.rectangle("line",(player.selectedUnit.x-x)*TILE_SIZE,(player.selectedUnit.y-y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
            end
		end
	end
end
