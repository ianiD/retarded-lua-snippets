--[[

Dragomir Ioan/mahham/ianiD
2016-05-01

Glorious Lua Utility Extender

	What I don't like about this one is that you must do
	```lua
		base = after(base).add(hello)
	```
	I would really like to get rid of the `base = ` part, so that's why sticky.lua exists

--]]

return function(base)	-- after
	return {
		add = function(self, expansion)
			if expansion == nil then expansion = self end
			return function(...)
				base(...)
				expansion(...)
			end
		end
	}
end, function(base)		-- before
	return {
		add = function(self, expansion)
			if expansion == nil then expansion = self end
			return function(...)
				expansion(...)
				base(...)
			end
		end
	}
end
