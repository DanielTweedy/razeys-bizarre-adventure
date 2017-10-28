--[[
Razey's Bizzare Adventure

Nick Teves, Hanwei Li, Daniel Tweedy

Turn based top down strategy game where player controls units and fights enemy units. Game follows alchemist Razey, a young man made old by drinking bad potions. Razey travels the world with a motely group of friends and sell swords to find ingrediants for the ultimate potion.
]]--
require("protoMap")
require("cursor")

gameStateCursor = 1
gameStateUnit = 2
gameStateAI = 3

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
    if key == "up" then
        cursor.move(0, -1)
    elseif key == "down" then
        cursor.move(0,1)
    elseif key == "left" then
        cursor.move(-1,0)
    elseif key == "right" then
        cursor.move(1, 0)
    end
end
