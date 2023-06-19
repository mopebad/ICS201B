% ZZZQUEST

% Sets up window
var winID : int := Window.Open ("graphics:1000;750,offscreenonly,nobuttonbar,title:ZZZQUEST")

% Type used for points and vectors
type Vector2 :
    record
	x : real
	y : real
    end record

var Lvl : int
Lvl := 1

% Importing maps and others
var map1 : int := Pic.FileNew ("lvl1.bmp")

var map2 : int := Pic.FileNew ("lvl2.bmp")

var map3 : int := Pic.FileNew ("lvl3.bmp")

var map4 : int := Pic.FileNew ("lvl4v2.bmp")

var map1color : int := Pic.FileNew ("lvl1colour.bmp")

var map2color : int := Pic.FileNew ("lvl2colour.bmp")

var char1 : int := Pic.FileNew ("mopebad.bmp")

var titlemain : int := Pic.FileNew ("TITLE1.bmp")

var end1 : int := Pic.FileNew ("END1.bmp")

var map3color : int := Pic.FileNew ("lvl3colour.bmp")

var map4color : int := Pic.FileNew ("lvl4colour.bmp")

var Message : int := Pic.FileNew ("message.bmp")


% Holds key data
var keys : array char of boolean
var preKeys : array char of boolean
Input.KeyDown (keys)
preKeys := keys

% Position and velocity of the player
var pos : Vector2
pos.x := 30
pos.y := 120
var vel : Vector2
vel.x := 0;
vel.y := 0

% Position of the camera
var cam : Vector2
cam.x := 0;
cam.y := 0

% Size of the player
var size : Vector2
size.x := 22;
size.y := 22

% Collision booleans and directions
var isTouchingGround : boolean := false
var isTouchingWall : boolean := false
var wallDir : int := 0

% Player
proc fillbox (x : real, y : real, x2 : real, y2 : real, c : int)
    Draw.FillBox (round (x + cam.x), round (y + cam.y), round (x2 + cam.x),
	round (y2 + cam.y), c)
end fillbox

% Draws a nonexistent box for the outside of the map.
colourback (black)
fillbox (0, 0, 0, 0, RGB.AddColor (0.01, 0.01, 0.01))

%MUSIC

process Death
 Music.PlayFile ("deathsound.mp3")
end Death

process BackgroundMusic
loop
 Music.PlayFile ("Music2.mp3")
end loop
end BackgroundMusic

fork BackgroundMusic


