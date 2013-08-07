gui = {}
gui.__index = gui

function gui.newButton(t, x, y, w, h)
	local c = {}
	setmetatable(c, gui)

	c.x = x
	c.y = y
	c.width = w
	c.height = h
	c.text = t
	c.colour = {200, 200, 200, 255}
	c.textColour = {0, 0, 0}
	return c
end

function gui:getX()
	return self.x
end
function gui:setX(x)
	self.x = x
end

function gui:getY()
	return self.y
end
function gui:setY(y)
	self.y = y
end

function gui:getWidth()
	return self.width
end
function gui:setWidth(w)
	self.width = w
end

function gui:getHeight()
	return self.height
end
function gui:setHeight(h)
	self.height = h
end

function gui:getText()
	return self.text
end
function gui:setText(t)
	self.text = t
end

function gui:getColour()
	return self.colour
end
function gui:setColour(r, g, b, a)
	self.colour = {r, g, b, a}
end

function gui:getTextColour()
	return self.textColour
end
function gui:setTextColour(r, g, b)
	self.textColour = {r, g, b}
end

function gui:draw()
	if love.mouse.getX() > self.x and love.mouse.getX() < self.x+self.width and love.mouse.getY() > self.y and love.mouse.getY() < self.y+self.height then
		if love.mouse.isDown("l") then
			love.graphics.setColor(self.colour[1]-10, self.colour[2]-10, self.colour[3]-10, self.colour[4])
		else
			love.graphics.setColor(self.colour[1]-5, self.colour[2]-5, self.colour[3]-5, self.colour[4])
		end
	else
		love.graphics.setColor(self.colour)
	end
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(self.colour[1]-20, self.colour[2]-20, self.colour[3]-20, self.colour[4])
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.setColor(self.textColour)
	love.graphics.printf(self.text, self.x, self.y+((self.height/2)-15), self.width, "center")
end

function gui:onClicked(x, y, button)
	if x > self.x and x < self.x+self.width and y > self.y and y < self.y+self.height then
		return true
	end
end