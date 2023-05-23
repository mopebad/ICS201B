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

var char1 : int
char1 := Pic.FileNew("mopebad.bmp")

var char2 : int
char2 := Pic.FileNew("eattai.bmp")

var char3 : int
char3 := Pic.FileNew("nightmangoon.bmp")

var mainmap : int
mainmap := Pic.FileNew("mainmap.bmp")

var mainmap2 : int
mainmap2 := Pic.FileNew("mainmap2.bmp")

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

% GAME procedure
proc Level1
    cls
    Pic.Draw(mainmap, 0, 0, picCopy)
    % MOVEMENT
    % Add movement procedure BEFORE the character
    Pic.Draw(char1, posx, posy, picMerge)
    Pic.Draw(char2, posx2, posy2, picMerge)
    drawfillbox(1, 745, HP, 725, brightgreen)
    drawbox(1, 745, 100, 725, yellow)
    %(xStart, yStart, xEnd, yEnd)
    View.Update
end Level1

proc GameLoop
    loop
	Input.KeyDown(chars)
	% Allows input to come from keys being pressed down
	if chars(' ') then
	    posx := 100
	    posy := 100
	    Lvl := Lvl + 1
	    if Lvl = 1 then
		Level1
	    end if
	end if
	delay(10)
    end loop
end GameLoop


%Running the actual game! 
loop
    Input.KeyDown(chars)
    %Allows input to come from keys being pressed down
    if chars('g') then
	exit
	%exit if the player wants to
    end if
    if HP < 1 then
	posx:=100
	posy:=100
	HP:=100
	Life:=Life+1
	if Life = 3 then
	    exit
	end if
	%exit if the player DIES
    end if
    if Lvl=1 then
	Level1
    elsif Lvl=2 then
      Level2
    else
	exit
	%Exit if the player WINS
    end if
    delay(50)
    %"fps" of 50 
end loop

%End Message
cls
if Lvl = 3 then
    put "YOU ESCAPED NIGHTMAN!"
elsif Life = 3 then
    put "NIGHTMAN CAUGHT YOU!"
else
    put "Good game! (gg), thank you for playing!"
end if




% Title Screen
proc titlesrc
    Pic.Draw(maptitle, 0, 0, picCopy)
    View.Update
end titlesrc

titlesrc
GameLoop
