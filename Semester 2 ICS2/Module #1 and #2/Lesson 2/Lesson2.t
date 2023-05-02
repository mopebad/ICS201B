%The "Guessing Game" Program
%Choose a number at random 
%The number will be between 1 and 99
%THEN allow the USER to guess it!
var hidden,guess:int
var reply:string(1)
put "See if you can guess the mystery #"
put "It is between 1 & 99 inclusive"

loop
    var count:int:=0
    put "Do you want to play? Answer y or n:"..
    get reply
    exit when reply = "n"
    %CHECK if reply IS EQUAL to n
    %Choose a random # between 1&99
    randint(hidden,1,99)
    %randint-->Random integer
    for decreasing attempt:5..1
	put "Enter your guess"
	put "(any # between 1&99)"
	put "You have ", attempt, " attempts left"
	get guess
	count:=count+1
	if guess < hidden then
	    put "Too low!"
	elsif guess > hidden then
	    put "You passed it!"
	else
	    put "YOU GOT IT!"
	    put "You got it in ",count," tries"
	    exit
	end if
    end for
end loop
