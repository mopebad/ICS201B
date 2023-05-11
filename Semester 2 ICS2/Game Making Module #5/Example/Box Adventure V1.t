%Game Project V1
%By: Mr. Cardona

put "Welcome to the Box Game! Press 'g' to end game!"
put "The game will automatically start in 10 seconds"

for count:1 .. 10
    put count
    delay(100)
end for

%Set up Game Screen
setscreen("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly")
colorback(white)
color(black)
View.Update

%Inserting Map & Character
var map1:int
map1:=Pic.FileNew("SpookyMap.bmp")

var box:int
box:=Pic.FileNew("CharacterBox.bmp")

%Movement & Position
var chars:array char of boolean
%Variable 'Chars' will be using keyboard inputs

var posx, posy:int
posx:=100
posy:=100

%GAME procedure
proc GAME
    cls
    Pic.Draw(map1,0,0,picCopy)
    Pic.Draw(box,posx,posy,picMerge)
    View.Update
end GAME

%Running the actual game! 
loop
    Input.KeyDown(chars)
    %Allows input to come from keys being pressed down
    if chars('g') then
	exit
    end if
    GAME
    delay(50)
    %"fps" of 50 
end loop

%End Message
cls
put "Good game! (gg), thank you for playing!"
