% 30 by 120

% ZZZQUEST

% Sets up window
var winID : int := Window.Open("graphics:1000;750,offscreenonly,nobuttonbar,title:ZZZQUEST")

% Type used for points and vectors
type Vector2:
    record
	x : real
	y : real
    end record
    
var Lvl : int
Lvl :=1



%Variable for platform
var posxC, posyC : int
posxC := 220
posyC := 160

var velxC : int
velxC := 15

proc Movingplatform
    posxC := posxC + velxC
    if posxC >= 728 or posxC <= 0 then
	velxC := -velxC
    end if
end Movingplatform

% Importing maps and others
var map1 : int := Pic.FileNew("lvl1.bmp")

var map2 : int := Pic.FileNew("lvl2.bmp")

var map3 : int := Pic.FileNew("lvl3.bmp")

var char1 : int := Pic.FileNew("mopebad.bmp")


var Message : int := Pic.FileNew ("message.bmp")

% Holds key data
var keys : array char of boolean
var preKeys : array char of boolean
Input.KeyDown(keys)
preKeys := keys

% Position and velocity of the player
var pos : Vector2
pos.x := 30; pos.y := 120
var vel : Vector2
vel.x := 0; vel.y := 0

% Position of the camera
var cam : Vector2
cam.x := 0; cam.y := 0

% Size of the player
var size : Vector2
size.x := 22; size.y := 22

% Collision booleans and directions
var isTouchingGround : boolean := false
var isTouchingWall : boolean := false
var wallDir : int := 0

% Player
proc fillbox (x : real, y : real, x2 : real, y2 : real, c : int)
    Draw.FillBox(round(x + cam.x), round(y + cam.y), round(x2 + cam.x), round(y2 + cam.y), c)
end fillbox

% Draws a nonexistent box for the outside of the map.
colourback(black)
fillbox(0, 0, 0, 0, RGB.AddColor(0.01, 0.01, 0.01))

% Music
%process DoMusic
   % loop
       % Music.PlayFile ("Music2.mp3")
   % end loop
%end DoMusic

%fork DoMusic

