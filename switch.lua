--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

Lua switch-case thing

--]]

return function(value)
	return {
		value = value,
		match = false, matched = nil,
		case = function(self, test)
			if value == test then
				self.match = true
				self.matched = test
				self.default = function(self) return self end
			end
			return self
		end,
		run = function(self, chunk)
			if self.match then
				chunk(self.matched)
			end
			self.matched = nil
			self.match = false
			return self
		end,
		default = function(self, chunk)
			chunk()
			return self
		end
	}
end
