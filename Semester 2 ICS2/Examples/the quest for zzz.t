% ZZZ CPT
% By: Ethan, Joshua

% Setup Game Screen
setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (white)
color (black)
View.Update



var char1 : int
char1 := Pic.FileNew ("spedcharacter.bmp")

var map : int
map := Pic.FileNew ("lvl1.bmp")

var map2 : int
map2 := Pic.FileNew ("test.bmp")

% Chars
var chars : array char of boolean

var posx, posy, posx2, posy2 : int
posx := 100
posy := 100
posx2 := 150
posy2 := 150

var velx, vely, velx2, vely2 : int
velx := 0
vely := 0
velx2 := 0
vely2 := 0

%Gravity!
var gravity : int
gravity := 1

%Health System & Damage System
var HP, dmg, Heal : int
HP := 100
dmg := 10
Heal := 5

%Level Variable
var Lvl : int
Lvl := 1

%Life Counter
var Life : int
Life := 0

%Movement procedure
proc MOVEMENT
    %left and right
    if chars (KEY_RIGHT_ARROW) and whatdotcolour (posx + 45, posy) not= black
		and whatdotcolour (posx + 45, posy + 10) not= black
		and whatdotcolour (posx + 45, posy + 20) not= black
		and whatdotcolour (posx + 45, posy + 30) not= black
	    and whatdotcolour (posx + 45, posy + 40) not= black
	    and posx < 980 then
	%use 'a' for the a key instead
	velx := 10
    elsif chars (KEY_LEFT_ARROW) and whatdotcolour (posx - 10, posy) not= black 
       and whatdotcolour (posx - 10, posy + 20) not= black
	and whatdotcolour (posx - 10, posy + 30) not= black
	 and whatdotcolour (posx - 10, posy + 10) not= black
	    and whatdotcolour (posx - 10, posy + 40) not= black
	    and posx > 0 then
	velx := -10
    else
	velx := 0
    end if

    %up  and down
    if chars (KEY_UP_ARROW)    and (whatdotcolour(posx,posy-10) = black
			       or whatdotcolour(posx+35,posy-10) = black 
			       or posy = 0) then
			       
	vely:=17
    end if 
    
    if chars (KEY_UP_ARROW)    and (whatdotcolour(posx+45,posy) = black
			       or whatdotcolour(posx+45,posy+40) = black 
			       or whatdotcolour(posx-10,posy) = black
			       or whatdotcolour(posx-10,posy+40) = black) then
			       
	
	gravity:=3
    end if    
    


    vely := vely - gravity
    posy := posy + round (vely)
    posx := posx + round (velx)

    %Adding the ground
    if whatdotcolour (posx, posy - 5) = black
	    or whatdotcolour (posx + 20, posy - 5) = black
	    or posy < 0 then
	gravity := 0
	vely := 0
	posy := posy + 1%prevents player from sinking into the ground!
    else
	gravity := 1
    end if

    %Adding the ceiling
    if whatdotcolour (posx, posy + 50) = black
	    or whatdotcolour (posx + 35, posy + 50) = black
	    or posy > 700 then
	vely := -1
    end if



    %Damage system!
    if whatdotcolour (posx + 10, posy + 20) = red then
	HP := HP - dmg
    else
	HP := HP
    end if

    %Healing
    if whatdotcolour (posx, posy) = green then
	HP := HP + Heal
    elsif whatdotcolour (posx + 20, posy) = green then
	HP := HP + Heal
    elsif whatdotcolour (posx + 20, posy + 40) = green then
	HP := HP + Heal
    elsif whatdotcolour (posx, posy + 40) = green then
	HP := HP + Heal
    else
	HP := HP
    end if

    if HP > 100 then
	HP := 100
    end if

    %Teleport
    if whatdotcolour (posx + 16, posy + 20) = blue then
	posx := 21
	posy := 479
    end if
    
    %Level up
    if whatdotcolour (posx + 16, posy + 20) = cyan then
	Lvl := Lvl + 1 
	posx := 100
	posy := 100
    end if 



end MOVEMENT

proc Level1
    cls
    Pic.Draw (map, 0, 0, picCopy)
    MOVEMENT
    Pic.Draw (char1, posx, posy, picMerge)
    drawfillbox(1,745,HP,725,brightgreen)
    drawbox(1,745,100,725,yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level1

proc Level2
    cls
    Pic.Draw (map2, 0, 0, picCopy)
    MOVEMENT
    Pic.Draw (char1, posx, posy, picMerge)
    View.Update
end Level2


%Running the actual game!
loop
    Input.KeyDown (chars)
    %Allows input to come from keys being pressed down
    if chars ('g') then
	exit
	%exit if the player wants to
    end if
    if HP < 1 then
	posx := 100
	posy := 100
	HP := 100
	Life := Life + 1
	if Life = 3 then
	    exit
	end if
	%exit if the player DIES
    end if
    if Lvl = 1 then
	Level1
    elsif Lvl = 2 then
	Level2
    else
	exit
	%Exit if the player WINS
    end if
    delay (50)
    %"fps" of 50
end loop

