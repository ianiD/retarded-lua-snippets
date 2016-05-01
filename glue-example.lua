--[[

Dragomir Ioan/mahham/ianiD
2016-05-01

glue.lua example

--]]

local after, before = require("glue")

function DLC()
    print("THAT NOW HAS AN AWESOME BUT EXPENSIVE DLC")
end

function game()
    print("crappy game")
end

game()	-- crappy game

game = after(game).add(DLC)

game()	-- crappy game
		-- THAT NOW HAS AN AWESOME BUT EXPENSIVE DLC
