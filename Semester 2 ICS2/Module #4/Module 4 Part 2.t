%Module 4 part 2
var column:int
var row:int

for count:1..100
    randint(column,1,40)
    randint(row,1,40)
    locate(column,row)
    %(y,x)
    %(up/down,left/right)
    put count ..
    delay(100)
    cls
end for
