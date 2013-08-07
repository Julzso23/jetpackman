char = {}

function char.init()
	char.img = {}
	char.img.idle = love.graphics.newImage("resources/images/characters/main/idle.png")
	char.img.left = love.graphics.newImage("resources/images/characters/main/left.png")
	char.img.right = love.graphics.newImage("resources/images/characters/main/right.png")
	char.img.current = char.img.idle

	char.health = 100
	char.score = 0
	char.invincibility = false
	char.shieldTimer = 0

	char.position = {
		x = 640,
		y = 500,
		rotation = 0
	}

	char.waverDirection = "down"
end

function char.draw(scale)
	if char.invincibility then
		love.graphics.setColor(0, 150, 255, 255)
	else
		love.graphics.setColor(255, 255, 255, 255)
	end
	love.graphics.draw(char.img.current, char.position.x, char.position.y, char.position.rotation, scale, scale, 60, 125)
end

function char.shield(dt)
	if char.invincibility then
		if char.shieldTimer < 3 then
			char.shieldTimer = char.shieldTimer + dt
		else
			char.invincibility = false
			char.shieldTimer = 0
		end
	end
end