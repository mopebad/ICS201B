%Module 4 "SnowFall" Program
randomize
var row, column:int
var randomNum:int

loop 
    randint(randomNum,1,255)
    colorback(randomNum)
    %pick a random row, and column
    randint(row,1,25)
    randint(column,1,80)
    locate(row, column)
    put " "..
   

end loop
