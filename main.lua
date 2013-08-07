require("lua/gameplay/base")
require("lua/hud/base")
require("lua/gui/base")

function love.load()
	love.graphics.setBackgroundColor(255, 255, 255)

	gameplay.load()
	hud.load()
	interface.load()
end

function love.update(dt)
	gameplay.update(dt)
	hud.update(dt)
	interface.update(dt)
end

function love.draw()
	gameplay.draw()
	hud.draw()
	interface.draw()
end

function love.mousereleased(x, y, button)
	interface.mousereleased(x, y, button)
end