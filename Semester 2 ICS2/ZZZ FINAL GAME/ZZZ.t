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

var room2color : int
room2color := Pic.FileNew ("room2color.bmp")

var room2main : int
room2main := Pic.FileNew ("room2main.bmp")


% Health System & Damage System
var HP, dmg, Heal : int
HP := 100
dmg := 12
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
var posxC3, posyC3 : int
posxC3 := 950
posyC3 := 700

var velxC : int
velxC := 15
var velxC2 : int
velxC2 := 10
var velyC3 :int
velyC3 := 15
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

proc MovingCircle3
    posyC3 := posyC3 + velyC3
    if posyC3 >= 750 or posyC3 <= 0 then
	velyC3 := -velyC3
    end if
end MovingCircle3



% Movement & Position (chars = characters)
var chars : array char of boolean

var posx, posy, posx2, posy2, posx2b, posy2b : int
posx := 10
posy := 610
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

    %Room System
    if whatdotcolour (posx + 10, posy + 20) = green then
	%only active for space bar!
	posx := 940
	posy := 690
	Lvl := Lvl + 1
    end if

    %Going back to main level
    if whatdotcolour (posx + 10, posy + 20) = yellow then
	%only active for space bar!
	posx := 580
	posy := 594
	posx2 := 640
	posy2 := 630
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

    if Lvl = 3 then
	posx2 := 665
	posy2 := 508
    end if

end MOVEMENT2


%GAME procedure
proc title

    if chars (' ') then
	%only active for space bar!
	posx := 50
	posy := 40
	Lvl := Lvl + 1

    end if



end title

process DoMusic
    loop
	Music.PlayFile ("Music1.mp3")
    end loop
end DoMusic

fork DoMusic

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
    Draw.FillOval (posxC3, posyC3, 25, 35, red)
    MovingCircle3
    MOVEMENT
    Pic.Draw (mainmapcolor, 0, 0, picCopy)
    Pic.Draw (Circle, posxC - 30, posyC - 35, picMerge)
    Pic.Draw (Circle, posxC2 - 30, posyC2 - 35, picMerge)
    Pic.Draw (Circle, posxC3 - 30, posyC3 - 35, picMerge)
    Pic.Draw (char1, posx, posy, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level2

proc Level4
    cls
    Pic.Draw (mainmap, 0, 0, picCopy)
    Draw.FillOval (posxC2, posyC2, 25, 35, red)
    MovingCircle2
    Draw.FillOval (posxC, posyC, 25, 35, red)
    MovingCircle
    Draw.FillOval (posxC3, posyC3, 25, 35, red)
    MovingCircle3
    MOVEMENT
    MOVEMENT2
    Pic.Draw (mainmapcolor, 0, 0, picCopy)
    Pic.Draw (Circle, posxC - 30, posyC - 35, picMerge)
    Pic.Draw (Circle, posxC2 - 30, posyC2 - 35, picMerge)
    Pic.Draw (Circle, posxC3 - 30, posyC3 - 35, picMerge)
    Pic.Draw (char1, posx, posy, picMerge)
    Pic.Draw (char2, posx2, posy2, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level4


proc Level3
    cls
    Pic.Draw (room2main, 0, 0, picCopy)
    MOVEMENT
    MOVEMENT2
    Pic.Draw (room2color, 0, 0, picCopy)
    Pic.Draw (char1, posx, posy, picMerge)
    Pic.Draw (char2, posx2, posy2, picMerge)
    View.Update
end Level3



proc Level5
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
end Level5


%Running the actual game!
loop
    Input.KeyDown (chars)
    %Allows input to come from keys being pressed down
    if chars ('g') then
	exit
	%exit if the player wants to
    end if
    if HP < 1 then
	posx := 30
	posy := 30
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
    elsif Lvl = 4 then
	Level4
    elsif Lvl = 5 then
	Level5
    else
	exit
	%Exit if the player WINS
    end if
    delay (50)
    %"fps" of 50
end loop

%End Message
cls
if Lvl = 5 then
    put "CONGRATS YOU WIN!"
elsif Life = 3 then
    put "YOU LOST!"
else
    put "Good game! (gg), thank you for playing!"
end if





