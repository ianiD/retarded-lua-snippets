local try = require("try")
local typesafe = require("typesafe")

typesafe(_G)

try(function()
	something = "value"
	something = 123
end):catch(function(err)
	print("error "..err)
end)

some_other_thing = { tables_in_tables = {a = 1, b = 2, c = 3}, kek = "lol"}
typesafe(some_other_thing, some_other_thing.tables_in_tables)
try(function()
	some_other_thing.kek = "works";	-- works
	some_other_thing.kek = 123;		-- doesn't
end):catch(function(err)
	print("error "..err)
end)

try(function()
	some_other_thing.tables_in_tables.a = 4	-- works
	some_other_thing.tables_in_tables.a = "doesn't" -- doesn't work
end):catch(function(err)
	print("error "..err)
end)
