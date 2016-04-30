--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

State manager example - play state

--]]

local play = {}

local x, y = 100, 100

function play.enter()
	x, y = 100, 100
end

function play.update(dt)
	local spd = 100
	if love.keyboard.isDown("w") then y = y - dt * spd end
	if love.keyboard.isDown("a") then x = x - dt * spd end
	if love.keyboard.isDown("s") then y = y + dt * spd end
	if love.keyboard.isDown("d") then x = x + dt * spd end

	if x>700 then return "splash" end
	if y>500 then return "menu" end
end

function play.draw()
	love.graphics.rectangle("line", x-10, y-10, 20, 20)
	love.graphics.print("splash", 700, 100)
	love.graphics.print("menu", 100, 500)
end

return play
