%Game Project V1
%By: Mr. Cardona

put "Welcome to the Box Game! Press 'g' to end game!"
put "The game will automatically start in 10 seconds"
put "Move with arrow keys and teleport with space bar!"

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
map1:=Pic.FileNew("BackgroundMap1.bmp")

var map2:int
map2:=Pic.FileNew("BackgroundMap2.bmp")

var colormap1:int
colormap1:=Pic.FileNew("ColorMap1.bmp")

var box:int
box:=Pic.FileNew("CharacterBox.bmp")

var bluebox:int
bluebox:=Pic.FileNew("MrBlue.bmp")

var Circle:int
Circle:=Pic.FileNew("circle.bmp")

%Movement & Position
var chars:array char of boolean
%Variable 'Chars' will be using keyboard inputs

var posx, posy,posx2,posy2:int
posx:=100
posy:=100
posx2:=150
posy2:=150

var velx, vely,velx2,vely2:int
velx:=0
vely:=0
velx2:=0
vely2:=0

%Gravity!
var gravity:int
gravity:=1

%Health System & Damage System
var HP, dmg,Heal:int
HP:=100
dmg:=10
Heal:=5

%Level Variable
var Lvl:int
Lvl:=1

%Life Counter
var Life:int
Life:=0

%Variable for MOVING thing
var posxC,posyC:int
posxC:=100
posyC:=100

var velxC:int
velxC:=10

%Procedure for moving thign! 
proc MovingCircle
    posxC:=posxC+velxC
    if posxC>=maxx or posxC<=0 then
	velxC:=-velxC
    end if
end MovingCircle

%Movement procedure
proc MOVEMENT
    %left and right
    if chars (KEY_RIGHT_ARROW) and whatdotcolour(posx+30,posy) not = black
			       and whatdotcolour(posx+30,posy+40) not = black 
			       and posx < 980 then 
	%use 'a' for the a key instead
	velx:=10
    elsif chars (KEY_LEFT_ARROW)and whatdotcolour(posx-10,posy) not = black
				and whatdotcolour(posx-10,posy+40) not = black
				and posx > 0 then
	velx:=-10
    else
	velx:=0
    end if 
    
    %up  and down
    if chars (KEY_UP_ARROW)    and (whatdotcolour(posx,posy-10) = black
			       or whatdotcolour(posx+20,posy-10) = black 
			       or posy = 0) then
			       
	vely:=20
    end if 
    
    if chars (KEY_UP_ARROW)    and (whatdotcolour(posx+30,posy) = black
			       or whatdotcolour(posx+30,posy+40) = black 
			       or whatdotcolour(posx-10,posy) = black
			       or whatdotcolour(posx-10,posy+40) = black) then
			       
	vely:=10
	gravity:=1
    end if    
    
    
    vely:=vely-gravity
    posy:=posy+round(vely)  
    posx:=posx+round(velx)
    
    %Adding the ground
    if  whatdotcolour(posx, posy - 5) = black 
	or whatdotcolour(posx+20,posy-5) = black
	or posy < 0 then
	gravity:=0
	vely:=0
	posy:=posy+1 %prevents player from sinking into the ground!
    else
	gravity:=1
    end if
    
    %Adding the ceiling
    if  whatdotcolour(posx, posy + 45) = black 
	or whatdotcolour(posx+20,posy+45) = black
	or posy > 710 then
	vely:=-1
    end if
    
    %Falling Velocity - Limit
    if vely < -10 then
	vely:=-10
	HP:=HP-1 %Fall Dmg
    end if
    
    %Damage system!
    if whatdotcolour(posx+10,posy+20) = red then
	HP:=HP - dmg
    else
	HP:=HP
    end if
    
    %Healing
    if whatdotcolour(posx,posy) = green then
	HP:=HP + Heal
    elsif whatdotcolour(posx+20,posy) = green then
	HP:=HP + Heal
    elsif whatdotcolour(posx+20,posy+40) = green then
	HP:=HP + Heal
    elsif whatdotcolour(posx,posy+40) = green then
	HP:=HP + Heal
    else
	HP:=HP
    end if
    
    if HP > 100 then
	HP:=100
    end if
    
    %Teleportation
    if whatdotcolour(posx+10,posy+20) = blue and chars(' ') then
						   %only active for space bar!
	posx:=300
	posy:=350
    end if
    
    %Level up system!
    if whatdotcolour(posx+10,posy+20) = yellow and chars(' ') then
						   %only active for space bar!
	posx:=100
	posy:=100
	Lvl:=Lvl+1
    end if
    
end MOVEMENT

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
    
end MOVEMENT2
	
%GAME procedure
proc Level1
    cls
    Pic.Draw(map1,0,0,picCopy)
    MovingCircle
    Draw.FillOval(posxC,posyC,25,35,red)
    MOVEMENT
    MOVEMENT2
    %Pic.Draw(colormap1,0,0,picCopy)
    Pic.Draw(Circle,posxC-25,posyC-35,picMerge)
    %RADIUS of circle is the adjustment factor
    %Add movement procedure BEFORE the character
    Pic.Draw(box,posx,posy,picMerge)
    %Pic.Draw(bluebox,posx2,posy2,picMerge)
    drawfillbox(1,745,HP,725,brightgreen)
    drawbox(1,745,100,725,yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level1

%Level 2 procedure
proc Level2
    cls
    Pic.Draw(map2,0,0,picCopy)
    MOVEMENT
    MOVEMENT2
    %Pic.Draw(colormap1,0,0,picCopy)
    %Add movement procedure BEFORE the character
    Pic.Draw(box,posx,posy,picMerge)
    Pic.Draw(bluebox,posx2,posy2,picMerge)
    drawfillbox(1,745,HP,725,brightgreen)
    drawbox(1,745,100,725,yellow)
    %(xStart,ystart,xEnd,yEnd)
    View.Update
end Level2

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
    put "CONGRATS YOU WIN!"
elsif Life = 3 then
    put "YOU LOST!"
else
    put "Good game! (gg), thank you for playing!"
end if
