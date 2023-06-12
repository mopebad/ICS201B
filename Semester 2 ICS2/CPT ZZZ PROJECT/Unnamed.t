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

% Chars
var chars : array char of boolean

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
    
    
    
end MOVEMENT

proc Level1
    cls
    Pic.Draw(map,0,0,picCopy)
    MOVEMENT
    Pic.Draw(char1,posx,posy,picMerge)
    View.Update
end Level1


%Running the actual game! 
loop
    Input.KeyDown(chars)
    %Allows input to come from keys being pressed down
    if chars('g') then
	exit
	%exit if the player wants to
    end if
    Level1
    if HP < 1 then
	posx:=100
	posy:=100
	HP:=100
	
	end if
	delay(50)
    %"fps" of 50 
end loop
