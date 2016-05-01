--[[

Dragomir Ioan/mahham/ianiD
2016-05-01

sticky - a hackyer alternative to glue

--]]

local sticky

local stickyMetatable = {
	__call = function(self, ...)
		for i=self.functions.first, self.functions.last do
			self.functions[i](...)
		end
	end,
	__concat = function(self, other)
		local selfCopy = sticky(self)
		return selfCopy:addAfter(other)
	end
}


sticky = function(fn)
	if type(fn) ~= "function" and getmetatable(fn) ~= stickyMetatable then error("Sticky objects can only be made from functions or other sticky objects (type="..type(fn)..")") end
	local sticky = {}
	sticky.functions = {
		first = 1, last = 1
	}
	if type(fn) == "function" then
		sticky.functions[1] = fn
	else
		sticky.functions.last = 0
		for i=fn.functions.first, fn.functions.last do
			sticky.functions.last = sticky.functions.last + 1
			sticky.functions[sticky.functions.last] = fn.functions[i]
		end
	end
	function sticky:addAfter(expansion)
		if type(expansion) == "function" then
			self.functions.last = self.functions.last + 1
			self.functions[self.functions.last] = expansion
		elseif type(expansion) == "table" and getmetatable(expansion) == stickyMetatable then
			for i=expansion.functions.first, expansion.functions.last do
				self.functions.last = self.functions.last + 1
				self.functions[self.functions.last] = expansion.functions[i]
			end
		end
		return self
	end
	function sticky:addBefore(expansion)
		if type(expansion) == "function" then
			self.functions.first = self.functions.first - 1
			self.functions[self.functions.first] = expansion
		elseif type(expansion) == "table" and getmetatable(expansion) == stickyMetatable then
			for i=expansion.functions.last, expansion.functions.first, -1 do
				self.functions.first = self.functions.first - 1
				self.functions[self.functions.first] = expansion.functions[i]
			end
		end
		return self
	end
	return setmetatable(sticky, stickyMetatable)
end

return sticky
