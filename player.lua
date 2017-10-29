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
  if map.getUnit(y, x) ~= nil and player.selectedUnit ~= nil then
    dx = x - player.selectedUnit.x
    dy = y - player.selectedUnit.y
    local abs = math.abs(dx) + math.abs(dy)
    
      if abs >= player.selectedUnit.minRange and abs <= player.selectedUnit.maxRange and player.selectedUnit.stamina >= 1 then
      player.selectedUnit.stamina = player.selectedUnit.stamina-1
        if math.random(100) < 100 - map.getUnit(y, x).avoid - map.getTile(y, x).avoidBonus then
       temp = map.getUnit(y, x).health - player.selectedUnit.strength + map.getUnit(y, x).defense + map.getTile(x, y).defenseBonus
       if (temp < 0) then
          else
          map.getUnit(y, x).health = temp;
      end
            if map.getUnit(y, x).stamina >= 1 and math.random(100) < 100 - player.selectedUnit.avoid - map.getTile(player.selectedUnit.y, player.selectedUnit.x).avoidBonus then
            temp = player.selectedUnit.health - map.getUnit(y, x).strength + player.selectedUnit.defense + map.getTile(player.selectedUnit.y, player.selectedUnit.x).avoidBonus
               if (temp < 0) then
                else
                player.selectedUnit.health = temp;
              end
            end
        end
      end
  end 
end
function player.drawRange()
	for y=0, player.selectedUnit.stamina do
		for x=0, player.selectedUnit.stamina-y do
			love.graphics.rectangle("line",(player.selectedUnit.x+x)*TILE_SIZE,(player.selectedUnit.y+y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
			love.graphics.rectangle("line",(player.selectedUnit.x+x)*TILE_SIZE,(player.selectedUnit.y-y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
			love.graphics.rectangle("line",(player.selectedUnit.x-x)*TILE_SIZE,(player.selectedUnit.y+y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
			love.graphics.rectangle("line",(player.selectedUnit.x-x)*TILE_SIZE,(player.selectedUnit.y-y)*TILE_SIZE,TILE_SIZE,TILE_SIZE)
		end
	end
end