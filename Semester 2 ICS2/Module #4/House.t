var width:= 13
var depth := 8
var row := 7
var column := 33
var rowchange:= 1
var columnchange := 1
var randomNum : int



const toprow := (25 - depth) div 2
const leftcolumn:= (80 - width) div 2
randomize
var colorno: int




locate (toprow, leftcolumn)
for count:1..width
    randomize
    randint(randomNum,1,40)
    color(randomNum)
    put "*"..
   
end for


locate (toprow + depth - 1, leftcolumn)
for count:1..width
    randomize
    randint(randomNum,1,40)
    color(randomNum)
    put "*"..
end for

%left

const sidetop:= toprow + 1
const sidebott := toprow + depth - 2
for Row: sidetop .. sidebott
    locate (Row, leftcolumn)
    randomize
    randint(randomNum,1,40)
    color(randomNum)
    put "*"..
end for

%right

const rightcolumn := leftcolumn + width - 1
for Row: sidetop .. sidebott
    locate (Row, rightcolumn)
    randomize
    randint(randomNum,1,40)
    color(randomNum)
    put "*"..
    randomize
    randint(randomNum,1,40)
    color(randomNum)
end for



loop

if row = 7 and column = 33 then
    rowchange:=-rowchange
end if
exit when column = 39
locate(row, column)
row:= row + rowchange
column := column + columnchange
randomize
randint(randomNum,1,40)
color(randomNum)
put "*"
end loop

var row2:= 2
var column2:= 40

loop 
exit when row2 = 8
locate(row2, column2)
row2 := row2 + 1
column2 := column2 +1
randomize
randint(randomNum,1,40)
color(randomNum)
put "*"..

end loop

