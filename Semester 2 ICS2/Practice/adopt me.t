proc game 
var resp : string(1)
var games : int
var comms : int
var hours : real
var start : string(1)
put "The following questions must be answered with (y) or (n) understood? (type y to continue)"
get start
put "Do you play Adopt Me?"
get resp

if resp = "y" then 
    put "How many pets do you have?"
    get games
    if games > 100 then 
	put "How many bucks do you have?"
	get comms
	if comms > 20000 then
	    put "How many hours do you play a day?"
	    get hours
	    if hours > 5 then 
		put "YOU ARE GOOD AT ADOPT ME"
	    else 
		put "NOT ENOUGH PLAYTIME YOU ARE PROBABLY TRASH LMAO"
	    end if 
	 else
	    put "YOU ARE TERRIBLE UNINSTALL ROBLOX"
	 end if 
      else 
	put "YOU SUCK PLEASE GIVE ME YOUR USER AND PASS"
      end if 
   else
      put "UR SHIT"
   end if 
end game 

game
