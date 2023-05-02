%Generates a random number between 1 and 10
%Places "ZZZ" and the random generated number into a random spot within the column and row limits.
var column : int
var row : int
var randomnum : int
randomize

loop
    randint (column, 1, 80)
    randint (row, 1, 25)
    randint (randomnum, 1, 10)
    locate (row, column)
    put "ZZZ ", randomnum
    delay (250)
    cls
end loop
