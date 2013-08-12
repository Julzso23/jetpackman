screen = {}

function screen.x(x)
	return (x/1280)*love.graphics.getWidth()
end

function screen.y(y)
	return (y/720)*love.graphics.getHeight()
end