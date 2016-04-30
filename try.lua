--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

Lua try-catch-finally thing

Example code:

```lua
	local try = require("try")

	try(function()
		local a = 1+nil -- `local a = 1+"a"` for the second catch block to run
	end)
	:catch(function(the_error)	print("Some error occured: "..the_error)	end)
	:catch("string", function()	print("The error contains the keyword 'string'")	end)
	:finally(function()	print("Whatever") end)
```

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