%Module 4 Part 3
%Horizontal Line
loop 
    var column:int
    put "Pick a column from 1 to 80"
    put "We will draw a vertical line there!"
    get column
    cls
    for row:1..25
	locate(row,column)
	put "*"..
	delay(50)
    end for
    cls
end loop

%Slanted line
loop 
    var column:int
    put "Pick a column from 1 to 80"
    put "We will draw a vertical line there!"
    get column
    cls
    for row:1..25
	locate(row,column)
	put "*"..
	delay(50)
	column:=column+1
    end for
    cls
end loop

%Vertical line
loop 
    var row:int
    put "Pick a row from 1 to 40"
    put "We will draw a vertical line there!"
    get row
    cls
    for column:1..80
	locate(row,column)
	put "*"..
	delay(50)
	column:=column+1
    end for
    cls
end loop
