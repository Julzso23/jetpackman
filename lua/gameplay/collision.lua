collision = {}

function collision.init()
	collision.isHit = false
end

function collision.collideBox(w, t, b)
	for k, v in pairs(box) do
		if char.position.x+w/2 > v.x and char.position.x-w/2 < v.x+128 and char.position.y+t > v.y and char.position.y-b < v.y+128 then

			if not char.invincibility then
				if char.health >= 10 then
					char.health = char.health - 10
				else
					char.health = 0
				end
				char.invincibility = true
			end

		end
	end
end

function collision.collideDrop(w, t, b)
	for k, v in pairs(drop) do
		if char.position.x+w/2 > v.x and char.position.x-w/2 < v.x+48 and char.position.y+t > v.y and char.position.y-b < v.y+48 then
			v.y = -128
			v.activated = false
			if v.id == 1 then
				if char.health <= 40 then
					char.health = char.health + 10
				else
					char.health = 50
				end
			elseif v.id == 2 then
				char.score = char.score + 1
			elseif v.id == 3 then
				char.invincibility = true
			end
		end
	end
end