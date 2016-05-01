--[[

Dragomir Ioan/mahham/ianiD
2016-05-01

sticky.lua example

--]]

local sticky = require("sticky")

function A() io.write("A") end
function B() io.write("B") end

AB1 = sticky(A):addAfter(B)
BA1 = sticky(A):addBefore(B)
AB2 = sticky(B):addBefore(A)
BA2 = sticky(B):addAfter(A)

AB1(); io.write(" is the same as "); AB2()
print("\n")
BA1(); io.write(" is the same as "); BA2()

ABB = sticky(AB1):addAfter(B)	-- sticky(AB1) is making a copy because if it wasn't there AB1 would get modified as well :/
ABBA = AB1 .. BA2

io.write("\n\nABB(): "); ABB()
io.write("\n\nABBA = AB1 .. BA2\tABBA(): "); ABBA()
