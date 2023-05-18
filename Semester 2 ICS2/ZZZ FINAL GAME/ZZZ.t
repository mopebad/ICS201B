% ZZZ FINAL
% By : Joshua, Etode, Errari, Eathands, Ethan, Eathan, Eattai, Enigger, Ethands, Fabbytai, Eapatty.


% Movement & Position (chars = characters)
var chars : array char of boolean

% Setup Game Screen 
setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (black)
color (white)
View.Update

% Title Screen
var font : int
font := Font.New("serif:12")
var showText := true
var spacePressed := false

loop
  if showText then
    drawtext(maxx div 2, maxy div 2, "Press space to start...", 15, font)
  else
    drawtext(maxx div 2, maxy div 2, "", white, font)
  end if
  showText := not showText
  View.Update
    Input.KeyDown(chars)
    if chars(' ') then  % Check if the spacebar is pressed (ASCII value 32)
    spacePressed := true
  end if
  
  
  exit when spacePressed  % Break out of the loop when spacebar is pressed
  delay(100)  % Add a small delay to avoid excessive CPU usage
end loop



% Varaiable 'Chars' will be using keyboard inputs

var posx, posy, posx2, posy2, posx3, posy3 : int




