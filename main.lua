--[[
Razey's Bizzare Adventure

Nick Teves, Hanwei Li, Daniel Tweedy

Turn based top down strategy game where player controls units and fights enemy units. Game follows alchemist Razey, a young man made old by drinking bad potions. Razey travels the world with a motely group of friends and sell swords to find ingrediants for the ultimate potion.
]]--
require("protoMap")
require("cursor")

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
    if(gameState == MOVE_CURSOR) then
        local unit = getUnit(cursor.y, cursor.x)
        if unit ~= nil then
            print(unit.x)
        end
    end
end
