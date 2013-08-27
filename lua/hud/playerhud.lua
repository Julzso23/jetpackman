phud = {}
fonts = {}

function phud.init()
	fonts.lazysans = love.graphics.newFont("resources/fonts/lazysans.ttf", 30)
	love.graphics.setFont(fonts.lazysans)
end

function phud.drawScore()
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("Score", 1220, 15, 0.12)
	love.graphics.print(char.score, 1170, 25, 0.12)
end

function phud.drawHealth()
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("Health", 5, 10, -0.12)

	if char.health >= 10 then
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(drop.health.img, 24, 70, -0.25, 0.75, 0.75, 24, 24)
	end
	if char.health >= 20 then
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(drop.health.img, 68, 65, -0.25, 0.75, 0.75, 24, 24)
	end
	if char.health >= 30 then
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(drop.health.img, 112, 60, -0.25, 0.75, 0.75, 24, 24)
	end
	if char.health >= 40 then
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(drop.health.img, 156, 55, -0.25, 0.75, 0.75, 24, 24)
	end
	if char.health >= 50 then
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.draw(drop.health.img, 200, 50, -0.25, 0.75, 0.75, 24, 24)
	end
end