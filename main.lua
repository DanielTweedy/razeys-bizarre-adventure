--[[
Razey's Bizzare Adventure

Nick Teves, Hanwei Li, Daniel Tweedy

Turn based top down strategy game where player controls units and fights enemy units. Game follows alchemist Razey, a young man made old by drinking bad potions. Razey travels the world with a motely group of friends and sell swords to find ingrediants for the ultimate potion.
]]--
require("tile")

function love.load()
    love.window.setTitle("Razey's Bizarre Adventure")
    print ("field: " .. field.avoidBonus .. " " .. field.defenseBonus)
    print ("forest: " .. forest.avoidBonus .. " " .. forest.defenseBonus)
    print ("hill: " .. hill.avoidBonus .. " " .. hill.defenseBonus)
    print ("cave: " .. cave.avoidBonus .. " " .. cave.defenseBonus)
    print ("mountain: " .. mountain.avoidBonus .. " " .. mountain.defenseBonus)
end

function  love.draw()

end

function love.update(dt)

end
