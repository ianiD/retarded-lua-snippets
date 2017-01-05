local get, set, typesafe, metatable

get = function(_g, i)
	return _g.__vars[i].val
end

set = function(_g, i, v)
	if _g.__vars[i] then
		if type(v) == _g.__vars[i].type then
			_g.__vars[i].val = v
			--[=[
			if type(v) == type({}) then
				typesafe(v)
			end
			]=]
		else
			error("Mismatching type for "..i..": "..type(v).." (should be ".._g.__vars[i].type..")", 2)
		end
	else
		--print("new var: "..i)
		_g.__vars[i] = {type = type(v), val = v}
	end
end

metatable = {
	__index = get,
	__newindex = set
}

typesafe = function(...)
	local tables = {...}
	for _, table in pairs(tables) do
		table.__vars = {}
		setmetatable(table, metatable);
		for i, v in pairs(table) do
			if i ~= "__vars" then
				--print("old var: "..i)
				table.__vars[i] = {type = type(v), val = v}
				table[i] = nil
			end
		end
	end
end

return typesafe
