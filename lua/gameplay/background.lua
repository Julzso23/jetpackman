background = {}

function background.init()
	background.pos = -4320
	background.img = love.graphics.newImage("resources/images/backgrounds/sky.png")
end

function background.scroll(dt, speed)
	if background.pos < 0 then
		background.pos = background.pos + speed*dt
	else
		background.pos = -4320
	end
end

function background.draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(background.img, 0, background.pos)
end