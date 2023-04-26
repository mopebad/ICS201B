var res: real
var y1: real
var y2: real
var x1: real
var x2: real

function slope(y1: real, y2: real, x1: real, x2: real):real
   result (y2-y1)/(x2-x1)
end slope

put "Enter the value of y2, y1, x2, x1."
get y1
get y2
get x1
get x2

delay(800)

res:=slope(y1, y2, x1, x2)
put "The slope of the line is ", res, ""