% Move dependent of collision with level and what keys are down
proc MOVEMENT
    if (isTouchingGround) then
	if (keys (' ') and ~preKeys (' ')) then
	    vel.y += 16
	end if

	if (keys ('a')) then
	    vel.x -= 1
	end if
	if (keys ('d')) then
	    vel.x += 1
	end if
    else
	if (isTouchingWall) then
	    if (keys (' ') and ~preKeys (' ')) then
		vel.y += 16
		vel.x += 7 * wallDir
	    end if
	end if

	if (keys ('a')) then
	    vel.x -= 0.1
	end if
	if (keys ('d')) then
	    vel.x += 0.1
	end if
    end if

    % By default isTouchingGround is false
    isTouchingGround := false

    % If moving left
    if (round (vel.x) < 0) then
	% Does the player hit a wall?
	if (whatdotcolour (round (pos.x + vel.x - size.x + cam.x),
		round (pos.y - size.y + cam.y)) = black
		or whatdotcolour (round (pos.x + vel.x - size.x + cam.x),
		round (pos.y + size.y + cam.y)) = black) then
	    % Find where the player hit the wall
	    for i : round (vel.x) .. 0
		if (whatdotcolour (round (pos.x + i - size.x + cam.x),
			round (pos.y - size.y + cam.y)) ~= black
			and whatdotcolour (round (pos.x + i - size.x + cam.x),
			round (pos.y + size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.x := round (pos.x) + i;
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
    elsif (round (vel.x) > 0) then
	% Does the player hit a wall?
	if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
		round (pos.y - size.y + cam.y)) = black
		or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
		round (pos.y + size.y + cam.y)) = black) then
	    % Find where the player hit the wall
	    for decreasing i : round (vel.x) .. 0
		if (whatdotcolour (round (pos.x + i + size.x + cam.x),
			round (pos.y - size.y + cam.y)) ~= black
			and whatdotcolour (round (pos.x + i + size.x + cam.x),
			round (pos.y + size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.x := round (pos.x) + i;
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
	if (whatdotcolour (round (pos.x - 1 - size.x + cam.x),
		round (pos.y - size.y + cam.y)) = black
		or whatdotcolour (round (pos.x - 1 - size.x + cam.x),
		round (pos.y + size.y + cam.y)) = black or whatdotcolour (round (pos.x + 1 + size.x + cam.x),
		round (pos.y - size.y + cam.y)) = black or whatdotcolour (round (pos.x + 1 + size.x +
		cam.x), round (pos.y + size.y + cam.y)) = black) then
	    isTouchingWall := true
	else
	    isTouchingWall := false
	end if
    end if

    % If moving down
    if (vel.y < 0) then
	% Does the player hit a floor?
	if (whatdotcolour (round (pos.x - size.x + cam.x),
		round (pos.y + vel.y - size.y + cam.y)) = black
		or whatdotcolour (round (pos.x + size.x + cam.x),
		round (pos.y + vel.y - size.y + cam.y)) = black) then
	    % Find where the player hit the floor
	    for i : round (vel.y) .. 0
		if (whatdotcolour (round (pos.x - size.x + cam.x),
			round (pos.y + i - size.y + cam.y)) ~= black
			and whatdotcolour (round (pos.x + size.x + cam.x),
			round (pos.y + i - size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.y := round (pos.y) + i;
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
	if (whatdotcolour (round (pos.x - size.x + cam.x),
		round (pos.y + vel.y + size.y + cam.y)) = black
		or whatdotcolour (round (pos.x + size.x + cam.x),
		round (pos.y + vel.y + size.y + cam.y)) = black) then
	    % Find where the player hit the ceiling
	    for decreasing i : round (vel.y) .. 0
		if (whatdotcolour (round (pos.x - size.x + cam.x),
			round (pos.y + i + size.y + cam.y)) ~= black
			and whatdotcolour (round (pos.x + size.x + cam.x),
			round (pos.y + i + size.y + cam.y)) ~= black) then
		    % Move the player there
		    pos.y := round (pos.y) + i;
		end if
	    end for

	    vel.y := 0
	else
	    pos.y += vel.y
	end if
    end if

    % Move camera to center it on the player
    cam.x -= round ((pos.x + cam.x - maxx / 2) / 10)
    cam.y -= round ((pos.y + cam.y - maxy / 2) / 10)

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
    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = blue
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = blue)
	    then
	pos.x := 21
	pos.y := 479
	cam.x := 0
	cam.y := 0
    end if

    %Lvl up
    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = green
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = green)
	    and Lvl = 2 then
	Lvl := 3

	pos.x := 50
	pos.y := 250
	cam.x := 0
	cam.y := 0
	vel.x := 0
	vel.y := 0
    end if

    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = green
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = green)
	    and Lvl = 3 then
	Lvl := 4

	pos.x := 25
	pos.y := 290
	cam.x := 0
	cam.y := 0
	vel.x := 0
	vel.y := 0
    end if

    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = green
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = green)
	    and Lvl = 4 then
	Lvl := 5

	pos.x := 30
	pos.y := 80
	cam.x := 0
	cam.y := 0
	vel.x := 0
	vel.y := 0
    end if

    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = green
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = green)
	    and Lvl = 5 then
	Lvl := 6
    end if

    %Death system
    
    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = brightred
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = brightred) then
	fork Death
    end if
	
    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = brightred
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = brightred)
	    and Lvl = 2 then
	Lvl := 2
	pos.x := 40
	pos.y := 120
	cam.x := 0
	cam.y := 0
    end if
    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = brightred
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = brightred)
	    and Lvl = 3 then
	Lvl := 3
	pos.x := 56
	pos.y := 250
	cam.x := 0
	cam.y := 0
    end if
    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = brightred
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = brightred)
	    and Lvl = 4 then
	Lvl := 4
	pos.x := 25
	pos.y := 290
	cam.x := 0
	cam.y := 0
	vel.x := 0
	vel.y := 0
    end if

    if (whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y - size.y + cam.y)) = brightred
	    or whatdotcolour (round (pos.x + vel.x + size.x + cam.x),
	    round (pos.y + size.y + cam.y)) = brightred)
	    and Lvl = 5 then
	Lvl := 5
	pos.x := 30
	pos.y := 80
	cam.x := 0
	cam.y := 0
    end if

    % Delays
    Time.DelaySinceLast (17)


end MOVEMENT


%Running the Game

proc title

    if keys (' ') then
	%only active for space bar!
	pos.x := 30
	pos.y := 120
	Lvl := Lvl + 1

    end if



end title

proc Level1
    cls
    Pic.Draw (titlemain, 0, 0, picCopy)
    title   
    View.Update
end Level1

proc Level2
    cls
    Pic.Draw (map1, round (cam.x), round (cam.y), picCopy)
    MOVEMENT
    Pic.Draw (map1color, round (cam.x), round (cam.y), picCopy)
    fillbox (pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, brightpurple)
    if Lvl = 2 then
	drawfillbox (0, 0, 200, 750, white)
	Pic.Draw (Message, 0, -35, picMerge)
    end if
    View.Update
end Level2

proc Level3
    cls
    Pic.Draw (map2, round (cam.x), round (cam.y), picCopy)
    MOVEMENT
    Pic.Draw (map2color, round (cam.x), round (cam.y), picCopy)
    fillbox (pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, brightpurple)

    View.Update
end Level3

proc Level4
    cls
    Pic.Draw (map3, round (cam.x), round (cam.y), picCopy)
    MOVEMENT
    Pic.Draw (map3color, round (cam.x), round (cam.y), picCopy)
    fillbox (pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, brightpurple)

    

    View.Update
end Level4

proc Level5
    cls
    Pic.Draw (map4, round (cam.x), round (cam.y), picCopy)
    MOVEMENT
    Pic.Draw (map4color, round (cam.x), round (cam.y), picCopy)
    fillbox (pos.x - size.x, pos.y - size.y, pos.x + size.x, pos.y + size.y, brightpurple)
    View.Update
end Level5

proc Level6
    cls 
    Pic.Draw (end1, 0, 0, picCopy)
    View.Update
end Level6



loop
    % Get keyboard state
    Input.KeyDown (keys)

    % Exit when esc is pressed
    exit when keys (KEY_ESC)
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
    end if
end loop

Window.Update (winID)


% Close the window once the program finishes
Window.Close (winID)
