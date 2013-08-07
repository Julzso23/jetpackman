phud = {}
fonts = {}

function phud.init()
	fonts.lazysans = love.graphics.newFont("resources/fonts/lazysans.ttf", 30)
	love.graphics.setFont(fonts.lazysans)
end

function phud.drawScore()
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("health", 1220, 15, 0.7)
	love.graphics.print(char.health, 1170, 25, 0.5)
end