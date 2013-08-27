require("lua/hud/playerhud")
require("lua/gameplay/game")

hud = {}

function hud.load()
	phud.init()
end

function hud.update(dt)
end

function hud.draw()
	if game.mode == "playing" then
		phud.drawScore()
		phud.drawHealth()
	end
end