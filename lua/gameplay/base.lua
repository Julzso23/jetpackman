require("lua/gameplay/game")
require("lua/gameplay/boxes")
require("lua/gameplay/drops")
require("lua/gameplay/controls")
require("lua/gameplay/collision")
require("lua/gameplay/character")
require("lua/gameplay/background")

gameplay = {}

function gameplay.load()
	game.init()

	boxes.create(-128)
	drops.create(-128)

	char.init()

	background.init()
end

function gameplay.update(dt)
	controls.shortcutKeys()

	if game.mode == "playing" then
		boxes.drop(dt, 800)
		drops.drop(dt, 400)

		controls.setKeyBinds()
		controls.movement(dt, 600)
		controls.limit()

		collision.collideBox(44, 30, 60)
		collision.collideDrop(44, 30, 60)

		char.shield(dt)
	end

	background.scroll(dt, 400)

	controls.waver(2, 0.05)
end

function gameplay.draw()
	background.draw()

	if game.mode == "playing" then
		drops.drawAll()
	end
	char.draw(0.75)

	if game.mode == "playing" then
		boxes.drawAll()
	end
end