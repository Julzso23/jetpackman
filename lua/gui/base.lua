require("lua/gui/gui")
require("lua/gameplay/game")

interface = {}
interface.buttons = {}

function interface.load()
	interface.buttons.playButton = gui.newButton("Play", 100, 100, 160, 50)
	interface.buttons.playButton:setColour(120, 180, 120, 100)

	interface.buttons.optionsButton = gui.newButton("Options", 100, 200, 160, 50)
	interface.buttons.optionsButton:setColour(180, 180, 120, 100)
	
	interface.buttons.quitButton = gui.newButton("Quit", 100, 300, 160, 50)
	interface.buttons.quitButton:setColour(180, 120, 120, 100)
end

function interface.update(dt)
end

function interface.draw()
	if game.mode == "mainMenu" then
		for k, v in pairs(interface.buttons) do
			v:draw()
		end
	end
end

function interface.mousereleased(x, y, button)
	if interface.buttons.playButton:onClicked(x, y, button) then game.mode = "playing" end
	if interface.buttons.quitButton:onClicked(x, y, button) then love.event.push("quit") end
end