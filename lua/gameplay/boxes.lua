boxes = {}

function boxes.create(baseY)
	boxes.timer = 0

	boxes.img = love.graphics.newImage("resources/images/drops/weight.png")
	
	box = {
		box1 = {id = 1, activated = false, x = 0, y = baseY},
		box2 = {id = 2, activated = false, x = 128, y = baseY},
		box3 = {id = 3, activated = false, x = 256, y = baseY},
		box4 = {id = 4, activated = false, x = 384, y = baseY},
		box5 = {id = 5, activated = false, x = 512, y = baseY},
		box6 = {id = 6, activated = false, x = 640, y = baseY},
		box7 = {id = 7, activated = false, x = 768, y = baseY},
		box8 = {id = 8, activated = false, x = 896, y = baseY},
		box9 = {id = 9, activated = false, x = 1024, y = baseY},
		box10 = {id = 10, activated = false, x = 1152, y = baseY}
	}
end

function boxes.drawBox(x, y)
	--love.graphics.setColor(25, 25, 25, 255)
	--love.graphics.rectangle("fill", x, y, 128, 128)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(boxes.img, x, y)
end

function boxes.drawAll()
	for k, v in pairs(box) do
		boxes.drawBox(v.x, v.y)
	end
end

function boxes.drop(dt, speed)
	if boxes.timer < 0.25 then
		boxes.timer = boxes.timer + dt
	else
		boxes.timer = 0
		local drop = math.random(1, 10)
		
		for k, v in pairs(box) do
			if v.id == drop then
				v.activated = true
			end
		end
	end

	for k, v in pairs(box) do
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