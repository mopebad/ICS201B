% Game Project V2
% By : Joshua Chan

put "Welcome to the Box Game! Press 'g' to end game!"
put "PRESS R TO RESET THE CHARACTERS TO ITS SPAWNPOINT!"
put "The game will automatically start in 10 seconds!"

for count : 1 .. 10
    put count
    delay (200)
end for

% Setup Game Screen
setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (white)
color (black)
View.Update

% Inserting Map & Character
var mapmain : int
mapmain := Pic.FileNew ("tianyu.bmp")

var mapstock : int
mapstock := Pic.FileNew ("tianyu2.bmp")

var box2 : int
box2 := Pic.FileNew ("MrRed.bmp")

var box : int
box := Pic.FileNew ("character.bmp")



% Movement & Position (chars = characters)
var chars : array char of boolean
% Variable 'Chars' will be using keyboard inputs

var posx, posy, posx2, posy2 : int
posx := 20
posy := 590
posx2 := 60
posy2 := 590


var velx, vely, velx2, vely2: int
velx := 0
vely := 0
velx2 := 0
vely2 := 0

% Movement Procedure box1
proc MOVEMENT
    %left and right
    if chars (KEY_RIGHT_ARROW) and whatdotcolour(posx+30,posy) not = black
			       and whatdotcolour(posx+30,posy+40) not = black then
			      
	%use 'a' for the a key instead
	velx:=10
    elsif chars (KEY_LEFT_ARROW)and whatdotcolour(posx-10,posy) not = black
				and whatdotcolour(posx-10,posy+40) not = black then
				
	velx:=-10
    else
	velx:=0
    end if 
    
    %up  and down
    if chars (KEY_DOWN_ARROW) and whatdotcolour(posx,posy-10) not = black
			      and whatdotcolour(posx+20,posy-10) not = black then
			      
	%use 'a' for the a key instead
	vely:=-10
    elsif chars (KEY_UP_ARROW) and whatdotcolour(posx,posy+50) not = black
			       and whatdotcolour(posx+20,posy+50) not = black then
			       
	vely:=10
    else
	vely:=0
    end if 
    
    posy:=posy+round(vely)  
    posx:=posx+round(velx)
    


% Reset player position to starting point

    if chars ('r') then
	posx := 20
	posy := 590
    end if
    
end MOVEMENT


% Movement Procedure box2
proc MOVEMENT2
    %left and right
    if chars ('d') and whatdotcolour(posx2+30,posy2) not = black
		   and whatdotcolour(posx2+30,posy2+40) not = black then
		    
	%use 'a' for the a key instead
	velx2:=10
    elsif chars ('a')and whatdotcolour(posx2-10,posy2) not = black
		     and whatdotcolour(posx2-10,posy2+40) not = black then
		     
	velx2:=-10
    else
	velx2:=0
    end if 
    
    %up  and down
    if chars ('s') and whatdotcolour(posx2,posy2-10) not = black
		   and whatdotcolour(posx2+20,posy2-10) not = black then
		   
	%use 'a' for the a key instead
	vely2:=-10
    elsif chars ('w') and whatdotcolour(posx2,posy2+50) not = black
		      and whatdotcolour(posx2+20,posy2+50) not = black then
		      
	vely2:=10
    else
	vely2:=0
    end if   
    
    posy2:=posy2+round(vely2)  
    posx2:=posx2+round(velx2)
    
    % Reset player position to starting point

    if chars ('r') then
	posx2 := 60
	posy2 := 590
    end if
    
end MOVEMENT2

% GAME procedure
proc GAME
    cls 
    Pic.Draw (mapstock, 0, 0, picCopy)
    MOVEMENT
    MOVEMENT2
    Pic.Draw (mapmain, 0, 0, picCopy)
    Pic.Draw (box, posx, posy, picMerge)
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
    delay (40)
    %"fps" of 140
end loop

% End Message
cls
put "GG"
