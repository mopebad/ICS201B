% ZZZ FINAL
% By: Joshua, Etode, Errari, Eathands, Ethan, Eathan, Eattai, Enigger, Ethands, Fabbytai, Eapatty.

% Setup Game Screen
setscreen("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback(white)
color(black)
View.Update

% Inserting Map & Character
var maptitle : int
maptitle := Pic.FileNew("press space to continue.bmp") 

% Movement & Position (chars = characters)
var chars: array char of boolean

% Title Screen
proc titlesrc
    Pic.Draw(maptitle, 0, 0, picCopy)
    View.Update
end titlesrc

titlesrc
loop
    Input.KeyDown(chars)
    %Allows input to come from keys being pressed down
    if chars(' ') then
	exit
    end if
    end loop
cls 
put "GGGGGG"
