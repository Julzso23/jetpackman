controls = {}

function controls.shortcutKeys()
	if love.keyboard.isDown("lalt") and love.keyboard.isDown("f4") then
		love.event.push("quit")
	end
end

function controls.setKeyBinds()
	controls.key = {
		A = love.keyboard.isDown("a"),
		D = love.keyboard.isDown("d"),
		Left = love.keyboard.isDown("left"),
		Right = love.keyboard.isDown("right")
	}
end

function controls.movement(dt, speed)
	if controls.key.A or controls.key.Left then
		char.position.x = char.position.x - speed * dt
		char.img.current = char.img.left
	end
	if controls.key.D or controls.key.Right then
		char.position.x = char.position.x + speed * dt
		char.img.current = char.img.right
	end

	if not controls.key.A and not controls.key.Left and not controls.key.D and not controls.key.Right then
		char.img.current = char.img.idle
	end
	if controls.key.A or controls.key.Left then
		if controls.key.D or controls.key.Right then
			char.img.current = char.img.idle
		end
	end
end

function controls.limit()
	if char.position.x < 0 then
		char.position.x = 0
	end
	if char.position.x > 1280 then
		char.position.x = 1280
	end
end

function controls.waver(limit, speed)
	if char.waverDirection == "down" then
		if char.position.y < 500+limit then
			char.position.y = char.position.y + speed
		else
			char.waverDirection = "up"
		end
	elseif char.waverDirection == "up" then
		if char.position.y > 500-limit then
			char.position.y = char.position.y - speed
		else
			char.waverDirection = "down"
		end
	end
end