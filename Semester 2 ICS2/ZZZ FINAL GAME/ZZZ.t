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
room2color := Pic.FileNew ("Room2color.bmp")

var room2main : int
room2main := Pic.FileNew ("Room2main.bmp")

var room1main : int
room1main := Pic.FileNew ("Room1main.bmp")

% Health System & Damage System
var HP, HP2, dmg, Heal : int
HP := 100
HP2 := 100
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
posxC3 := 980
posyC3 := 700
var posxC4, posyC4 : int
posxC4 := 900
posyC4 := 700
var posxC5, posyC5 : int
posxC5 := 820
posyC5 := 670
var posxC6, posyC6 : int
posxC6 := 750
posyC6 := 700
var posxC7, posyC7 : int
posxC7 := 550
posyC7 := 700
var posxC8, posyC8 : int
posxC8 := 350
posyC8 := 700
var posxC9, posyC9 : int
posxC9 := 150
posyC9 := 700

var velxC : int
velxC := 15
var velxC2 : int
velxC2 := 10
var velyC3 : int
velyC3 := 17
var velyC4 : int
velyC4 := 15
var velyC5 : int
velyC5 := 20
var velyC6 : int
velyC6 := 15
var velyC7 : int
velyC7 := 11
var velyC8 : int
velyC8 := 25
var velyC9 : int
velyC9 := 35



%Procedure for moving enemies

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
    if posyC3 >= 720 or posyC3 <= 20 then
	velyC3 := -velyC3
    end if
end MovingCircle3

proc MovingCircle4
    posyC4 := posyC4 + velyC4
    if posyC4 >= 720 or posyC4 <= 20 then
	velyC4 := -velyC4
    end if
end MovingCircle4

proc MovingCircle5
    posyC5 := posyC5 + velyC5
    if posyC5 >= 720 or posyC5 <= 20 then
	velyC5 := -velyC5
    end if
end MovingCircle5

proc MovingCircle6
    posyC6 := posyC6 + velyC6
    if posyC6 >= 720 or posyC6 <= 20 then
	velyC6 := -velyC6
    end if
end MovingCircle6

proc MovingCircle7
    posyC7 := posyC7 + velyC7
    if posyC7 >= 720 or posyC7 <= 20 then
	velyC7 := -velyC7
    end if
end MovingCircle7

proc MovingCircle8
    posyC8 := posyC8 + velyC8
    if posyC8 >= 720 or posyC8 <= 20 then
	velyC8 := -velyC8
    end if
end MovingCircle8

proc MovingCircle9
    posyC9 := posyC9 + velyC9
    if posyC9 >= 720 or posyC9 <= 20 then
	velyC9 := -velyC9
    end if
end MovingCircle8



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

    if HP > 100 then
	HP := 100
    end if

    %Room System
    if whatdotcolour (posx + 10, posy + 20) = green then
	posx := 940
	posy := 660
	Lvl := 3
    end if

    if whatdotcolour (posx + 10, posy + 20) = blue then
	posx := 940
	posy := 660
	Lvl := 5
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

    %Teleport to the exit

    if whatdotcolor (posx + 10, posy + 20) = purple then
	posx := 870
	posy := 63
    end if

end MOVEMENT

