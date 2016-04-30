--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

try-catch-finally example

--]]

local try = require("try")

try(function()
	local a = 1+nil -- `local a = 1+"a"` for the second catch block to run
end)
:catch(function(the_error)	print("Some error occured: "..the_error)	end)
:catch("string", function()	print("The error contains the keyword 'string'")	end)
:finally(function()	print("Whatever") end)