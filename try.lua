--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

Lua try-catch-finally thing

--]]

return function(chunk)
	local ok, err = pcall(chunk)
	if not ok then
		return {
			err = err,
			catch = function(self, keyword, chunk)
				if not chunk then
					keyword(self.err)
				else
					if not not string.find(self.err, keyword) then
						chunk(self.err)
					end
				end
				return self
			end,
			finally = function(self, chunk)
				chunk(self.err)
			end
		}
	else			-- no error
		return {
			catch = function(self) return self end,
			finally = function(self, chunk)
				chunk()
			end
		}
	end
end