--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

Lua/Love state manager thing

--]]

local state = {}
state.states = {}
state.currentState = ""

local function checkName(name) if type(name) ~= "string" then self:errorHandler("Cannot have a non-string state name ("..tostring(name)..")") end end

state.pathPrefix = "states/"

function state:add(name)
	checkName(name)
	self.states[name] = dofile(state.pathPrefix..name..".lua")

	return self
end

function state:set(name, params)
	checkName(name)
	if self.currentState ~= "" then
		if type(self.states[self.currentState].leave) == "function" then
			self.states[self.currentState].leave(name)
		end
	end
	self.currentState = name
	if type(self.states[self.currentState].enter) == "function" then
		self.states[self.currentState].enter(params)
	end

	return self
end

function state:load()
	for i, s in pairs(self.states) do
		if type(s.load) == "function" then s.load() end
	end
end

function state:errorHandler(err)
	error(err)
end

function state:update(...)
	if type(self.states[self.currentState].update) ~= "function" then self:errorHandler("States must have an update() method") end
	local ok, err, params = pcall(self.states[self.currentState].update, ...)
	if ok then
		if err then
			if err == "<QUIT>" then
				love.event.push("quit")
			else
				self:set(err, params)
			end
		end
	else
		self:errorHandler(err)
	end

	return self
end

function state:__index(key)						-- keypressed, mousemoved, draw etc. Also makes it universal
	return self.states[self.currentState][key]
end

return setmetatable(state, state)
