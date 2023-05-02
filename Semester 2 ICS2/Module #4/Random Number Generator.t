% Generating a random number between 1 and 10 and program exits
% If generated number is 5
for i : 1 .. 20
    var random_number : int := Rand.Int (1, 10)
    put random_number
    if random_number = 5
	then
	    put "You got the exit number!"
	    exit
	else
	    put "Not the exit number! Keep waiting!"
	    delay (500)
	    cls % clear the console
    end if
end for
