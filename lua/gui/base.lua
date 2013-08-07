require("lua/gui/gui")
require("lua/gameplay/game")

interface = {}
interface.main = {}
interface.options = {}

function interface.load()
	interface.main.play = gui.newButton("Play", 100, 100, 160, 50)
	interface.main.play:setColour(120, 180, 120, 100)

	interface.main.options = gui.newButton("Options", 100, 200, 160, 50)
	interface.main.options:setColour(180, 180, 120, 100)
	
	interface.main.quit = gui.newButton("Quit", 100, 300, 160, 50)
	interface.main.quit:setColour(180, 120, 120, 100)

	interface.options.volDown = gui.newButton("<", 100, 100, 50, 50)
	interface.options.volDown:setColour(180, 120, 120, 100)
	interface.options.volume = gui.newButton("Volume", 180, 100, 160, 50)
	interface.options.volume:setColour(120, 120, 120, 100)
	interface.options.volUp = gui.newButton(">", 370, 100, 50, 50)
	interface.options.volUp:setColour(120, 180, 120, 100)

	interface.options.back = gui.newButton("Back", 100, 300, 160, 50)
	interface.options.back:setColour(180, 120, 120, 100)
end

function interface.update(dt)
end

function interface.draw()
	if game.mode == "mainMenu" then
		for k, v in pairs(interface.main) do
			v:draw()
		end
	elseif game.mode == "optionsMenu" then
		for k, v in pairs(interface.options) do
			v:draw()
		end
	end
end

function interface.mousereleased(x, y, button)
	if game.mode == "mainMenu" then
		if interface.main.play:onClicked(x, y, button) then game.mode = "playing" end
		if interface.main.options:onClicked(x, y, button) then game.mode = "optionsMenu" end
		if interface.main.quit:onClicked(x, y, button) then love.event.push("quit") end
	elseif game.mode == "optionsMenu" then
		if interface.options.back:onClicked(x, y, button) then game.mode = "mainMenu" end
	end
end

function interface.keyreleased(key)
	if key == "escape" and game.mode == "playing" then
		game.mode = "mainMenu"
	end
end