proc MOVEMENT2
    %left and right
    if chars ('d') and whatdotcolour (posx2 + 70, posy2) not= black
	    and whatdotcolour (posx2 + 70, posy2 + 80) not= black
	    and posx2 < (maxx - 60) then
	%use 'a' for the a key instead
	velx2 := 10
    elsif chars ('a') and whatdotcolour (posx2 - 10, posy2) not= black
	    and whatdotcolour (posx2 - 10, posy2 + 80) not= black
	    and posx2 > 0 then
	velx2 := -10
    else
	velx2 := 0
    end if

    %up  and down
    if chars ('s') and whatdotcolour (posx2, posy2 - 10) not= black
	    and whatdotcolour (posx2 + 60, posy2 - 10) not= black
	    and posy2 > 0 then
	%use 'a' for the a key instead
	vely2 := -10
    elsif chars ('w') and whatdotcolour (posx2, posy2 + 90) not= black
	    and whatdotcolour (posx2 + 60, posy2 + 90) not= black
	    and posy2 < (maxy - 80) then
	vely2 := 10
    else
	vely2 := 0
    end if


    posy2 := posy2 + round (vely2)
    posx2 := posx2 + round (velx2)

    if Lvl = 3 then
	posx2 := 650
	posy2 := 485
    end if

    %Damage system!
    if whatdotcolour (posx2 + 30, posy2 + 40) = red then
	HP2 := HP2 - dmg
    else
	HP2 := HP2
    end if



    if HP2 > 100 then
	HP2 := 100
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
	Music.PlayFile ("Music2.mp3")
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
    Draw.FillOval (posxC2, posyC2, 28, 43, red)
    MovingCircle2
    Draw.FillOval (posxC, posyC, 28, 43, red)
    MovingCircle
    Draw.FillOval (posxC3, posyC3, 28, 43, red)
    MovingCircle3
    Draw.FillOval (posxC4, posyC4, 28, 43, red)
    MovingCircle4
    Draw.FillOval (posxC5, posyC5, 28, 43, red)
    MovingCircle5
    MOVEMENT
    Pic.Draw (mainmapcolor, 0, 0, picCopy)
    Pic.Draw (Circle, posxC - 30, posyC - 35, picMerge)
    Pic.Draw (Circle, posxC2 - 30, posyC2 - 35, picMerge)
    Pic.Draw (Circle, posxC3 - 30, posyC3 - 35, picMerge)
    Pic.Draw (Circle, posxC4 - 30, posyC4 - 35, picMerge)
    Pic.Draw (Circle, posxC5 - 30, posyC5 - 35, picMerge)
    Pic.Draw (char1, posx, posy, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    drawfillbox (1, 720, HP2, 700, brightgreen)
    drawbox (1, 720, 100, 700, yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level2

proc Level4 % Back to the mainmap after going into the room
    cls
    Pic.Draw (mainmap, 0, 0, picCopy)
    Draw.FillOval (posxC2, posyC2, 25, 35, red)
    MovingCircle2
    Draw.FillOval (posxC, posyC, 25, 35, red)
    MovingCircle
    Draw.FillOval (posxC3, posyC3, 25, 35, red)
    MovingCircle3
    Draw.FillOval (posxC4, posyC4, 25, 35, red)
    MovingCircle4
    Draw.FillOval (posxC5, posyC5, 25, 35, red)
    MovingCircle5
    MOVEMENT
    MOVEMENT2
    Pic.Draw (mainmapcolor, 0, 0, picCopy)
    Pic.Draw (Circle, posxC - 30, posyC - 35, picMerge)
    Pic.Draw (Circle, posxC2 - 30, posyC2 - 35, picMerge)
    Pic.Draw (Circle, posxC3 - 30, posyC3 - 35, picMerge)
    Pic.Draw (Circle, posxC4 - 30, posyC4 - 35, picMerge)
    Pic.Draw (Circle, posxC5 - 30, posyC5 - 35, picMerge)
    Pic.Draw (char1, posx, posy, picMerge)
    Pic.Draw (char2, posx2, posy2, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    drawfillbox (1, 720, HP2, 700, brightgreen)
    drawbox (1, 720, 100, 700, yellow)
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
    drawfillbox (1, 720, HP2, 700, brightgreen)
    drawbox (1, 720, 100, 700, yellow)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
end Level3


proc Level5
    cls
    Pic.Draw (room1main, 0, 0, picCopy)
    Draw.FillOval (posxC9, posyC9, 28, 43, red)
    MovingCircle9
    Draw.FillOval (posxC6, posyC6, 28, 43, red)
    MovingCircle6
    Draw.FillOval (posxC7, posyC7, 28, 43, red)
    MovingCircle7
    Draw.FillOval (posxC8, posyC8, 28, 43, red)
    MovingCircle8
    MOVEMENT
    Pic.Draw (Circle, posxC6 - 30, posyC6 - 35, picMerge)
    Pic.Draw (Circle, posxC7 - 30, posyC7 - 35, picMerge)
    Pic.Draw (Circle, posxC8 - 30, posyC8 - 35, picMerge)
    Pic.Draw (Circle, posxC9 - 30, posyC9 - 35, picMerge)
    Pic.Draw (char1, posx, posy, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    View.Update
end Level5

proc Level6
    cls
    Pic.Draw (mainmap2, 0, 0, picCopy)
    MOVEMENT
    MOVEMENT2
    Pic.Draw (char1, posx, posy, picMerge)
    Pic.Draw (char2, posx2, posy2, picMerge)
    drawfillbox (1, 745, HP, 725, brightgreen)
    drawbox (1, 745, 100, 725, yellow)
    drawfillbox (1, 720, HP2, 700, brightgreen)
    drawbox (1, 720, 100, 700, yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level6


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
    end if
    if Life = 3 then
	exit
    end if
    if HP2 < 1 then
	posx2 := 30
	posy2 := 30
	HP2 := 100
	Life := Life + 1
	if Life = 3 then
	    exit
	end if
    end if

    %exit if the player DIES

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
    elsif Lvl = 6 then
	Level6
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
    put "gg."
end if





