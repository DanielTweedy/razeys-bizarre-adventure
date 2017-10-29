ui = {}
function ui.drawTileInfo(tile)
	love.graphics.setNewFont(15)
	love.graphics.print("Defense Bonus: " .. tostring(tile.defenseBonus), 32, 400)
	love.graphics.print("Avoid Bonus: " .. tostring(tile.avoidBonus), 32, 432)
	love.graphics.print("Stamina Cost: " .. tostring(tile.staminaCost), 32, 464)
end

function ui.drawUnitInfo(unit)
	love.graphics.setNewFont(15)
	love.graphics.print("Stamina: " .. tostring(unit.stamina), 200, 400)
	love.graphics.print("Health: " .. tostring(unit.health), 200, 432)
	love.graphics.print("Strength: " .. tostring(unit.strength), 200, 464)
	love.graphics.print("Defense: " .. tostring(unit.defense), 200, 496)
	love.graphics.print("Avoid: " .. tostring(unit.avoid), 200, 528)
end