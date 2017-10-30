require("protoMap")
require("unit")

enemy = {}
enemy.units = {}
enemy.selectedUnit = nil
local TILE_SIZE = 32 -- 32x32 tiles
local TIME_WAIT = 1
function enemy.new(o) 
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function enemy.ai()
	for i = 1, #map.Units do
		if(map.Units[i].player == false) then
			if(unit~=nil) then
				enemy.selectUnit(map.Units[i])
				enemy.findClosest()
			end
		end
	end
end
function enemy.selectUnit(u) 
    if u == nil then
      --insert menu functionality here.
    else
        enemy.selectedUnit = u
		sound = love.audio.newSource(SE_PATH .. "true.wav", "static")
		sound:play()		
    end
end
  
function enemy.moveUnit(y, x) 
    if enemy.selectedUnit ~= nil then
		if enemy.selectedUnit.stamina == 0 then
			enemy.selectedUnit = nil
			sound = love.audio.newSource(SE_PATH .. "return.wav", "static")
			sound:play()
		else
			x = x-enemy.selectedUnit.x
			y = y-enemy.selectedUnit.y
            print(x .. " " .. y)
            print(enemy.selectedUnit == nil)
			map.moveUnit(y, x, enemy.selectedUnit)
            enemy.selectedUnit = nil
		end
    end
end

function enemy.attackUnit(y, x)
    local attacker = enemy.selectedUnit
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
function enemy.findClosest()
	local unit = enemy.selectedUnit
	if unit.stamina == 0 then
		return
	end
	closest = nil
	minimum = 100
	for u=1, #map.Units do
		if(unit~=map.Units[u] and map.Units[u].player==true and (math.abs(unit.x - map.Units[u].x)+math.abs(unit.y-map.Units[u].y))<=minimum) then
			minimum = math.abs(unit.x - map.Units[u].x)+math.abs(unit.y-map.Units[u].y)
			closest = map.Units[u]
		end
	end
	targetX = 0
	targetY = 0
	if(unit.x < closest.x) then
		if(unit.x + unit.stamina >= closest.x) then
			if(unit.y ~= closest.y) then
				enemy.moveUnit(unit.y, closest.x)
			else
				enemy.moveUnit(unit.y, closest.x - 1)
			end
		else
			enemy.moveUnit(unit.y, unit.x+unit.stamina)
		end
	else
		if(unit.x - unit.stamina <= closest.x) then
			if(unit.y ~= closest.y) then
				enemy.moveUnit(unit.y, closest.x)
			else
				enemy.moveUnit(unit.y, closest.x + 1)
			end
		else
			enemy.moveUnit(unit.y, unit.x-unit.stamina)
		end
	end
	if(unit.y < closest.y) then
		if(unit.y + unit.stamina >= closest.y) then
			if(unit.x ~= closest.x) then
				enemy.moveUnit(closest.y, unit.x)
			else
				enemy.moveUnit(closest.y - 1, unit.x)
			end
		else
			enemy.moveUnit(closest.y+unit.stamina, unit.x)
		end
	else
		if(unit.y - unit.stamina <= closest.y) then
			if(unit.x ~= closest.x) then
				enemy.moveUnit(closest.y, unit.x)
			else
				enemy.moveUnit(closest.y + 1, unit.x)
			end
		else
			enemy.moveUnit(closest.y-unit.stamina, unit.x)
		end
	end
	enemy.attackUnit(closest.y,closest.x)
end			

function enemy.drawRange()
	for y=0, enemy.selectedUnit.stamina do
		for x=0, enemy.selectedUnit.stamina-y do
			love.graphics.rectangle("line",(enemy.selectedUnit.x+x)*TILE_SIZE,(enemy.selectedUnit.y+y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
			love.graphics.rectangle("line",(enemy.selectedUnit.x+x)*TILE_SIZE,(enemy.selectedUnit.y-y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
			love.graphics.rectangle("line",(enemy.selectedUnit.x-x)*TILE_SIZE,(enemy.selectedUnit.y+y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
			love.graphics.rectangle("line",(enemy.selectedUnit.x-x)*TILE_SIZE,(enemy.selectedUnit.y-y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
		end
	end
end
