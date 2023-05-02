%Module 4 Part 3
%Horizontal Line

var column : int
put "Pick a column from 1 to 80"
put "We will draw a vertical line there!"
get column
cls
for row : 1 .. 25
    locate (row, column)
    put "*" ..
    delay (50)
end for
cls


%Slanted line

var start_column : int
put "Pick a column from 1 to 80"
put "We will draw a slanted line there!"
get start_column
cls
column := start_column
for row : 1 .. 25
    locate (row, column)
    put "*" ..
    delay (50)
    column := column + 1
end for
cls


%Vertical line

var row, start_row : int
put "Pick a row from 1 to 25"
put "We will draw a vertical line there!"
get start_row
cls
row := start_row
for column1 : 1 .. 80
    locate (row, column1)
    put "*" ..
    delay (50)
end for
cls

