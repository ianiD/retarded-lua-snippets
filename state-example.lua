--[[

Dragomir Ioan/mahham/ianiD - 123ioandragomir123@gmail.com
2016-04-30

State manager example - main

--]]

local state = require("state")
state.namePrefix = "example-states/"

state:add("splash"):add("menu"):add("play"):set("splash")

function love.load() state:load() end
function love.update(dt) state:update(dt) end
function love.draw() state:draw() end
function love.keypressed(...) if type(state.keypressed) == "function" then state.keypressed(...) end end
