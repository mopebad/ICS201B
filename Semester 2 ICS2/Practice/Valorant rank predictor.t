var resp : string(1)
var games : string(1)
var comms : string(1)
var hours : int
var start : string(1)
put "The following questions must be answered with (y) or (n) understood? (type y to continue)"
get start
put "Do you have 10 unrated games played?"
get resp

if resp = "y" then 
    put "Do you win your games?"
    get games
    if games = "y" then 
	put "Do you communicate?"
	get comms 
	if comms = "y" then
	    put "How many hours do you play a day?"
	    get hours
	    if hours > 5 then 
		put "Nice! You are probably plat or higher!"
	    else 
		put "Not enough practice! You are probably trash and in gold lmao"
	    end if 
	 else
	    put "You are actually terrible. You are probably in silver."
	 end if 
      else 
	put "How are you even in this rank bro. Its literally impossible to be iron."
      end if 
   else
      put "Bro... ur not even ranked. Come back when you aren't complete dogshit."
   end if 


