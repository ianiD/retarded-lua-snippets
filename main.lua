
local switch = require("switch")

print("Do you want to play a game?")
switch(io.read())
:case("yes"):case("Yes"):case("YES"):case("y"):run(function() print("Good!") end)
:case("no"):case("No"):case("NO"):case("n"):run(function() print("Wrong answer!") end)
:default(function() print("wut?") end)