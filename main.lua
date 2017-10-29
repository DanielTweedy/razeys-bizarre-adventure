--[[
Razey's Bizzare Adventure

Nick Teves, Hanwei Li, Daniel Tweedy

Turn based top down strategy game where player controls units and fights enemy units. Game follows alchemist Razey, a young man made old by drinking bad potions. Razey travels the world with a motely group of friends and sell swords to find ingrediants for the ultimate potion.
]]--
require("protoMap")
require("cursor")
require("player")
require("ui")

local CURSOR_MOVE = 1
local UNITS_MOVE = 2
local AI_TURN = 3

gameState = CURSOR_MOVE -- game state defaults to moving cursor around

function love.load()
    love.window.setTitle("Razey's Bizarre Adventure")
end

function love.draw()
    map.draw()
    cursor.draw()
	ui.drawTileInfo(map.getTile(cursor.y, cursor.x))
	if(player.selectedUnit ~= nil) then
		ui.drawUnitInfo(player.selectedUnit)
	elseif(map.getUnit(cursor.y, cursor.x) ~= nil) then
		ui.drawUnitInfo(map.getUnit(cursor.y, cursor.x))
	end
end

function love.update(dt)

end

function love.keypressed(key)
    if gameState ~= AI_TURN then
        if key == "up" then
            cursor.move(0, -1)
        elseif key == "down" then
            cursor.move(0,1)
        elseif key == "left" then
            cursor.move(-1,0)
        elseif key == "right" then
            cursor.move(1, 0)
        elseif key == "return" or key == "kpenter" then
            tileSelect()
        end
    end
end

function tileSelect()
    if(map.getUnit(cursor.y,cursor.x) ~= nil and gameState == CURSOR_MOVE) then
        gameState = UNITS_MOVE
        player.selectUnit(cursor.y, cursor.x)
    elseif gameState == UNITS_MOVE then
      if (map.getUnit(cursor.y,cursor.x) ~= nil) then
        if (map.getUnit(cursor.y, cursor.x).player == true) then
            player.selectUnit(cursor.y, cursor.x)
        else 
        gameState = CURSOR_MOVE
        player.attackUnit(cursor.y, cursor.x)
          end
      else 
        gameState = CURSOR_MOVE
        player.moveUnit(cursor.y, cursor.x)
        end
    end
end
