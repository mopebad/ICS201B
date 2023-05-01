%The "Colorful Box" Program
%Module 4 BOX!

var depth, width:int
put "Enter the width of the box "..
put "(Between 1 - 60): "..
get width

put "Enter the depth of the box "..
put "(Beween 1 - 20): "..
get depth

cls
%Center the box! Using coordinates
const topRow:=(25-depth)div 2
const leftColumn:=(80-width)div 2
randomize
var randomNum:int

%Draw top of box
locate(topRow,leftColumn)
for count: 1 .. width 
    randint(randomNum,1,40)
    color(randomNum)
    put "*".. 
    delay(100)
end for

%Draw bottom of box
locate(topRow+depth-1,leftColumn)
for count: 1 .. width 
    randint(randomNum,1,40)
    color(randomNum)
    put "*".. 
    delay(100)
end for

%Draw Left side of box
const sideTop:=topRow+1
const sideBottom:=topRow+depth-2
%Make a wall just below roof and just above ground
for row:sideTop .. sideBottom 
    randint(randomNum,1,40)
    color(randomNum)
    locate(row,leftColumn)
    put "*"..
    delay(100)
end for



%Draw Right side of box
const rightColumn:=leftColumn+width-1
%Make a wall just below roof and just above ground
for row:sideTop .. sideBottom 
    randint(randomNum,1,40)
    color(randomNum)
    locate(row,rightColumn)
    put "*"..
    delay(100)
end for
