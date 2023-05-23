% ZZZ FINAL
% By: Joshua, Ethan.

% Setup Game Screen
setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (white)
color (black)
View.Update

% Inserting Map & Character
var maptitle : int
maptitle := Pic.FileNew ("press space to continue.bmp")

var char1 : int
char1 := Pic.FileNew ("mopebad.bmp")

var char2 : int
char2 := Pic.FileNew ("eattai.bmp")

var char3 : int
char3 := Pic.FileNew ("nightmangoon.bmp")

var mainmap : int
mainmap := Pic.FileNew ("mainmap.bmp")

var mainmap2 : int
mainmap2 := Pic.FileNew ("mainmap2.bmp")

var Circle : int
Circle := Pic.FileNew ("nightmangoon.bmp")

var mainmapcolor : int
mainmapcolor := Pic.FileNew ("mainmapcolor.bmp")


% Health System & Damage System
var HP, dmg, Heal : int
HP := 100
dmg := 10
Heal := 5

% Level Variable
var Lvl : int
Lvl := 1

% Life Counter
var Life : int
Life := 0

%Variable for MOVING thing
var posxC, posyC : int
posxC := 220
posyC := 160
var posxC2, posyC2 : int
posxC2 := 360
posyC2 := 35

var velxC : int
velxC := 15
var velxC2 : int
velxC2 := 10
%Procedure for moving thign!
proc MovingCircle
    posxC := posxC + velxC
    if posxC >= 728 or posxC <= 0 then
	velxC := -velxC
    end if
end MovingCircle

proc MovingCircle2
    posxC2 := posxC2 + velxC2
    if posxC2 >= 728 or posxC2 <= 120 then
	velxC2 := -velxC2
    end if
end MovingCircle2




% Movement & Position (chars = characters)
var chars : array char of boolean

var posx, posy, posx2, posy2 : int
posx := 20
posy := 590
posx2 := 60
posy2 := 590

var velx, vely, velx2, vely2 : int
velx := 0
vely := 0
velx2 := 0
vely2 := 0

%Movement procedure 60 x80
proc MOVEMENT
    %left and right
    if chars (KEY_RIGHT_ARROW) and whatdotcolour (posx + 67, posy) not= black
	    and whatdotcolour (posx + 67, posy + 80) not= black
	    and posx < (maxx - 57) then
	%use 'a' for the a key instead
	velx := 10
    elsif chars (KEY_LEFT_ARROW) and whatdotcolour (posx - 10, posy) not= black
	    and whatdotcolour (posx - 10, posy + 80) not= black
	    and posx > 0 then
	velx := -10
    else
	velx := 0
    end if

    %up  and down
    if chars (KEY_DOWN_ARROW) and whatdotcolour (posx, posy - 10) not= black
	    and whatdotcolour (posx + 57, posy - 10) not= black
	    and whatdotcolour (posx + 30, posy - 10) not= black
	    and posy > 0 then
	%use 'a' for the a key instead
	vely := -10
    elsif chars (KEY_UP_ARROW) and whatdotcolour (posx, posy + 90) not= black
	    and whatdotcolour (posx + 57, posy + 90) not= black
	    and whatdotcolour (posx + 30, posy + 90) not= black
	    and posy < (maxy - 80) then
	%750 is max y value, - 40 for character height
	vely := 10
    else
	vely := 0
    end if

    posy := posy + round (vely)
    posx := posx + round (velx)

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

    %Teleportation
    if whatdotcolour (posx + 10, posy + 20) = blue and chars (' ') then
	%only active for space bar!
	posx := 300
	posy := 350
    end if

    %Level up system!
    if whatdotcolour (posx + 10, posy + 20) = yellow and chars (' ') then
	%only active for space bar!
	posx := 100
	posy := 100
	Lvl := Lvl + 1
    end if

end MOVEMENT

proc MOVEMENT2
    %left and right
    if chars ('d') and whatdotcolour (posx2 + 30, posy2) not= black
	    and whatdotcolour (posx2 + 30, posy2 + 40) not= black then
	%use 'a' for the a key instead
	velx2 := 10
    elsif chars ('a') and whatdotcolour (posx2 - 10, posy2) not= black
	    and whatdotcolour (posx2 - 10, posy2 + 40) not= black then
	velx2 := -10
    else
	velx2 := 0
    end if

    %up  and down
    if chars ('s') and whatdotcolour (posx2, posy2 - 10) not= black
	    and whatdotcolour (posx2 + 20, posy2 - 10) not= black then
	%use 'a' for the a key instead
	vely2 := -10
    elsif chars ('w') and whatdotcolour (posx2, posy2 + 50) not= black
	    and whatdotcolour (posx2 + 20, posy2 + 50) not= black then
	vely2 := 10
    else
	vely2 := 0
    end if

    posy2 := posy2 + round (vely2)
    posx2 := posx2 + round (velx2)

end MOVEMENT2


%GAME procedure
proc title
    if chars (' ') then
	%only active for space bar!
	posx := 100
	posy := 100
	Lvl := Lvl + 1
    end if
end title


% Title Screen
proc Level1
    Pic.Draw (maptitle, 0, 0, picCopy)
    title
    View.Update
end Level1



proc Level2
    cls
    Pic.Draw (mainmap, 0, 0, picCopy)
    Draw.FillOval (posxC2, posyC2, 25, 35, red)
    MovingCircle2
    Draw.FillOval (posxC, posyC, 25, 35, red)
    MovingCircle
    MOVEMENT
    MOVEMENT2
    Pic.Draw (mainmapcolor, 0, 0, picCopy)
    Pic.Draw (Circle, posxC - 30, posyC - 35, picMerge)
    Pic.Draw (Circle, posxC2 - 30, posyC2 - 35, picMerge)
    Pic.Draw (char1, posx, posy, picMerge)
    Pic.Draw (char2, posx2, posy2, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level2

%Level 2 procedure
proc Level3
    cls
    Pic.Draw (mainmap2, 0, 0, picCopy)
    MOVEMENT
    MOVEMENT2
    Pic.Draw (char1, posx, posy, picMerge)
    Pic.Draw (char2, posx2, posy2, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level3


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
    elsif Lvl = 3 then
	Level3
    else
	exit
	%Exit if the player WINS
    end if
    delay (50)
    %"fps" of 50
end loop

%End Message
cls
if Lvl = 3 then
    put "CONGRATS YOU WIN!"
elsif Life = 3 then
    put "YOU LOST!"
else
    put "Good game! (gg), thank you for playing!"
end if






