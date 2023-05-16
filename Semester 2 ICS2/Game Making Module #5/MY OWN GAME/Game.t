% Game Project V1
% By : Joshua Chan

put "Welcome to the Box Game! Press 'g' to end game!"
put "The game will automatically start in 10 seconds!"

for count:1 .. 10
    put count
    delay(100)
end for

% Setup Game Screen
setscreen("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback(white)
color(black)
View.Update

% Inserting Map & Character
var map1:int
map1:=Pic.FileNew("tianyu.bmp")


var box:int
box:=Pic.FileNew("character.bmp")

% Movement & Position (chars = characters)
var chars:array char of boolean
% Variable 'Chars' will be using keyboard inputs

var posx, posy:int
posx:=53
posy:=199

% GAME procedure
proc GAME
    cls
    Pic.Draw(map1,0,0,picCopy)
    Pic.Draw(box,posx,posy,picMerge)
    View.Update
end GAME

% Running the actual game!
loop
    Input.KeyDown(chars)
    % Allows input to come from keys being pressed down
    if chars('g') then
	exit
    end if
    GAME
    delay(60)
    %"fps" of 60
end loop

% Eng Message
cls 
put "GG!, thank you for playing!"
