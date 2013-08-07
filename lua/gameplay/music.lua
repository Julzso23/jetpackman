music = {}

function music.init()
	music.nightOwl = love.audio.newSource("resources/music/Night_Owl.mp3", "stream")
end

function music.play(source)
	source:play()
	source:setLooping(true)
end

function music.pause(source)
	source:pause()
end

function music.resume(source)
	source:resume()
end