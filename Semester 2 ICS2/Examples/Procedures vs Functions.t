% Subroutines / Subprograms
% Functions vs Procedures

% Procedure: Takes zero or more parameters, and perform some action.

% Function: Takes one or more parameters, and returns some value.

var r : real
var x : real
var ans : real

put "Program starting"
delay(200) % delay the program for N milliseconds
put "program ending"

put "Generate random value: "..
rand(r) % Generate random value between 0 and 0.999999
	% save the value in the varaible provided as a parameter
put "Random value: ", r       

x := 5
put "Take sqaure root"
ans := sqrt(x) % function that takes the square root and RETURNS the RESULT
put "The sqaure root is ", ans
