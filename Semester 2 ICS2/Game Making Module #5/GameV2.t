% Game Project V2
% By : Joshua Chan

put "Welcome to the Box Game! Press 'g' to end game!"
put "The game will automatically start in 10 seconds!"

for count : 1 .. 10
    put count
    delay (100)
end for

% Setup Game Screen
setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (white)
color (black)
View.Update

% Inserting Map & Character
var map2 : int
map2 := Pic.FileNew ("tianyu.bmp")

var box2 : int
box2 := Pic.FileNew ("blackbox.bmp")

var box : int
box := Pic.FileNew ("character.bmp")



% Movement & Position (chars = characters)
var chars : array char of boolean
% Variable 'Chars' will be using keyboard inputs

var posx, posy, posx2, posy2 : int
posx := 40
posy := 540
posx2 := 40
posy2 := 400


var velx, vely : int
velx := 0
vely := 0

% Movement Procedure box1
proc MOVEMENT
    % Left and Right
    if chars (KEY_LEFT_ARROW) and whatdotcolour (posx - 10, posy + 40) not = black 
			       and whatdotcolour (posx - 10, posy) not = black then                   
	% Use 'a' for the a key instead
	velx := -10
    elsif chars (KEY_RIGHT_ARROW) and whatdotcolour(posx + 30,posy + 40) not = black
			       and whatdotcolour(posx + 30,posy) not = black then 
	velx := 10
    else
	velx := 0
    
    if chars (KEY_UP_ARROW) and whatdotcolour(posx,posy + 50) not = black
			       and whatdotcolour(posx + 20,posy + 50) not = black then 
	vely := 10
    elsif chars (KEY_DOWN_ARROW) and whatdotcolour(posx,posy - 10) not = black
			       and whatdotcolour(posx + 20,posy - 10) not = black then 
	vely := -10
    else
	vely := 0
    end if 
    end if

    posx := posx + round (velx)
    posy := posy + round (vely)
end MOVEMENT


% Movement Procedure box2
proc MOVEMENT2
    % Left and Right
    if chars ('d') and whatdotcolour(posx+30,posy) not = black
			       and whatdotcolour(posx+30,posy+40) not = black then
			      
	% Use 'a' for the a key instead
	velx := 10
    elsif chars ('a') and whatdotcolour(posx-10,posy+40) not = black
			       and whatdotcolour(posx-10,posy) not = black then 
	velx := -10
    else
	velx := 0
    
    if chars ('w') then
	vely := 10
    elsif chars ('s') then
	vely := -10
    else
	vely := 0
    end if 
    end if

    posx2 := posx2 + round (velx)
    posy2 := posy2 + round (vely)
end MOVEMENT2

% GAME procedure
proc GAME
    cls
    Pic.Draw (map2, 0, 0, picCopy)
    MOVEMENT
    Pic.Draw (box, posx, posy, picMerge)
    MOVEMENT2
    Pic.Draw (box2, posx2, posy2, picMerge)
    
    View.Update
end GAME

% Running the actual game!
loop
    Input.KeyDown (chars)
    % Allows input to come from keys being pressed down
    if chars ('g') then
	exit
    end if
    GAME
    delay (60)
    %"fps" of 60
end loop

% Eng Message
cls
put "GG!, thank you for playing!"
