--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

State manager example - splash state

--]]

local splash = {}
local time = 0
local key_pressed = false

function splash.enter()
	time = 0
	key_pressed = false
end

function splash.update(dt)
	time = time + dt
	if time > 5 or key_pressed then
		return "menu"
	end
end

function splash.draw()
	love.graphics.print("SPLASH! Demo made by mahham", 100, 100)
end

function splash.keypressed()
	key_pressed = true
end

return splash