proc MOVEMENT 

    % Move dependent of collision with level and what keys are down

    if (isTouchingGround) then
	if (keys(' ') and ~preKeys(' ')) then
	    vel.y += 16
	end if
    
	if (keys('a')) then
	    vel.x -= 1
	end if
	if (keys('d')) then
	    vel.x += 1
	end if
    else
	if (isTouchingWall) then
	    if (keys(' ') and ~preKeys(' ')) then
		vel.y += 16
		vel.x += 7 * wallDir
	    end if
	end if
    
	if (keys('a')) then
	    vel.x -= 0.1
	end if
	if (keys('d')) then
	    vel.x += 0.1
	end if
    end if
    
    % By default isTouchingGround is false
    isTouchingGround := false
    
    % If moving left
    if (round(vel.x) < 0) then
	% Does the player hit a wall?
	if (whatdotcolour(round(pos.x + vel.x - size.x + cam.x), round(pos.y - size.y + cam.y)) = black or whatdotcolour(round(pos.x + vel.x - size.x + cam.x), round(pos.y + size.y + cam.y)) = black) then
	    % Find where the player hit the wall
	    for i : round(vel.x) .. 0
		if (whatdotcolour(round(pos.x + i - size.x + cam.x), round(pos.y - size.y + cam.y)) ~= black and whatdotcolour(round(pos.x + i - size.x + cam.x), round(pos.y + size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.x := round(pos.x) + i;
		end if
	    end for
	
	    isTouchingWall := true
	    wallDir := 1
	    
	    vel.x := 0
	else
	    pos.x += vel.x
	    isTouchingWall := false
	end if
    % If moving right
    elsif (round(vel.x) > 0) then
	% Does the player hit a wall?
	if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = black or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = black) then
	    % Find where the player hit the wall
	    for decreasing i : round(vel.x) .. 0
		if (whatdotcolour(round(pos.x + i + size.x + cam.x), round(pos.y - size.y + cam.y)) ~= black and whatdotcolour(round(pos.x + i + size.x + cam.x), round(pos.y + size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.x := round(pos.x) + i;
		end if
	    end for
	
	    isTouchingWall := true
	    wallDir := -1
	    
	    vel.x := 0
	else
	    pos.x += vel.x
	    isTouchingWall := false
	end if
    % In case the player jumps with a wall beside it
    else
	% Check if there is a wall beside the player
	if (whatdotcolour(round(pos.x - 1 - size.x + cam.x), round(pos.y - size.y + cam.y)) = black or whatdotcolour(round(pos.x - 1 - size.x + cam.x), round(pos.y + size.y + cam.y)) = black or whatdotcolour(round(pos.x + 1 + size.x + cam.x), round(pos.y - size.y + cam.y)) = black or whatdotcolour(round(pos.x + 1 + size.x + cam.x), round(pos.y + size.y + cam.y)) = black) then
	    isTouchingWall := true
	else
	    isTouchingWall := false
	end if
    end if

    % If moving down
    if (vel.y < 0) then
	% Does the player hit a floor?
	if (whatdotcolour(round(pos.x - size.x + cam.x), round(pos.y + vel.y - size.y + cam.y)) = black or whatdotcolour(round(pos.x + size.x + cam.x), round(pos.y + vel.y - size.y + cam.y)) = black) then
	    % Find where the player hit the floor
	    for i : round(vel.y) .. 0
		if (whatdotcolour(round(pos.x - size.x + cam.x), round(pos.y + i - size.y + cam.y)) ~= black and whatdotcolour(round(pos.x + size.x + cam.x), round(pos.y + i - size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.y := round(pos.y) + i;
		end if
	    end for
	    
	    isTouchingGround := true
	    
	    vel.y := 0
	else
	    pos.y += vel.y
	end if
    % If moving up
    elsif (vel.y > 0) then
	% Does the player hit a ceiling?
	if (whatdotcolour(round(pos.x - size.x + cam.x), round(pos.y + vel.y + size.y + cam.y)) = black or whatdotcolour(round(pos.x + size.x + cam.x), round(pos.y + vel.y + size.y + cam.y)) = black) then
	    % Find where the player hit the ceiling
	    for decreasing i : round(vel.y) .. 0
		if (whatdotcolour(round(pos.x - size.x + cam.x), round(pos.y + i + size.y + cam.y)) ~= black and whatdotcolour(round(pos.x + size.x + cam.x), round(pos.y + i + size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.y := round(pos.y) + i;
		end if
	    end for
	    
	    vel.y := 0
	else
	    pos.y += vel.y
	end if
    end if
    
    % Move camera to center it on the player
    cam.x -= round((pos.x + cam.x - maxx / 2) / 10)
    cam.y -= round((pos.y + cam.y - maxy / 2) / 10)
    
    % Move downward to simulate gravity, less when against a wall
    if (isTouchingWall and vel.y < 0) then
	vel.y -= 9.8 / 43
    else
	vel.y -= 9.8 / 10
    end if
    
    % Set a maximum speed, less against a wall
    if (isTouchingWall) and (vel.y < -10) then
	vel.y := -10
    end if
    
    if (vel.y < -15) then
	vel.y := -15
    elsif (vel.y > 15) then
	vel.y := 15
    end if
    
    if (vel.x < -15) then
	vel.x := -15
    elsif (vel.x > 15) then
	vel.x := 15
    end if
    
    % Simulates friction
    if (isTouchingGround) then
	vel.x /= 1.2
    end if

    % Sets previous key states to the current key states
    preKeys := keys
    
  
    
    %Teleport
 if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = blue
 or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = blue) then
    pos.x := 21 
    pos.y := 479
    cam.x := 0
    cam.y := 0
end if

 %Lvl up
 if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = green
 or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = green) then
  Lvl := Lvl + 1 
  
   pos.x := 50
    pos.y := 250
    cam.x := 0
    cam.y := 0
end if

if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = green
 or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = green) and Lvl = 2 then
  Lvl := Lvl + 1 
  
    pos.x := 43
    pos.y := 283
    cam.x := 0
    cam.y := 0
end if


 %Death system!
    if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = brightred
 or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = brightred) and Lvl = 1 then
   Lvl := 1
    pos.x := 40
    pos.y := 120
    cam.x := 0
    cam.y := 0
    end if
    if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = brightred
 or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = brightred) and Lvl = 2 then
   Lvl := 2
    pos.x := 56
    pos.y := 250
    cam.x := 0
    cam.y := 0
    end if
    if (whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y - size.y + cam.y)) = brightred
 or whatdotcolour(round(pos.x + vel.x + size.x + cam.x), round(pos.y + size.y + cam.y)) = brightred) and Lvl = 3 then
   Lvl := 3
    pos.x := 56
    pos.y := 250
    cam.x := 0
    cam.y := 0
    end if
 

% Delays
    Time.DelaySinceLast(17)
Window.Update(winID)

end MOVEMENT


proc Level1
    cls
    Pic.Draw(map1, round(cam.x), round(cam.y), picCopy)
    fillbox(pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, cyan)
    MOVEMENT
    if Lvl = 1 then
    drawfillbox(0, 0, 1000, 100, white)
    Pic.Draw(Message, 160, -5, picMerge)
    end if
    View.Update
end Level1

proc Level2
    cls
    Pic.Draw(map2, round(cam.x), round(cam.y), picCopy)
    % Draws player
    fillbox(pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, cyan)
    MOVEMENT
    View.Update
end Level2

proc Level3
    cls
    Pic.Draw(map3, round(cam.x), round(cam.y), picCopy)
    % Draws player
    fillbox(pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, cyan)
    
    MOVEMENT
    
    View.Update
end Level3



loop
% Get keyboard state
    Input.KeyDown(keys)
    
    % Exit when esc is pressed
    exit when keys(KEY_ESC)
    if Lvl = 1 then
	Level1
    elsif Lvl = 2 then
	Level2
    elsif Lvl = 3 then
	Level3
    end if
end loop



% Close the window once the program finishes
Window.Close(winID)
