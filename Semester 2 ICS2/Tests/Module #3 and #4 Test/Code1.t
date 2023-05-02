% Declare Variables

var width := 13
var depth := 8
var row := 7
var column := 33
var rowchange := 1
var columnchange := 1
var randomNum : int
var randomNum2 : int
var randomNum3 : int

% Base of triangle

const toprow := (25 - depth) div 2
const leftcolumn := (80 - width) div 2
randomize
var colorno : int

% Draws the line

locate (toprow, leftcolumn)
for count : 1 .. width
    randomize
    randint (randomNum, 1, 5)
    color (randomNum)
    put "*" ..

end for

% Diagonal line on the left
% Draws line

loop
    if row = 7 and column = 33 then
	rowchange := -rowchange
    end if
    exit when column = 39
    locate (row, column)
    row := row + rowchange
    column := column + columnchange
    randomize
    randint (randomNum2, 5, 10)
    color (randomNum2)
    put "*"
end loop

% Diagonal line on the right

var row2 := 2
var column2 := 40

% Draws line

loop
    exit when row2 = 8
    locate (row2, column2)
    row2 := row2 + 1
    column2 := column2 + 1
    randomize
    randint (randomNum3, 10, 15)
    color (randomNum3)
    put "*" ..
end loop
