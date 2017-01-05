--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

State manager example - menu state

--]]

local menu = {}

local shouldQuit, shouldPlay, shouldRestart = false, false, false

local time

function menu.enter()
	shouldQuit, shouldPlay, shouldRestart = false, false, -1
	time = 0
end

function menu.update(dt)
	time  = time + dt
	if shouldQuit then
		love.event.push("quit")
	elseif shouldPlay then
		return "play"
	elseif shouldRestart>0 and time-shouldRestart>1 then
		return "splash"
	end
end

function menu.keypressed(k)
	if k=="q" then shouldQuit = true end
	if k=="p" then shouldPlay = true end
	if k=="r" then shouldRestart = time end
end

function menu.draw()
	love.graphics.print("Menu state", 100, 100)
end

return menu
