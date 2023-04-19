% Math equation program

% Declare Variables
var resp : real

%%% SUBPROGRAMS %%%

procedure MathE ()
    loop
	put "What is 5+5?"
	get resp
	if resp = 10 then
	    put "Congrats!"
	    exit when resp = 10
	else
	    put "Wrong! Try again."
	end if
    end loop
end MathE

%%% MAIN PROGRAM %%%

put "The program is starting up."
put "You better know your math..."
MathE ()
