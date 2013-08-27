drops = {}

function drops.create(baseY)
	drops.timer = 0
	
	drop = {
		health = {id = 1, activated = false, x = 0, y = baseY, img = love.graphics.newImage("resources/images/drops/health.png")},
		coin = {id = 2, activated = false, x = 128, y = baseY, img = love.graphics.newImage("resources/images/drops/coin.png")},
		shield = {id = 3, activated = false, x = 256, y = baseY, img = love.graphics.newImage("resources/images/drops/shield.png")}
	}
end

function drops.drawDrop(img, x, y)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(img, x, y, 0, 0.75, 0.75)
end

function drops.drawAll()
	for k, v in pairs(drop) do
		drops.drawDrop(v.img, v.x, v.y)
	end
end

function drops.drop(dt, speed)
	if drops.timer < 4 then
		drops.timer = drops.timer + dt
	else
		drops.timer = 0
		local fall = math.random(1, 3)
		
		for k, v in pairs(drop) do
			if v.id == fall then
				if not v.activated then
					v.activated = true
					v.x = math.random(0, 1248)
				end
			end
		end
	end

	for k, v in pairs(drop) do
		if v.activated then
			if v.y < 721 then
				v.y = v.y + speed*dt
			else
				v.y = -128
				v.activated = false
			end
		end
	end
end